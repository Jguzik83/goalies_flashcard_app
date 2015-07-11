require 'pry'

get '/users/:id' do
  user = current_user
  if user.nil?
    redirect '/signup'
  elsif params[:id].to_i == session[:user_id]
    @decks = user.decks
    erb :'users/show'
  else
    erb :'unauth'
  end
end