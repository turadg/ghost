GEM = "ghost"
GEM_VERSION = [0,3,0]
AUTHOR = "Bodaniel Jeanes"
EMAIL = "me@bjeanes.com"
HOMEPAGE = "http://github.com/bjeanes/ghost"
SUMMARY = "Allows you to create, list, and modify local hostnames"

spec = Gem::Specification.new do |s|
  s.name = GEM
  s.rubyforge_project = GEM
  s.version = GEM_VERSION.join('.')
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.md", "LICENSE", 'TODO']
  s.rdoc_options << '--line-numbers'
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.executables << 'ghost'
  s.executables << 'ghost-ssh'
  s.autorequire = GEM
  s.files = %w(LICENSE README.md Rakefile TODO) + Dir.glob("{bin,lib,spec}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "Install the gem locally"
task :install => [:package] do
  sh %{sudo gem install pkg/#{GEM}-#{GEM_VERSION.join('.')}}
end

desc "Create a gemspec file"
task :make_spec do
  File.open("#{GEM}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

desc "Clean packages (alias for clobber_package)"
task :clean => :clobber_package
