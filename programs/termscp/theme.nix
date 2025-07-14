{ config, ... }:
{
  home.file.".config/termscp/theme.toml".text = with config.lib.stylix.colors.withHashtag; ''
    auth_address = "${base0E}"
    auth_bookmarks = "${base0D}"
    auth_password = "${base0A}"
    auth_port = "${base04}"
    auth_protocol = "${base0D}"
    auth_recents = "${base0D}"
    auth_username = "${base0C}"

    misc_error_dialog = "${base08}"
    misc_info_dialog = "${base0C}"
    misc_input_dialog = "${base05}"
    misc_keys = "${base05}"
    misc_quit_dialog = "${base09}"
    misc_save_dialog = "${base0D}"
    misc_warn_dialog = "${base0A}"

    transfer_local_explorer_background = "${base00}"
    transfer_local_explorer_foreground = "${base05}"
    transfer_local_explorer_highlighted = "${base0D}"

    transfer_log_background = "${base00}"
    transfer_log_window = "${base04}"

    transfer_progress_bar_full = "${base0B}"
    transfer_progress_bar_partial = "${base0B}"

    transfer_remote_explorer_background = "${base00}"
    transfer_remote_explorer_foreground = "${base05}"
    transfer_remote_explorer_highlighted = "${base0D}"

    transfer_status_hidden = "${base0E}"
    transfer_status_sorting = "${base0A}"
    transfer_status_sync_browsing = "${base0C}"
  '';
}
