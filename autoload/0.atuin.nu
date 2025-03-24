let atuin_config = (atuin init nu)
let atuin_plugin_file = ($nu.default-config-dir | path join "autoload" | path join "1.atuin.nu")
let atuin_plugin_exists = ($atuin_plugin_file | path exists)
if (not $atuin_plugin_exists or $atuin_config != ($atuin_plugin_file | open --raw)) {
  $atuin_config | save -f $atuin_plugin_file
}
