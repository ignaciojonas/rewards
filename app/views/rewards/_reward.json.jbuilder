json.extract! reward, :id, :recipient, :reward_type_id, :amount, :created_at, :updated_at
json.url reward_url(reward, format: :json)
