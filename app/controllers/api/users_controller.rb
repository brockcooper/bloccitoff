class Api::UsersController < ApiController
  before_action :authenticated?
  before_action :compare_users, only: [:destroy]

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

  def destroy
    begin
      user = User.find(params[:id])
      if user.destroy
        render json: { message: "HTTP 204 No Content. User deleted Successfully"}, status: :no_content
      end
    rescue ActiveRecord::RecordNotFound
      render :json => { errors: "User not found. Command failed."}, :status => :not_found
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def correct_user_params?
    begin
      @user_param = User.find(params[:id])
      @user_email = get_user
      @user_param == @user_email
    rescue ActiveRecord::RecordNotFound
      render :json => { errors: "User not found. Command failed."}, :status => :not_found
    end
  end

end