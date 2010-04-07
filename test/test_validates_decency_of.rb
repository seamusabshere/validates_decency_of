require 'test_helper'

ActiveRecord::Schema.define do
  create_table :messages, :force => true do |t|
    t.string :title
    t.string :description
  end
end

class Message < ActiveRecord::Base
  validates_decency_of :title, :description
end

class TestValidatesDecencyOf < Test::Unit::TestCase
  def setup
    @decent = Message.new :title => 'Hello world', :description => 'I am clean'
    @indecent = Message.new :title => 'Hello f*u*c*k*i*n*g world', :description => 'I am ~-S-h-I-t-T-y-~'
  end

  def test_should_not_die_on_empty_strings
    @decent.description = nil
    assert @decent.valid?
  end
  
  def test_should_allow_decent_strings
    assert @decent.valid?
  end
  
  def test_should_disallow_indecent_strings
    assert_equal false, @indecent.valid?
    if ActiveRecord::VERSION::MAJOR == 2
      assert @indecent.errors.on(:title).present?
      assert @indecent.errors.on(:description).present?
    elsif ActiveRecord::VERSION::MAJOR == 3
      assert @indecent.errors[:title].present?
      assert @indecent.errors[:description].present?
    else
      raise "don't know what to do"
    end
  end
end
