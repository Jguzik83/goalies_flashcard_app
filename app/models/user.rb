class User < ActiveRecord::Base
  has_secure_password

  has_many :games
  has_many :decks, foreign_key: 'creator_id'
  has_many :guesses, through: :games

end
