class Contact < ActiveRecord::Base
  belongs_to :user
  belongs_to :kind
  #Necessita foreign_key no outro model. Singular por ser apenas um.
  has_one :address
  has_many :phones
  
  #Define deve aceitar atributos aninhados de address.
  accepts_nested_attributes_for :address
  # reject_if: all_blank //Rejeita campo em branco.
  # allow_destroy: true //Permite que o telefone seja excluido pelo form de contatos.
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true, length: { minimum: 3 }
  validates :email, presence: true
end
