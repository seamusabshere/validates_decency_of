Gem::Specification.new do |s|
  s.name     = "validates_decency_of"
  s.version  = "1.3"
  s.date     = "2009-01-02"
  s.summary  = "Rails plugin that uses George Carlin's list of seven dirty words (aka swear words, aka cuss words) to check for decency on ActiveRecord model attributes."
  s.email    = "seamus@abshere.net"
  s.homepage = "http://github.com/seamusabshere/validates_decency_of"
  s.description = "Rails plugin that uses George Carlin's list of seven dirty words (aka swear words, aka cuss words) to check for decency on ActiveRecord model attributes."
  s.has_rdoc = false
  s.authors  = "Seamus Abshere"
  s.files    = [
    "validates_decency_of.gemspec",
    "lib/is_decent.rb",
    "lib/validates_decency_of.rb",
    "MIT-LICENSE",
    "Rakefile",
    "README",
    "tasks/validates_decency_of_tasks.rake",
    "init.rb",
    "rails/init.rb",
    "test/test_helper.rb"
    ]
  s.test_files = [  
    "test/validates_decency_of_test.rb",
    "test/is_decent_test.rb"
    ]
end
