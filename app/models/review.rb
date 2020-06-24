class Review < ApplicationRecord
  belongs_to :car_model
  has_many :answers, dependent: :destroy

  def needs_review?
    car_model.present? && comment.blank? && suggested_price.blank? && answers.blank?
  end
end
