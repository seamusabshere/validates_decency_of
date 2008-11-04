ActiveRecord::Schema.define do
  create_table :messages do |t|
    t.string :title
    t.string :description
  end
end
