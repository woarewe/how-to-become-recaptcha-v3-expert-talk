# frozen_string_literal: true

class ReCaptchaValidator < ActiveModel::Validator
  SITE_KEY = ENV.fetch("RECAPTCHA_SITE_KEY")
  SECRET_KEY = ENV.fetch("RECAPTCHA_SECRET_KEY")
  VERIFICATION_URL = "https://www.google.com/recaptcha/api/siteverify"
  SCORE = 0.5
  attr_reader :user_token, :response

  def validate(record)
    @user_token = record.recaptcha_token
    @response = verify
    return if success? && human_being?

    record.errors.add(:recaptcha, response["error-codes"])
  end

  private

  def verify
    HTTParty.post(VERIFICATION_URL, body: { response: user_token, secret: SECRET_KEY })
  end

  def success?
    response["success"]
  end

  def human_being?
    response["score"] >= SCORE
  end
end
