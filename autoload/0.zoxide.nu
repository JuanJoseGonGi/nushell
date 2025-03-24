let zoxide_config = (zoxide init nushell)
let zoxide_plugin_file = ($nu.default-config-dir | path join "autoload" | path join "1.zoxide.nu")
let zoxide_plugin_exists = ($zoxide_plugin_file | path exists)
if (not $zoxide_plugin_exists or $zoxide_config != ($zoxide_plugin_file | open --raw)) {
    $zoxide_config | save -f $zoxide_plugin_file
}

