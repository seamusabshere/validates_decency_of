# based on http://svn.savvica.com/public/plugins/phone_validation/lib/validates_phone_authenticity_of.rb

# Includes DecencyValidation in ActiveRecord::Base.

Dir.glob(File.join(File.dirname(__FILE__),
         'validates_decency_of',
         '*.rb')) do |filename|
  require filename
end

ActiveRecord::Base.class_eval { include DecencyValidation }
