$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
let carapace_config = (carapace _carapace nushell)
let carapace_plugin_file = ($nu.default-config-dir | path join "autoload" | path join "1.carapace.nu")
let carapace_plugin_exists = ($carapace_plugin_file | path exists)
if (not $carapace_plugin_exists or $carapace_config != ($carapace_plugin_file | open --raw)) {
  $carapace_config | save -f $carapace_plugin_file
}
