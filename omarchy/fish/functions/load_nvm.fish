function load_nvm --on-variable="PWD"
  set -l nvmrc_path (nvm_find_nvmrc)
  
  if test -n "$nvmrc_path"
    set -l nvmrc_node_version (nvm use (cat $nvmrc_path))
    if string match -q "version must be installed first" $nvmrc_node_version
      nvm install
    else
      nvm use
    end
  end
end
