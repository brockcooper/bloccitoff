class Api::ListsController < ApiController
  before_action :authenticated?, :compare_users

  def create
    # Example request:
    # curl -u user@example.com:password -d "list[title]=Things to do today" -d "list[description]=Get these done before the end of day" http://localhost:3000/api/lists
    
    @user = get_user

    @list = @user.lists.build(list_params)
    if @list.save
      render json: @list.to_json
    else
      render json: { errors: @list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def list_params
    params.require(:list).permit(:title, :description)
  end

  def correct_user_params?
    @user_param = User.find(params[:user_id])
    @user_email = get_user
    @user_param == @user_email
  end

  def compare_users
    unless correct_user_params?
      render json: { errors: "Unautorized access: User Id in HTTP request does not match email credentials" }, status: :unprocessable_entity
    end
  end

end