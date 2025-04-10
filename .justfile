# build nixvim
build:
  nix build .#

# check evaluation
check:
  nix flake check --no-build --show-trace .

# build and run nixvim
run:
  nix run .#

# update nix flake inputs
update:
  nix flake update

# opens the flake in nix repl
repl:
  nix repl --expr 'builtins.getFlake "'$(pwd)'"'
