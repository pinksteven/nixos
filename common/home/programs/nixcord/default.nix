{ inputs, ... }:
{
  imports = [
    inputs.nixcord.homeManagerModules.nixcord
    ./theme.nix
  ];
  programs.nixcord = {
    enable = true;
    config = {
      useQuickCss = true;
      frameless = true;
      disableMinSize = true;
      themeLinks = [ "https://refact0r.github.io/midnight-discord/midnight.css" ];
      enabledThemes = [ "nixnight.css" ];

      plugins = {
        alwaysAnimate.enable = true;
        alwaysExpandRoles.enable = true;
        alwaysTrust.enable = true;
        anonymiseFileNames.enable = true;
        betterGifAltText.enable = true;
        betterSettings.enable = true;
        betterUploadButton.enable = true;
        biggerStreamPreview.enable = true;
        blurNSFW.enable = true;
        callTimer.enable = true;
        clearURLs.enable = true;
        copyFileContents.enable = true;
        copyUserURLs.enable = true;
        crashHandler.enable = true;
        disableCallIdle.enable = true;
        fakeNitro.enable = true;
        fakeProfileThemes.enable = true;
        fixImagesQuality.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        gameActivityToggle.enable = true;
        gifPaste.enable = true;
        hideAttachments.enable = true;
        mentionAvatars.enable = true;
        noReplyMention.enable = true;
        openInApp.enable = true;
        platformIndicators.enable = true;
        readAllNotificationsButton.enable = true;
        roleColorEverywhere.enable = true;
        shikiCodeblocks.enable = true;
        showMeYourName.enable = true;
        silentTyping = {
          enable = true;
          showIcon = true;
        };
        spotifyControls = {
          enable = true;
          hoverControls = true;
        };
        typingTweaks.enable = true;
        userVoiceShow.enable = true;
        validReply.enable = true;
        voiceChatDoubleClick.enable = true;
        viewIcons.enable = true;
        whoReacted.enable = true;
        newGuildSettings = {
          enable = true;
          messages = "only@Mentions";
        };
      };
    };
  };
}
