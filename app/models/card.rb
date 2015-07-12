class Card < ActiveRecord::Base
  belongs_to :deck
  has_many :guesses

  validates :answer, presence: :true

end
