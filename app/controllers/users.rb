get '/users/:id' do
  user = current_user
  @username = User.find_by(id: session[:user_id]).username
  if user.nil?
    redirect '/signup'
  elsif params[:id].to_i == session[:user_id]
    @decks = user.decks
    erb :'users/show'
  else
    erb :'unauth'
  end
end
