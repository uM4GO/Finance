class Account < ApplicationRecord
  belongs_to :bank
  has_many :transactions

  validates :agency_number, presence: true  
  validates :account_number, presence: true, uniqueness: { scope: [:agency_number, :bank_id] }

  def total_debito
    transactions.debitos.sum(:amount).to_f
  end

  def total_credito
    transactions.creditos.sum(:amount).to_f
  end

  def total_saldo
    (total_credito - total_debito).to_f
  end
end
