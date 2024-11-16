{ pkgs, ... }:
let
yazi-plugins = pkgs.fetchFromGitHub {
	owner = "yazi-rs";
	repo = "plugins";
    rev = "4a6edc3";
	hash = "";
};
in {
    programs.yazi = {
        enable = true;
        enableZshIntegration = true;

        plugins = {
            chmod = "${yazi-plugins}/chmod.yazi";
            full-border = "${yazi-plugins}/full-border.yazi";
            max-preview = "${yazi-plugins}/max-preview.yazi";
            git = "${yazi-plugins}/max-preview.yazi";
            starship = pkgs.fetchFromGitHub {
				owner = "Rolv-Apneseth";
				repo = "starship.yazi";
                rev = "77a65f5";
				sha256 = "";
			};
            eza-preview = pkgs.fetchFromGitHub {
				owner = "sharklasers996";
				repo = "eza-preview.yazi";
                rev = "7ca4c25";
				sha256 = "";
			};
            lazygit = pkgs.fetchFromGitHub {
				owner = "Lil-Dank";
				repo = "lazygit.yazi";
                rev = "c82794f";
				sha256 = "";
			};
        };
        
        initLua = ''
			require("full-border"):setup()
			require("starship"):setup()
		'';
    };

    home.packages = with pkgs; [ ffmpegthumbnailer jq poppler fd ripgrep imagemagick ];
}