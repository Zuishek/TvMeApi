class User < ActiveRecord::Base
  # Fields
  attr_accessor :password
  
  # Validations
  validates :f_name, :email, :l_name, :username, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true, on: :create
  
  # Relations
  has_one :wall
  has_many :posts
  has_many :comments

  acts_as_followable
  acts_as_follower
  
  # Callbacks
  before_create -> { self.token = SecureRandom.hex }, unless: :token?
  before_save :encrypt_password, if: -> { self.password.present? }
  
  # Class Methods
  def self.authenticate(email, password)
    user = find_by(email: email)
    if user.present? && user.valid_password?(password)
      user
    else
      User.new.tap do |user|
        user.errors.add :base, 'Invalid email or password'
      end
    end
  end
  
  # Methods
  def valid_password?(password)
    self.encrypted_password == Digest::MD5.hexdigest(password)
  end
  
  def encrypt_password
    self.encrypted_password = Digest::MD5.hexdigest(self.password)
  end
end
