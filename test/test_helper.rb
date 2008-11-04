# thanks to Fingertips

$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'test/unit'
require File.dirname(__FILE__) + '/../../../../config/environment'
require 'active_record/fixtures'

config = { :adapter => 'sqlite3', :database => ':memory:' }
ActiveRecord::Base.logger = Logger.new(File.dirname(__FILE__) + '/debug.log')
ActiveRecord::Base.establish_connection(config)

load File.dirname(__FILE__) + '/schema.rb'

Test::Unit::TestCase.fixture_path = File.dirname(__FILE__) + '/fixtures/'
$LOAD_PATH.unshift(Test::Unit::TestCase.fixture_path)

begin
  require 'ruby-debug'
rescue LoadError
end

class Test::Unit::TestCase #:nodoc:
  def create_fixtures(*table_names)
    if block_given?
      Fixtures.create_fixtures(Test::Unit::TestCase.fixture_path, table_names) { yield }
    else
      Fixtures.create_fixtures(Test::Unit::TestCase.fixture_path, table_names)
    end
  end

  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false

  # Add more helper methods to be used by all tests here...
end
