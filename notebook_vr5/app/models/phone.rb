class Phone < ApplicationRecord
  belongs_to :contact, required: false
end
