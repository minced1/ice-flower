{ config, lib, pkgs, ... }:
{
	# nixpkgs.config.packageOverrides = pkgs: {
	# 	vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
	# };

	# Enable OpenGL
	hardware.opengl = {
		enable = true;
		driSupport = true;
		driSupport32Bit = true;
		extraPackages = with pkgs; [
			#intel-media-driver # LIBVA_DRIVER_NAME=iHD
			#vaapiIntel				 # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
			nvidia-vaapi-driver
		# 	vaapiVdpau
		# 	libvdpau-va-gl
		];
	};

	# Load nvidia driver for Xorg and Wayland
	services.xserver.videoDrivers = ["nvidia"];

		hardware.nvidia = {

			# Modesetting is required.
			modesetting.enable = true;

			# Enable power management (do not disable this unless you have a reason to).
			# Likely to cause problems on laptops and with screen tearing if disabled.
			powerManagement.enable = true;
			# Fine-grained power management. Turns off GPU when not in use.
			# Experimental and only works on modern Nvidia GPUs (Turing or newer).
			powerManagement.finegrained = false;


			# Use the NVidia open source kernel module (not to be confused with the
			# independent third-party "nouveau" open source driver).
			# Support is limited to the Turing and later architectures. Full list of
			# supported GPUs is at:
			# https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
			# Only available from driver 515.43.04+
			# Do not disable this unless your GPU is unsupported or if you have a good reason to.
			open = true;

			# Enable the Nvidia settings menu,
		# accessible via `nvidia-settings`.
			nvidiaSettings = true;

			# Optionally, you may need to select the appropriate driver version for your specific GPU.
			package = config.boot.kernelPackages.nvidiaPackages.stable;
		};
}