{ pkgs, ... }:

let 
  vim-etlua = pkgs.vimUtils.buildVimPlugin {
    name = "vim-etlua";
    src = pkgs.fetchFromGitHub {
      owner = "VaiN474";
      repo = "vim-etlua";
      rev = "bb2974d0134ce6da60c3be0d82d809976b859c1c";
      sha256 = "sha256-jdgb5vEwCu1agZ6wirHNVkx8nb/wonyv6k8PbedTS5c=";
    };
  };
in {
  extraPlugins = [ vim-etlua ];
}
