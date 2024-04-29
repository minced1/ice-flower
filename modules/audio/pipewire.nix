{ config, lib, pkgs, ... }:

{
	# Enable sound with pipewire.
	sound.enable = false;
	hardware.pulseaudio.enable = false;
	security.rtkit.enable = true;
	services.pipewire = {
		enable = true;
		alsa.enable = true;
		alsa.support32Bit = true;
		pulse.enable = true;
		# If you want to use JACK applications, uncomment this
		jack.enable = true;
		extraConfig.pipewire = {
			"92-low-latency" = {
				context.properties = {
					default.clock.rate = 48000;
					default.clock.quantum = 32;
					default.clock.min-quantum = 32;
					default.clock.max-quantum = 32;
				};
			};
			"91-null-sinks" = {
				context.objects = [
				{
					# A default dummy driver. This handles nodes marked with the "node.always-driver"
					# properyty when no other driver is currently active. JACK clients need this.
					factory = "spa-node-factory";
					args = {
						factory.name     = "support.node.driver";
						node.name        = "Dummy-Driver";
						priority.driver  = 8000;
					};
				}
				{
					factory = "adapter";
					args = {
						factory.name     = "support.null-audio-sink";
						node.name        = "Microphone-Proxy";
						node.description = "Microphone";
						media.class      = "Audio/Source/Virtual";
						audio.position   = "MONO";
					};
				}
				{
					factory = "adapter";
					args = {
						factory.name     = "support.null-audio-sink";
						node.name        = "Main-Output-Proxy";
						node.description = "Main Output";
						media.class      = "Audio/Sink";
						audio.position   = "FL,FR";
					};
				}
				];
			};
			# "ua-volt4" = {
			# 	context.modules = [
			# 		{	name = "libpipewire-module-loopback";
			# 			args = {
			# 				node.description = "Volt 4 Microphone";
			# 				capture.props = {
			# 					node.name = "capture.V4_Mic";
			# 					audio.position = "FL";
			# 					stream.dont-remix = true;
			# 					target.object = "alsa_input.usb-Universal_Audio_Volt_4_22312055007115-00.analog-surround-40nisd ";
			# 					node.passive = true;
			# 				};
			# 				playback.props = {
			# 					node.name = "V4_Mic";
			# 					media.class = "Audio/Source";
			# 					audio.position = "MONO";
			# 				};
			# 			};
			# 		}
			# 		{	name = "libpipewire-module-loopback";
			# 			args = {
			# 				node.description = "Volt 4 Guitar";
			# 				capture.props = {
			# 					node.name = "capture.V4_Guitar";
			# 					audio.position = "FR";
			# 					stream.dont-remix = true;
			# 					target.object = "alsa_input.usb-Universal_Audio_Volt_4_22312055007115-00.analog-surround-40";
			# 					node.passive = true;
			# 				};
			# 				playback.props = {
			# 					node.name = "V4_Guitar";
			# 					media.class = "Audio/Source";
			# 					audio.position = "MONO";
			# 				};
			# 			};
			# 		}
			# 	];
			# };
		};
	};
}
