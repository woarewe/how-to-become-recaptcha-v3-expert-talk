# frozen_string_literal: true

class ReCaptchaValidator < ActiveModel::Validator
  SITE_KEY = ENV.fetch("RECAPTCHA_SITE_KEY")
  SECRET_KEY = ENV.fetch("RECAPTCHA_SECRET_KEY")
  VERIFICATION_URL = "https://www.google.com/recaptcha/api/siteverify"
  attr_reader :user_token

  def validate(record)
    @user_token = record.recaptcha_token
    return if response["success"]

    record.errors.add(:recaptcha, response["error-codes"])
  end

  private

  def response
    @response ||= HTTParty.post(VERIFICATION_URL, body: { response: user_token, secret: SECRET_KEY })
  end
end
