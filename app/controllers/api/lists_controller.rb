class Api::ListsController < ApiController
  before_action :authenticated?, :compare_users

  def create
    # Example request:
    # curl -u user@example.com:password -d "list[title]=Things to do today" -d "list[description]=Get these done before the end of day" http://localhost:3000/api/users/1/lists
    # email and password credentials must match the Id of the user id in the HTTP request
    
    @user = get_user

    @list = @user.lists.build(list_params)
    if @list.save
      render json: @list.to_json
    else
      render json: { errors: @list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      @list = List.find(params[:id])
      if @list.destroy
        render json: { message: "HTTP 204 No Content. User deleted Successfully"}, status: :no_content
      end
    rescue ActiveRecord::RecordNotFound
      render :json => { errors: "List not found. Command failed."}, :status => :not_found
    end
  end

  def update
    begin
      list = List.find(params[:id])
      if list.update(list_params)
        render json: list.to_json
      else
        render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render :json => { errors: "List not found. Command failed."}, :status => :not_found
    end
  end

  private
  def list_params
    params.require(:list).permit(:title, :description)
  end

  def correct_user_params?
    begin
      @user_param = User.find(params[:user_id])
      @user_email = get_user
      @user_param == @user_email
    rescue ActiveRecord::RecordNotFound
      render :json => { errors: "User not found. Command failed."}, :status => :not_found
    end
  end

end