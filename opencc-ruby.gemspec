Gem::Specification.new do |s|
  s.name               = "opencc-ruby"
  s.version            = "0.0.1"
  s.default_executable = "opencc-ruby"

  s.authors = ["Shawn Wang"]
  s.date = %q{2012-04-28}
  s.description = %q{A Ruby interface for OpenCC}
  s.email = %q{shongle@gmail.com}
  s.homepage = %q{http://rubygems.org/gems/opencc-ruby}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{OpenCC Ruby!}
  s.test_files = ["test/test_opencc.rb"]

  s.files = Dir.glob('lib/**/*.rb') +
            Dir.glob('ext/**/*{.c,.h}')
  s.extensions = ['ext/opencc-ruby/extconf.rb']
  s.executables = ['opencc-ruby']
end

