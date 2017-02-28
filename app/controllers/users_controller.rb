# Create a new user
get '/users/new' do
  erb:'users/new.html'
end

# Register a new user
post '/users' do
  
  @user = User.new(params[:user])
  if @user.save
    helper_check_print("USER LOG IN AFTER SGIN UP" ,@user)
    login(@user)
    redirect "users/#{@user.id}"
  else
    redirect "/users/new"
  end
end

# User Profile page
get '/users/:id' do
  @user = User.find(params[:id])
  erb:'users/show.html'
end
