class Deck < ActiveRecord::Base
  has_many :cards
  has_many :games

  validates :name, presence: true, uniqueness: true

end
