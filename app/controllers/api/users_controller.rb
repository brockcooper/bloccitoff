class Api::UsersController < ApiController
  before_action :authenticated?

  def index
    @users = User.all
    render json: @users, each_serializer: UserSerializer
  end

  def create
    # Example request:
    # curl -u user@example.com:your-password -d "user[username]=brockcooper" -d "user[email]=u0821793@utah.edu" -d "user[password]=helloworld" http://localhost:3000/api/users/
    user = User.new(user_params)
    if user.save
      render json: user.to_json
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end