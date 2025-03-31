# build nixvim
build:
  nix run .#

# check evaluation
check:
  nix flake check --no-build --show-trace .

# update nix flake inputs
update:
  nix flake update

# opens the flake in nix repl
repl:
  nix repl --expr 'builtins.getFlake "'$(pwd)'"'
