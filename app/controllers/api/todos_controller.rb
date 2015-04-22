class Api::TodosController < ApiController
  before_action :authenticated?, :compare_users

  def create
    # Example request:
    # curl -u user@example.com:password -d "todo[description]=Dance if you want to" http://localhost:3000/api/lists/1/items
    # email and password credentials must be owner of the list to create todos for that list
    @list = List.find(params[:list_id])
    @todo = Todo.new(todo_params)
    @todo.list = @list
    
    if @todo.save
      render json: @todo.to_json
    else
      render json: { errors: @todo.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:description)
  end

  def correct_user_params?
    @list = List.find(params[:list_id])
    @user_param = @list.user
    @user_email = get_user
    @user_param == @user_email
  end

  def compare_users
    unless correct_user_params?
      render json: { errors: "Unautorized access: List owner in HTTP request does not match email credentials" }, status: :unprocessable_entity
    end
  end

end