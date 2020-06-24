json.extract! review, :id, :car_model_id, :requested_price, :suggested_price, :comment, :owner_name, :owner_phone, :created_at, :updated_at
json.url review_url(review, format: :json)
