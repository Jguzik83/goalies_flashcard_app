get '/' do
  erb :welcome
end

get '/login' do
  erb :'auths/login'
end

post '/login' do
  user = User.find_by_username(params[:username])
  if user.password == params[:password]
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect '/users/signup'
  end
end

get '/signup' do
  erb :'auths/signup'
end

post '/signup' do
  user = User.new(username: params[:username], password: params[:password])
  if user.save
    redirect '/login'
  else
    redirect '/'
  end

end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end
