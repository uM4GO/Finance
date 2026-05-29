class Customer < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :address, presence: true
  validate :valid_cpf?
  
  enum :kind, { fisica: "F", juridica: "J" }

  private
  
  def valid_cpf?
    #if kind == "J"
    #  return true
    #elsif kind == "F"
     # if cpf.nil?
      #  errors.add(:cpf, "CPF não pode ser menor nulo.")
       # return false
      #end
      #if cpf.size < 13
       # errors.add(:cpf, "CPF não pode ser menor que 13 caracteres.")
      #end
    #end
    return true if juridica?
    #if cpf.nil?
      errors.add(:cpf, "Não pode ser nulo.") if cpf.nil?
      #return false
    #end
    errors.add(:cpf, "CPF não pode ser menor que 13 caracteres.") if cpf.size < 13

  end
end
