class Address < ApplicationRecord
=begin
  No Rails 5, belongs_to tem o atributo required definido como true. Isso é o contrário do que acontecia em 
  versões anteriores, onde o mesmo tinha seu valor default false.
=end
  belongs_to :contact, required: false
end
