class ContactInquiry < ApplicationRecord
  attribute :recaptcha_token, :string

  validates :name, presence: true
  validates :email, presence: true

  validate :email_format

  validates_with ReCaptchaValidator

  private

  def email_format
    return if errors[:email].any?
    return if URI::MailTo::EMAIL_REGEXP === email

    errors.add(:email, "invalid format")
  end
end
