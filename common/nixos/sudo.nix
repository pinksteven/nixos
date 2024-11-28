{
  security.sudo.enable = false;
  security.sudo-rs = {
    enable = true;
    extraRules = [
      {
        groups = [ "ALL" ];
        commands = [
          {
            command = "framework-tool --power";
            options = [ "NOPASSWD" ];
          }
          {
            command = "framework-tool --kblight";
            options = [ "NOPASSWD" ];
          }
          {
            command = "framework-tool --thermal";
            options = [ "NOPASSWD" ];
          }

        ];
      }
    ];
  };
}
