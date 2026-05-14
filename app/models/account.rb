class Account < ApplicationRecord
  belongs_to :bank
  
  validates :agency_number, presence: true  
  validates :account_number, presence: true, uniqueness: { scope: [:agency_number, :bank_id] }


  
end
