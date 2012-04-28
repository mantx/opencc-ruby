require 'mkmf'

# :stopdoc:

RbConfig::MAKEFILE_CONFIG['CC'] = ENV['CC'] if ENV['CC']

# --with-opencc-{dir,include,lib}
dir_config("opencc")

# prioritize local builds
if enable_config("local", false)
  $LDFLAGS = ENV.fetch("LDFLAGS", nil)
end

if RbConfig::CONFIG["host_os"] =~ /mswin/
  $CFLAGS << ' -W3'
end

def asplode missing
  abort "#{missing} is missing. Install opencc from " +
          "https://github.com/BYVoid/OpenCC first."
end


asplode 'opencc.h' unless find_header  'opencc/opencc.h'
#asplode 'opencc' unless find_library 'opencc', 'opencc_open'
$LDFLAGS << " -lopencc -lintl"

have_func('opencc_open');
have_func('opencc_convert');
have_func('opencc_close');

create_makefile('opencc-ruby/opencc')
