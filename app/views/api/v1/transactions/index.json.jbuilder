json.array! @transactions do |transaction|
  json.id transaction.id
  json.title transaction.description
  json.url transaction.amount
  json.created_at transaction.created_at
end