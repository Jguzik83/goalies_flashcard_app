steve = User.create(username:'steve', password: 'apple')

harry_deck = Deck.new(name: "Harry Potter Trivia")
steve.decks << harry_deck

File.open('db/fixtures/harry.txt').each_slice(2) {|question, answer| harry_deck.cards << Card.new(question: question.chomp, answer: answer.chomp) }