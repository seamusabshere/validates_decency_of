require File.dirname(__FILE__) + '/test_helper'

class Message < ActiveRecord::Base
  validates_decency_of :title, :description
end

class DecencyValidationTest < Test::Unit::TestCase
  fixtures :messages

  def test_should_not_die_on_empty_strings
    message = messages(:decent)
    message.description = nil
    assert message.valid?
  end

  def test_should_recognize_decent_strings
    assert messages(:decent).valid?
  end
  
  def test_should_recognize_indecent_strings
    message = messages(:indecent)
    assert !message.valid?
    assert_not_nil message.errors.on(:title)
    assert_not_nil message.errors.on(:description)
  end
end
