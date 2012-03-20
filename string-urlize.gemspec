# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "string-urlize/version"

Gem::Specification.new do |s|
  s.name        = "string-urlize"
  s.version     = StringUrlize::VERSION
  s.authors     = ["Ivan Garmatenko"]
  s.email       = %w(cheef.che@gmail.ru)
  s.homepage    = "https://github.com/cheef/string-urlize"
  s.summary     = %q{Converts string to friendly url}
  s.description = %q{Extends ruby "String" class with "urlize" method which converts string to friendly url. It
removes all characters that couldn't be used in url and replaces spaces/underscores with dashes. In addition it
transliterate string using I18n library.}

  s.rubyforge_project = "string-urlize"

  s.files = []
  %w(lib).each do |folder|
    s.files += Dir.glob("#{folder}/**/*.*")
  end

  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = %w(lib)

  s.add_runtime_dependency 'i18n', '~> 0.5.0'
  s.add_development_dependency "cucumber", '~> 1.1.9'
  s.add_development_dependency "rspec", '~> 2.9'
end
