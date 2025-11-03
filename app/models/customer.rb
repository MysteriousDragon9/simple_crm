class Customer < ApplicationRecord
  has_one_attached :image

  validates :full_name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "full_name", "email", "phone_number", "notes", "created_at", "updated_at" ]
  end
end
