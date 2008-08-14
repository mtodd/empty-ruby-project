project_name = "project_name"

require "lib/#{project_name}"

version = Project.version
summary = ""
homepage = ""
description = ""
authors = [""]
files = %w(AUTHORS CHANGELOG LICENSE Rakefile README)

Gem::Specification.new do |s|
  s.name = project_name
  s.date = Date.today
  s.version = version
  s.summary = summary
  s.homepage = homepage
  s.description = description
  s.has_rdoc = true
  s.authors = authors
  s.files = files
end

__END__

BASEDIR = File.expand_path(File.dirname(__FILE__))

spec = Gem::Specification.new do |s|
  s.name = project[:name]
  s.rubyforge_project = project[:name]
  s.version = project[:version]
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = project[:rdoc_files]
  s.rdoc_options += project[:rdoc_opts]
  s.summary = project[:description]
  s.description = project[:description]
  s.author = project[:author]
  s.email = project[:email]
  s.homepage = project[:homepath]
  s.executables = project[:bin_files]
  s.bindir = "bin"
  s.require_path = "lib"
  project[:dependencies].each{|dep|
    s.add_dependency(dep[0], dep[1])
  }
  s.requirements << project[:requirements]
  s.required_ruby_version = project[:ruby_version_required]
  s.files = (project[:rdoc_files] + %w[Rakefile README LICENSE AUTHORS] + Dir["{spec,lib,example,support}/**/*"]).uniq
end

