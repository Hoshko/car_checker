module ReviewsHelper
  def telegram_one_line_format(review)
    "#{review.car_model.full_name} | #{review.requested_price} | #{review.owner_name} | #{review.owner_phone}"
  end

  def telegram_summary(review)
    base = telegram_one_line_format(review)
    suggested_price = "#{t("review.suggested_price")}: #{review.suggested_price}"
    answers = review.answers.map {|a| "#{a.question.content}: #{a.answer ? Answer::YES : Answer::NO}"}.join("\n")
    [base, suggested_price, answers, review.comment].join("\n")
  end
end
