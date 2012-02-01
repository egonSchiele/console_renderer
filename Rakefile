require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "console_renderer"
    gem.summary = %Q{A renderer for Redcarpet. Render Markdown to the command line!}
    gem.description = %Q{A renderer for Redcarpet. Render Markdown to the command line! See homepage for usage.}
    gem.email = "bluemangroupie@gmail.com"
    gem.homepage = "http://github.com/egonschiele/console_renderer"
    gem.authors = ["Aditya Bhargava"]
    gem.executables = "console_renderer"
    gem.add_development_dependency "redcarpet", ">= 0"
    gem.add_development_dependency "rainbow", ">= 0"
    gem.add_development_dependency "syntax", ">= 0"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

begin
  require 'rcov/rcovtask'
  Rcov::RcovTask.new do |test|
    test.libs << 'test'
    test.pattern = 'test/**/test_*.rb'
    test.verbose = true
  end
rescue LoadError
  task :rcov do
    abort "RCov is not available. In order to run rcov, you must: sudo gem install spicycode-rcov"
  end
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = ''
  rdoc.title = "console_renderer #{version}"
  rdoc.rdoc_files.include('README*')
end
