class CarModel < ApplicationRecord
  has_many :questions

  scope :by_name, -> { order(manufacturer: :asc) }

  def full_name
    "#{manufacturer} - #{name}"
  end

  def applicable_questions
    Question.default + questions
  end
end
