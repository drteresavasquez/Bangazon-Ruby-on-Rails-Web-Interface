class User < ApplicationRecord

  before_save { self.email = email.downcase }
  before_save { self.city = city.titleize }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true,
    length: { maximum: 245 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password_digest, presence: true, length: { minimum: 6 }

	has_many :products
	has_many :products_votes
	has_many :products, :through => :products_votes
	has_many :favorites
	has_many :products, :through => :favorites
	has_many :orders
	has_many :payment_types
	has_one :wishlists

end
