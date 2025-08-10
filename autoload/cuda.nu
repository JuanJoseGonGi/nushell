$env.CUDA_HOME = "/opt/cuda"
use std "path add"
path add ($env.CUDA_HOME | path join "bin")
