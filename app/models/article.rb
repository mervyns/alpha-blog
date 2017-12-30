class Article < ActiveRecord::Base
  belongs_to :user
  before_save { self.email = email.downcase }
  validates :title, presence: true, length: { minimum: 3, maximum: 10}
  validates :descriptions, presence: true, length: {minimum: 10, maximum: 300}
  
  VALID_EMAIL_REGEX = /\A[^@\s]+@([^@.\s]+\.)*[^@.\s]+\z/i
    validates :email, presence: true,
            uniqueness: { case_sensitive: false},
            format: { with: VALID_EMAIL_REGEX }
end