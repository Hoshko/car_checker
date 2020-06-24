module ApplicationHelper
  def review_style(review)
    return 'warning' if review.needs_review?
    return 'success' if review.suggested_price.to_i >= review.requested_price.to_i
    return 'danger' if review.suggested_price.to_i < review.requested_price.to_i
  end
end
