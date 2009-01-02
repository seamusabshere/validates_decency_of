module ValidatesDecencyOfTest
  module Initializer
    VENDOR_RAILS = File.expand_path('../../../../rails', __FILE__)
    OTHER_RAILS = File.expand_path('../../../rails', __FILE__)
    PLUGIN_ROOT = File.expand_path('../../', __FILE__)
    
    def self.rails_directory
      if File.exist?(VENDOR_RAILS)
        VENDOR_RAILS
      elsif File.exist?(OTHER_RAILS)
        OTHER_RAILS
      end
    end
    
    def self.load_dependencies
      if rails_directory
        $:.unshift(File.join(rails_directory, 'activesupport', 'lib'))
        $:.unshift(File.join(rails_directory, 'activerecord', 'lib'))
      else
        require 'rubygems' rescue LoadError
      end
      
      require 'activesupport'
      require 'activerecord'
      require 'active_support/testing/core_ext/test/unit/assertions'
      
      require 'rubygems' rescue LoadError
      
      require 'test/spec'
      require 'validates_decency_of'
    end
    
    def self.configure_database
      ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :dbfile => ":memory:")
      ActiveRecord::Migration.verbose = false
    end
    
    def self.setup_database
      ActiveRecord::Schema.define do
        create_table :messages do |t|
          t.string :title
          t.string :description
        end
      end
    end
    
    def self.teardown_database
      ActiveRecord::Base.connection.tables.each do |table|
        ActiveRecord::Base.connection.drop_table(table)
      end
    end
    
    def self.start
      load_dependencies
      configure_database
    end
  end
end
 
ValidatesDecencyOfTest::Initializer.start
 
class Message < ActiveRecord::Base
  validates_decency_of :title, :description
end
