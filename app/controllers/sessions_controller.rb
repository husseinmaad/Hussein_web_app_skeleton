# Login page
get '/login' do
  erb:'sessions/new.html'
end

# Request to login, redirect to user profile
post '/login' do
  @user_info = params[:user]
  @user = User.authenticate(@user_info[:email], @user_info[:password])
  if @user
    login(@user)

    helper_check_print("USER LOG IN" ,@user)
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
