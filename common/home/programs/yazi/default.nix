{ pkgs, ... }:
let
yazi-plugins = pkgs.fetchFromGitHub {
	owner = "yazi-rs";
	repo = "plugins";
    rev = "4a6edc3";
	hash = "sha256-RYa7wbFGZ9citYYdF9FYJwzUGBmIUvNBdORpBPb6ZnQ=";
};
in {
    programs.yazi = {
        enable = true;
        enableZshIntegration = true;
		shellWrapperName = "y";

        settings = {
            manager = {
                ratio = [2 5 3];
                sort_by = "natural";
                sort_dir_first = true;
                sort_translit = true;
            };
            preview = {
                wrap = "yes";
                tab_size = 4;
                max_width = 1000;
				max_height = 1000;
            };
            plugin = {
                prepend_fetchers = [
                    {
                        id   = "git";
                        name = "*";
                        run  = "git";
                    }
                    {
                        id   = "git";
                        name = "*/";
                        run  = "git";
                    }
                ];
                prepend_previewers= [
	                { name = "*/"; run = "eza-preview"; }
                ];
            };
        };

        plugins = {
            chmod = "${yazi-plugins}/chmod.yazi";
            full-border = "${yazi-plugins}/full-border.yazi";
            max-preview = "${yazi-plugins}/max-preview.yazi";
            hide-preview = "${yazi-plugins}/hide-preview.yazi";
            git = "${yazi-plugins}/git.yazi";
            starship = pkgs.fetchFromGitHub {
				owner = "Rolv-Apneseth";
				repo = "starship.yazi";
                rev = "77a65f5";
				sha256 = "sha256-sAB0958lLNqqwkpucRsUqLHFV/PJYoJL2lHFtfHDZF8=";
			};
            eza-preview = pkgs.fetchFromGitHub {
				owner = "sharklasers996";
				repo = "eza-preview.yazi";
                rev = "7ca4c25";
				sha256 = "sha256-ncOOCj53wXPZvaPSoJ5LjaWSzw1omHadKDrXdIb7G5U=";
			};
            lazygit = pkgs.fetchFromGitHub {
				owner = "Lil-Dank";
				repo = "lazygit.yazi";
                rev = "c82794f";
				sha256 = "sha256-m2zITkjGrUjaPnzHnnlwA6d4ODIpvlBfIO0RZCBfL0E=";
			};
        };

        initLua = ''
			require("full-border"):setup()
			require("starship"):setup()
            require("git"):setup()

            if os.getenv("NVIM") then
	            require("hide-preview"):entry()
            end
		'';

        keymap = {
			manager.prepend_keymap = [
				{
					on = ["T" "m"];
					run = "plugin --sync max-preview";
					desc = "Maximize or restore the preview pane";
				}
                {
					on = ["T" "h"];
					run = "plugin --sync hide-preview";
					desc = "Hide or show preview";
				}
				{
					on = ["c" "m"];
					run = "plugin chmod";
					desc = "Chmod on selected files";
				}
                {
                    on = "E";
                    run = "plugin eza-preview";
                    desc = "Toggle tree/list dir preview";
                }
                {
                    on = ["g" "i"];
                    run = "plugin lazygit";
                    desc = "run lazygit";
                }
			];
		};
    };

    # This is very scuffed but idc
    xdg.desktopEntries.yazi = {
        name = "Yazi";
        icon = "yazi";
        comment = "Blazing fast terminal file manager written in Rust, based on async I/O";
        genericName = "File Manager";
        exec = ''kitty --class=yazi zsh -c "yazi %u; exit"'';
        terminal = false;
        type = "Application";
        mimeType = [ "inode/directory" ];
        categories = [ "Utility" "Core" "System" "FileTools" "FileManager" "ConsoleOnly" ];
        settings = {
            TryExec = "yazi";
            Keywords = "File;Manager;Explorer;Browser;Launcher";
            StartupWMClass = "yazi";
        };
    };

    home.packages = with pkgs; [ ffmpegthumbnailer jq poppler fd ripgrep imagemagick ];
}