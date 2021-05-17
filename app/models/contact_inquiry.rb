class ContactInquiry < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  validate :email_format


  private

  def email_format
    return if errors[:email].any?
    return if URI::MailTo::EMAIL_REGEXP === email

    errors.add(:email, "invalid format")
  end
end
