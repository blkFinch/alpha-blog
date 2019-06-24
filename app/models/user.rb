class User < ApplicationRecord
  require 'uri' #for email validation

  before_save{ self.email = email.downcase }

  validates :username, presence: true,
            uniqueness: {case_sensitive: false},
            length: {minimum: 3, maximum: 30}

  validates :email, presence: true,
            uniqueness: {case_sensitive: false},
            length: {maximum: 100 }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }

  has_many :articles, dependent: :destroy

  has_secure_password
end
