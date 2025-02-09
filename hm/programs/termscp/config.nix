{ lib, ... }:
{
  home.file.".config/termcp/config.toml".text = ''
    [user_interface]
    text_editor = ${lib.getEnv EDITOR}
    default_protocol = "SFTP"
    show_hidden_files = false
    check_for_updates = false
    prompt_on_file_replace = true
    group_dirs = "first"
    notifications = true
    notification_threshold = 536870912

    [remote.ssh_keys]
  '';
}
