class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :review

  YES = "ТАК"
  NO = "НІ"
  ANSWERS = [YES, NO]
end
