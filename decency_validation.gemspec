Gem::Specification.new do |s|
  s.name     = "decency_validation"
  s.version  = "1.0"
  s.date     = "2008-12-29"
  s.summary  = "Rails plugin that uses George Carlin's list of seven dirty words (aka swear words, aka cuss words) to check for decency on ActiveRecord model attributes."
  s.email    = "seamus@abshere.net"
  s.homepage = "http://github.com/seamusabshere/decency_validation"
  s.description = "Rails plugin that uses George Carlin's list of seven dirty words (aka swear words, aka cuss words) to check for decency on ActiveRecord model attributes."
  s.has_rdoc = false
  s.authors  = "Seamus Abshere"
  s.files    = [
    "decency_validation.gemspec",
    "lib/decency_validation.rb",
    "lib/is_decent.rb",
    "lib/validates_decency_of.rb",
    "MIT-LICENSE",
    "Rakefile",
    "README",
    "tasks/decency_validation_tasks.rake",
    ]
  s.test_files = [  
    "test/decency_validation_test.rb",
    "test/test_helper.rb"
    ]
end
