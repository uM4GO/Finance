json.array! @transactions do |transaction|
  json.id transaction.id
  json.description transaction.description
  json.amount transaction.amount
  json.transaction_type transaction.transaction_type
  json.date transaction.date
  json.created_at transaction.created_at
  json.updated_at transaction.updated_at
  json.account do
    json.id transaction.account_id
    json.account_number transaction.account.account_number
    json.agency_number transaction.account.agency_number

    json.bank do
      json.extract! transaction.account.bank, :id, :name, :code, :active, :created_at, :updated_at
    end
  end
end
