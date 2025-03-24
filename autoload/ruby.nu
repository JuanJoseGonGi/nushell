use std "path add"
path add ~/.local/share/gem/ruby/3.3.0/bin
$env.RUBY_CONFIGURE_OPTS = "--enable-shared"
$env.RUBY_GC_MALLOC_LIMIT = "1000000000"
$env.RUBY_GC_OLDMALLOC_LIMIT = "1000000000"
