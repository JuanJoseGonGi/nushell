$env.PNPM_HOME = ($env.HOME | path join .pnpm)
use std "path add"
path add $env.PNPM_HOME
