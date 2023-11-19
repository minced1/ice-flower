{ config, lib, pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		jellyfin-web
	];

	services.jellyfin = {
		enable = true;
		openFirewall = true;
	};

	services.caddy = {
		enable = true;
		virtualHosts."neverlandpirate.crabdance.com".extraConfig = ''
			encode gzip
			file_server
			root * ${
				pkgs.runCommand "testdir" {} ''
					mkdir "$out"
					echo hello world > "$out/example.html"
				''
			}
		'';
	};
	networking.firewall.allowedTCPPorts = [ 80 443];

 #	services.nginx = {
 #		enable = true;
 #		recommendedGzipSettings = true;
 #		recommendedOptimisation = true;
 #		recommendedProxySettings = true;
 #		recommendedTlsSettings = true;
		# other Nginx options
 #		virtualHosts."jellyfin.neverland.me" =	{
 #			enableACME = true;
 #			forceSSL = true;
 #			locations."/" = {
 #				proxyPass = "http://localhost:8096";
 #				proxyWebsockets = true; # needed if you need to use WebSocket
 #				extraConfig =
					# required when the target is also TLS server with multiple hosts
 #					"proxy_ssl_server_name on;" +
					# required when the server wants to use HTTP Authentication
 #					"proxy_pass_header Authorization;"
 #					;
 #			};
 #		};
	# };

	# security.acme = {
 #		acceptTerms = true;
 #		certs = {
 #			"jellyfin.neverland.me".email = "n.gude@proton.me";
 #		};
	# };
}
