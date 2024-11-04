{ config, pkgs, ... }:
let 
    wlogoutPath = config.var.configDirectory + "/common/home/system/wlogout";

in {
    programs.wlogout = {
        enable = true;
        layout = [
            {
                label = "lock";
                action = "${pkgs.hyprlock}/bin/hyprlock";
                text = "Lock";
                keybind = "l";
            }
            {
                label = "logout";
                action = "loginctl terminate-user $USER";
                text = "Logout";
                keybind = "e";
            }
            {
                label = "suspend";
                action = "systemctl suspend";
                text = "Suspend";
                keybind = "u";
            }
            {
                label = "shutdown";
                action = "systemctl poweroff";
                text = "Shutdown";
                keybind = "s";
            }
            {   
                label = "reboot";
                action = "systemctl reboot";
                text = "Reboot";
                keybind = "r";
            }
            {
                label = "hibernate";
                action = "systemctl hibernate";
                text = "Hibernate";
                keybind = "h";
            }
        ];
        style = #css
            ''
            * {
                background-image: none;
                box-shadow: none;
            }

            window {
                background-color: rgba(12, 12, 12, 0.9);
            }

            button {
                border-radius: 0;
                border-color: black;
                text-decoration-color: #FFFFFF;
                color: #FFFFFF;
                background-color: #1E1E1E;
                border-style: solid;
                border-width: 1px;
                background-repeat: no-repeat;
                background-position: center;
                background-size: 25%;
            }

            button:focus, button:active, button:hover {
                background-color: #3700B3;
                outline-style: none;
            }

            #lock {
                background-image: image(url("${wlogoutPath}/icons/lock.png"), url("${wlogoutPath}/icons/lock.png"));
            }

            #logout {
                background-image: image(url("${wlogoutPath}/icons/logout.png"), url("${wlogoutPath}/icons/logout.png"));
            }

            #suspend {
                background-image: image(url("${wlogoutPath}/icons/suspend.png"), url("${wlogoutPath}/icons/suspend.png"));
            }

            #hibernate {
                background-image: image(url("${wlogoutPath}/icons/hibernate.png"), url("${wlogoutPath}/icons/hibernate.png"));
            }

            #shutdown {
                background-image: image(url("${wlogoutPath}/icons/shutdown.png"), url("${wlogoutPath}/icons/shutdown.png"));
            }

            #reboot {
                background-image: image(url("${wlogoutPath}/icons/reboot.png"), url("${wlogoutPath}/icons/reboot.png"));
            }
            '';
    }
}