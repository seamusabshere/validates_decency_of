require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "validates_decency_of"
    gem.summary = %Q{Rails plugin that uses George Carlin's list of seven dirty words (aka swear words, aka cuss words) to check for decency on ActiveRecord model attributes.}
    gem.description = %Q{Rails plugin that uses George Carlin's list of seven dirty words (aka swear words, aka cuss words) to check for decency on ActiveRecord model attributes.}
    gem.email = "seamus@abshere.net"
    gem.homepage = "http://github.com/seamusabshere/validates_decency_of"
    gem.authors = ["Seamus Abshere"]
    gem.add_dependency 'activesupport', '>=2.3.4'
    gem.add_dependency 'activerecord', '>=2.3.4'
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
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

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "validates_decency_of #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
