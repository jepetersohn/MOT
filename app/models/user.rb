class User < ActiveRecord::Base
  validates :email, :hashed_password, presence: true
  validates :email, uniqueness: true
  validates :hashed_password, :length => { minimum: 4}
  validate :validate_password_length

  has_many :subscriptions
  has_many :channels, through: :subscriptions

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(email, password)
    self.password == password && self.email == email
  end

  def validate_password_length
    if @raw_password.nil?
      errors.add(:password, "is required")
    elsif @raw_password.length < 4
      errors.add(:password, "must be at least 4 characters")
    end
  end

end
