let starship_config = (starship init nu)
let starship_plugin_file = ($nu.default-config-dir | path join "autoload" | path join "zzzz.starship.nu")
let starship_plugin_exists = ($starship_plugin_file | path exists)
if (not $starship_plugin_exists or $starship_config != ($starship_plugin_file | open --raw)) {
    $starship_config | save -f $starship_plugin_file
}
