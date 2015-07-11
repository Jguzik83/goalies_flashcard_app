get '/decks/new' do
  erb :'decks/new'
end

get '/decks/:id' do
  deck = Deck.find_by(id: params[:id])
  @cards = deck.cards
  erb :'decks/show'
end

get '/decks/:id/edit' do
  deck = Deck.find_by(id: params[:id])
  @cards = deck.cards
  erb :'decks/edit'
end

post '/decks' do
  user = User.find_by(id: session[:user_id])
  user.decks << Deck.new(params[:deck])
  redirect "/users/#{session[:user_id]}"
end

delete '/decks/:id/delete' do
  deck = Deck.find_by(id: params[:id])
  deck.destroy
  redirect "/users/#{session[:user_id]}"
end