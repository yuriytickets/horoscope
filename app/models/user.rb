class User < ActiveRecord::Base


  attr_accessible :birth_date, :email, :name, :password, :password_confirmation, :zodiac, :updated_at
  has_secure_password

  acts_as_commentable
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  before_save :set_zodiac_sign

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :birth_date, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

  has_many :statistics
  has_many :comment
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def set_zodiac_sign
      birth_date = self.birth_date.split('/')
      self.zodiac = Date.new(birth_date[2].to_i,
                             birth_date[0].to_i, 
                             birth_date[1].to_i).zodiac_sign
    end
end
