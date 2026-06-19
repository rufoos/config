if status is-interactive
  # Commands to run in interactive sessions can go here
  fish_default_key_bindings
end

# auto use/install node version from .nvmrc file
load_nvm > /dev/stderr

set -gx ALGOLIA_LOCAL_UNIQUE_NAME "kfeirby"
