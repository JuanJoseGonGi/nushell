$env.BUN_INSTALL = ($env.HOME | path join .bun)
use std "path add"
path add ($env.BUN_INSTALL | path join bin)

