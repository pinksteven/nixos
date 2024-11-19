{
  programs.nixvim.filetype = {
    extension = {
      "avsc" = "json";
      "rasi" = "scss";
      "ignore" = "gitignore";
    };

    programs.nixvim.pattern = {
      ".*/hypr/.*%.conf" = "hyprlang";
      "flake.lock" = "json";
      ".*helm-chart*.yaml" = "helm";
    };
  };
}