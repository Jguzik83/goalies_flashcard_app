require 'pry'

get '/users/:id' do
  @user = current_user
  # binding.pry
  if @user.nil?
    redirect '/signup'
  elsif params[:id].to_i == session[:user_id]
    erb :'users/show'
  else
    erb :'unauth'
  end
end