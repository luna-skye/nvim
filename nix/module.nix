{ inputs, ... }: {
  imports = [ inputs.nixvim.homeManagerModules.nixvim ];
  programs.nixvim = {
    enable = true;
    imports = [ "${inputs.self}/nix/nixvim.nix" ];
  };
}
