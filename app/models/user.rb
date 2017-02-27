class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :user_name,:email, :presence => true
  validates :email, :uniqueness => true, :presence => true
  validates :password_hash, :uniqueness => true

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
    user = User.find_by(email: email)
    if user && user.password == password
      return user
    else
      return nil
    end
  end
end
