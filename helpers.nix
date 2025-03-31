{ ... }: let
  mkKeymap = mode: lhs: rhs: desc: {
    mode = mode;
    key = lhs;
    action = rhs;
    options = {
      silent = true;
      noremap = true;
      desc = desc;
    };
  };
in {
  mkKeymap = mkKeymap;
}
