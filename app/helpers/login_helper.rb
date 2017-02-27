def login(user)
    session[:user_id] = user.id
    p session
end

def logout
  session.clear
end

def current_user
  @user = User.find_by(id: session[:user_id])
end
