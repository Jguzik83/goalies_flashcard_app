require 'bcrypt'

class User < ActiveRecord::Base
  has_secure_password

  has_many :games
  has_many :decks, foreign_key: 'creator_id'
  has_many :guesses, through: :games

  validates :username, presence: true, uniqueness: true

  include BCrypt

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

end
