class Question < ApplicationRecord
  belongs_to :car_model, optional: true

  scope :default, ->{ where(car_model_id: nil) }
end
