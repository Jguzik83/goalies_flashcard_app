class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :deck
  has_many :guesses

  #ZM: SEE PR 
  def load_cards
    deck = Deck.find_by(id: self.deck_id)
    deck.cards - guessed_cards
  end

  def guessed_cards
    guesses = Guess.where(game_id: self.id)
    guesses.map(&:card)
  end

  def give_card
    load_cards.sample
  end

  def game_over?
    load_cards.empty?
  end

  def score
    guesses = Guess.where(game_id: self.id)
    total = guesses.length
    correct_num = guesses.select(&:correct).length

    {correct: correct_num, total: total}
  end

end
