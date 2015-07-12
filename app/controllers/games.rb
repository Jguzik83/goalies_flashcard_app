get '/games' do
  @decks = Deck.order(:id)
  erb :'games/index'
end

post '/games' do
  userid = User.find_by(id: session[:user_id]).id
  deckid = Deck.find_by(id: params[:deck_id]).id

  game = Game.create(user_id: userid, deck_id: deckid)

  redirect "/games/#{game.id}"
end

get '/games/:id' do

  game = Game.find_by(id: params[:id])

  if game.game_over?
    @score = game.score
    erb :'games/score'
  else
    @card = game.give_card
    @game_id = game.id
    erb :'games/show'
  end

end

post '/games/:game_id/guesses' do
  game_id = params[:game_id]
  card_id = params[:card_id]
  answer = params[:card_answer]
  input = params[:user_guess]

  guess = Guess.new(card_id: card_id, game_id: game_id, correct: answer.downcase == input.downcase)
  #need validation for save
  guess.save
  redirect "/games/#{game_id}"
end
