module ValidatesDecencyOf
  def self.included(base)
    base.extend(ClassMethods)
  end
  
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
        record.errors.add attribute_name, options[:message] unless value.to_s.is_decent?
      end
    end
  end
end

ActiveRecord::Base.class_eval { include ValidatesDecencyOf }
