require 'active_support'
require 'active_record'

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
module ValidatesDecencyOf
  INDECENT_WORDS = %w(shit piss fuck cunt cocksucker motherfucker tits)
  def self.indecent?(str)
    essence = str.to_s.downcase.gsub /[^\.\'a-zA-Z]/, ''
    INDECENT_WORDS.any? { |c| essence.include? c }
  end
  
  if ActiveRecord::VERSION::MAJOR == 2
    module ClassMethods
      def validates_decency_of(*attribute_names)
        options = { :message => 'is indecent' }
        options.merge!(attribute_names.pop) if attribute_names.last.kind_of?(Hash)
        options.merge! :on => :save
        validates_each(attribute_names, options) do |record, attribute_name, value|
          record.errors.add attribute_name, options[:message] if ValidatesDecencyOf.indecent? value
        end
      end
    end
  elsif ActiveRecord::VERSION::MAJOR == 3
    class DecencyValidator < ActiveModel::EachValidator
      def validate(record)
        message = options[:message] || 'is indecent'
        attributes.each do |name|
          if ValidatesDecencyOf.indecent? record.send(name)
            record.errors.add name, message
          end
        end
      end
    end
    module ClassMethods
      def validates_decency_of(*attr_names)
        validates_with DecencyValidator, _merge_attributes(attr_names)
      end
    end
  else
    raise "Needs activerecord 2 or 3"
  end
end

ActiveRecord::Base.extend ValidatesDecencyOf::ClassMethods
