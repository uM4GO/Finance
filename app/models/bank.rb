class Bank < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 } 
  validates :code, presence: true
end
