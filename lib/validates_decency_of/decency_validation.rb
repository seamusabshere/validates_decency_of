# based on http://svn.savvica.com/public/plugins/phone_validation/lib/validates_phone_authenticity_of/phone_validation.rb

require 'active_record'

# Include this into ActiveRecord::Base to make validates_decency_of
# available to all models
module DecencyValidation
  module ClassMethods
    # Uses George Carlin's list of "seven dirty words" to "check for decency" (ahem)
    # http://en.wikipedia.org/wiki/Seven_dirty_words
    # Future versions will support adding/removing from this list
    # Ex:
    #
    # class Message < ActiveRecord::Base
    #   validates_decency_of :title, :description
    # end
    #
    # Configuration Options
    #
    # [<tt>:message</tt>] A custom error message (default is: "is invalid")
    #
    def validates_decency_of(*attribute_names)
      options = { :message => 'is invalid' }
      options.merge!(attribute_names.pop) if attribute_names.last.kind_of?(Hash)
      options.merge! :on => :save
      validates_each(attribute_names, options) do |record, attribute_name, value|
        record.errors.add attribute_name, options[:message] unless DecentString.new(value.to_s).is_decent?
      end
    end
  end
  
  # TODO: just extend String to allow 'hello'.is_decent?
  class DecentString < String
    CUSSWORDS = %w(shit piss fuck cunt cocksucker motherfucker tits)
    
    def is_decent?
      essence = self.downcase.gsub(/[^a-zA-Z]/, '')
      CUSSWORDS.detect { |c| essence.include? c }.nil?
    end
  end
  
  def self.included(other_module) #:nodoc:
    other_module.extend ClassMethods
  end 
end
