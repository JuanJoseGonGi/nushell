source ~/.config/nushell/dotenv.nu

let path_from_string = {|s| $s | split row (char esep) | path expand --no-symlink}
let path_to_string =  {|v| $v | path expand --no-symlink | str join (char esep)}

$env.ENV_CONVERSIONS = {
    "PATH": {
        from_string: $path_from_string
        to_string: $path_to_string
    }
    "Path": {
        from_string: $path_from_string
        to_string: $path_to_string
    }
}

use std "path add"

$env.SHELL = (which nu | get path.0)

$env.BUN_INSTALL = ($env.HOME | path join .bun)
path add ($env.BUN_INSTALL | path join bin)

$env.PNPM_HOME = ($env.HOME | path join .pnpm)
path add $env.PNPM_HOME

path add /usr/bin/go ($env.HOME | path join go/bin)

path add /usr/bin/vendor_perl

path add ~/.cargo/bin

path add /opt/cuda/bin

path add ~/.turso

path add ~/.local/bin

$env.DOCKER_HOST = 'unix:///run/podman/podman.sock'

$env.COLORTERM = 'truecolor'
$env.EDITOR = (which nvim | get path.0)
$env.PAGER = 'less'
$env.TERM = 'xterm-256color'
$env.BROWSER = 'wsl-open'

$env.CARAPACE_BRIDGES = 'zsh,fish,bash,inshellisense'
let carapace_config = (carapace _carapace nushell)
let carapace_plugin_file = "~/.config/nushell/plugins/carapace.nu"
let carapace_plugin_exists = ($carapace_plugin_file | path exists)
if (not $carapace_plugin_exists or $carapace_config != ($carapace_plugin_file | open --raw)) {
  carapace _carapace nushell | save --force $carapace_plugin_file
}

let zoxide_config = (zoxide init nushell)
let zoxide_plugin_file = "~/.config/nushell/plugins/zoxide.nu"
let zoxide_plugin_exists = ($zoxide_plugin_file | path exists)
if (not $zoxide_plugin_exists or $zoxide_config != ($zoxide_plugin_file | open --raw)) {
    zoxide init nushell | save -f $zoxide_plugin_file
}

let starship_config = (starship init nu)
let starship_plugin_file = "~/.config/nushell/plugins/starship.nu"
let starship_plugin_exists = ($starship_plugin_file | path exists)
if (not $starship_plugin_exists or $starship_config != ($starship_plugin_file | open --raw)) {
    starship init nu | save -f $starship_plugin_file
}
