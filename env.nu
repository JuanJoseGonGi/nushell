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

$env.ASDF_DIR = '/opt/asdf-vm/'

path add /usr/bin/vendor_perl

path add ~/.cargo/bin

$env.COLORTERM = 'truecolor'
$env.EDITOR = (which nvim | get path.0)
$env.PAGER = 'less'
$env.TERM = 'xterm-256color'
$env.BROWSER = 'wsl-open'

let zoxide_config = (zoxide init nushell)
if ($zoxide_config != (cat ~/.config/nushell/plugins/zoxide.nu)) {
    zoxide init nushell | save -f ~/.config/nushell/plugins/zoxide.nu
}

let starship_config = (starship init nu)
if ($starship_config != (cat ~/.config/nushell/plugins/starship.nu)) {
    starship init nu | save -f ~/.config/nushell/plugins/starship.nu
}
