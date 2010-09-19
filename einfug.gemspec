require File.join(File.dirname(__FILE__), 'lib', 'einfug')

Gem::Specification.new do |s|
  s.name = 'einfug'
  s.version = Einfug::VERSION
  s.summary = 'Pastie helper'
  s.description = 'Transform files and directories in a pastable form'

  s.author = 'Tobias Bühlmann'
  s.email = 'tobias.buehlmann@gmx.de'
  s.homepage = 'http://github.com/tbuehlmann/einfug'

  s.required_ruby_version = '>= 1.8.6'
  s.files = ['einfug.gemspec',
             'LICENSE',
             'README.md',
             'bin/einfug', 
             'lib/einfug.rb']
  s.executables = ['einfug']
end

