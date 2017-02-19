json.extract! transaction, :id, :account_id, :amount, :status, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)