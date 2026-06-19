class Transaction < ApplicationRecord
  belongs_to :account
  
  #Criar enum para informação, debito e credito: transaction_type
  enum :transaction_type, { debit: "D", credit: "C", info: "I" }

  #Criar validação amount: não-negativo
  validates :amount, numericality: { greater_than: 0 }

  #description: não vazia
  validates :description, presence: true, length: { minimum: 3 }

  scope :creditos, -> { where(transaction_type: "C") }
  scope :debitos,  -> { where(transaction_type: "D") }
end
