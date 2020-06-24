class TelegramController < Telegram::Bot::UpdatesController
  include Telegram::Bot::UpdatesController::MessageContext
  include ReviewsHelper

  def start!(*)
    respond_with :message, text: t('.content')
  end

  def list!(*)
    reviews = Review.all.select(&:needs_review?)
    if reviews.empty?
      respond_with :message, text: t('.no_cars_to_review')
    else
      respond_with :message, text: t('.select_car_for_review'), reply_markup: {
        inline_keyboard: reviews.map { |r| [{text: telegram_one_line_format(r), callback_data: "ID:#{r.id}"}]}
      }
    end
  end

  def callback_query(data)
    case data
    when /ID:(\d*)/ then start_review(data)
    when Answer::YES, Answer::NO then add_answer(data)
    end
  end

  def start_review(message)
    id = /ID:(\d*)/.match(message)[1]
    session[:review] = Review.find(id)
    session[:questions] = session[:review].car_model.applicable_questions
   
    ask_next_question
  end

  def ask_next_question
    respond_with :message, text: session[:questions].first.content, reply_markup: {
      inline_keyboard: [
        [{ text: Answer::YES, callback_data: Answer::YES }, { text: Answer::NO, callback_data: Answer::NO}]  
      ]
    }
  end

  def add_answer(data)
      question = session[:questions].first
      
      answer = session[:review].answers.find_or_create_by(question: question)
      answer.answer = Answer::YES == data
      answer.save

      session[:questions] = session[:questions][1..-1]
      session[:questions].present? ? ask_next_question : ask_for_comment
  end

  def ask_for_comment
    respond_with :message, text: t("review.comment")
    save_context :comment!
  end

  def comment!(*args)
    session[:review].comment = args.join(" ")
    session[:review].save

    ask_for_suggested_price
  end

  def ask_for_suggested_price
    respond_with :message, text: t("review.suggested_price")
    save_context :suggested_price!
  end

  def suggested_price!(*args)
    session[:review].suggested_price = args.join
    session[:review].save

    finish_review
  end

  def finish_review
    respond_with :message, text: telegram_summary(session[:review])
    session[:review] = nil
  end
end