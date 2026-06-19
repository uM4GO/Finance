class Customer < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2 }
  validates :address, presence: true

  validates :documento, presence: true

  enum :kind, { person: "F", company: "J" }

  def status
    active ? "Ativo" : "Inativo"
  end

  private

  def validar_documento
    return if documento.blank?

    if person? && documento.length != 14
      errors.add(:documento, "deve ter 14 caracteres para pessoa física")
    elsif company? && documento.length != 18
      errors.add(:documento, "deve ter 18 caracteres para pessoa jurídica")
    end
  end
end

  
  