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
	};

	environment.etc = {
"pipewire/pipewire.conf.d/92-low-latency.conf".text = ''
context.properties = {
	default.clock.rate = 48000
	default.clock.allowed-rates = [ 48000 96000 ]
	default.clock.min-quantum = 32
	default.clock.max-quantum = 8192
	default.clock.quantum = 256
	default.clock.quantum-limit = 8192
}
		'';
		"pipewire/pipewire.conf.d/ua-volt4.conf".text = ''
context.modules = [
{	name = "libpipewire-module-loopback"
	args = {
		node.description = "Volt 4 Microphone"
		capture.props = {
			node.name = "capture.V4_Mic"
			audio.position = [ FL ]
			stream.dont-remix = true
			target.object = "alsa_input.usb-Universal_Audio_Volt_4_22312055007115-00.analog-surround-40"
			node.passive = true
		}
		playback.props = {
			node.name = "V4_Mic"
			media.class = "Audio/Source"
			audio.position = [ MONO ]
		}
	}
}
{	name = "libpipewire-module-loopback"
	args = {
		node.description = "Volt 4 Guitar"
		capture.props = {
			node.name = "capture.V4_Guitar"
			audio.position = [ FR ]
			stream.dont-remix = true
			target.object = "alsa_input.usb-Universal_Audio_Volt_4_22312055007115-00.analog-surround-40"
			node.passive = true
		}
		playback.props = {
			node.name = "V4_Guitar"
			media.class = "Audio/Source"
			audio.position = [ MONO ]
		}
	}
}
		  '';
		};
}
