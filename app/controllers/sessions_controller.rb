# Login page
get '/login' do
  erb:'sessions/new.html'
end

# Request to login, redirect to user profile
post '/login' do
  @attempt = params[:user]
  @user = User.authenticate(@attempt[:email], @attempt[:password])
  if @user
    login(@user)
    redirect "users/#{@user.id}"
  else
    erb:'sessions/new.html'
  end
end

# Request to logout, redirect to home page
delete '/logout' do
  logout
  redirect '/'
end

get '/logout' do
  logout
  redirect '/'
end
