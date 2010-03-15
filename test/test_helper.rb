require 'rubygems'
require 'test/unit'
require 'ruby-debug'
require 'active_record'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'validates_decency_of'

class Test::Unit::TestCase
end

ActiveRecord::Base.establish_connection(
  'adapter' => 'sqlite3',
  'database' => 'test/test.sqlite3'
)
