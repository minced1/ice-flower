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
		"pipewire/pipewire.d/pipewire.conf".text = ''
context.objects = [
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
];
		  '';
		};
}
