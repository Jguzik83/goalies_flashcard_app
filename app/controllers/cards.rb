get '/cards/:id' do
  @card = Card.find_by(id: params[:id])
  erb :'cards/edit'
end

put '/cards/:id' do
  card = Card.find_by(id: params[:id])
  card.update(params[:card])

  if card.save
    redirect "/decks/#{card.deck_id}/edit"
  else
    #prep for validations
    #redirect to edit page user made q or a blank
    redirect "/cards/#{card.id}"
  end
end

post '/cards' do
  card = Card.new(params[:card])

  # add validation and show error to user...eventually
  if card.save
    redirect "/decks/#{card.deck_id}/edit"
  else
    redirect "/decks/#{card.deck_id}/cards/new"
  end
end

delete '/cards/:id' do
  card = Card.find_by(id: params[:id])
  deck_id = card.deck_id
  card.destroy
  redirect "/decks/#{deck_id}/edit"
end
