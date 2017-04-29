class Contact < ApplicationRecord
  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)[^@\.]+\z/
  
  #Pertence a
  belongs_to :kind
  #Tem um endereço
  has_one :address
  has_many :phones

  #Aceita atributos aninhados do model :address.
  accepts_nested_attributes_for :address
  #reject_if: Rejeita se campo estiver vazio.
  #allow_destroy: Aceita que seja removido através do model contact.
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true, length: { minimum: 4 }
  validates :email, presence: true, format: { with: EMAIL_REGEXP } 
end
