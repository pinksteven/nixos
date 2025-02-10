{
  programs.yazi.settings.plugin.prepend_previewers = [
    {
      name = "*/";
      run = "eza-preview";
    }

    # Archive previewer
    {
      name = "application/*zip";
      run = "ouch";
    }
    {
      name = "application/x-tar";
      run = "ouch";
    }
    {
      name = "application/x-bzip2";
      run = "ouch";
    }
    {
      name = "application/x-7z-compressed";
      run = "ouch";
    }
    {
      name = "application/x-rar";
      run = "ouch";
    }
    {
      name = "application/x-xz";
      run = "ouch";
    }
  ];
}
