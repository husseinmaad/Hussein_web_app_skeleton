# helper method to print out the obj that pass*just for me to check the values in the server side"

def helper_check_print(message,to_print)
  puts "**********<<<<<<<<<<<<<< #{message} >>>>>>>>>>>>>>>>>>>**********"
   p to_print
  puts "**********<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>**********"
end 

def login(user)
  session[:user_id] = user.id

  helper_check_print("START SESSION LOG IN",session)
end

def logout
  session.clear
  helper_check_print("SESSION CLEAR SIGN OUT",session)

end

def current_user
  @user = User.find_by(id: session[:user_id])
end

