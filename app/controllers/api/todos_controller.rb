class Api::TodosController < ApiController
  before_action :authenticated?, :compare_users

  def create
    # Example request:
    # curl -u user@example.com:password -d "todo[description]=Dance if you want to" http://localhost:3000/api/lists/1/todos
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

  def destroy
    begin
      @todo = Todo.find(params[:id])
      @todo.destroy
      render json: { message: "HTTP 204 No Content. Todo deleted Successfully"}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => { errors: "Todo not found. Command failed."}, :status => :not_found
    end
  end

  def update
    begin
      @todo = Todo.find(params[:id])
      if @todo.update(todo_params)
        render json: @todo.to_json
      else
        render json: { errors: @todo.errors.full_messages }, status: :unprocessable_entity
      end
    rescue ActiveRecord::RecordNotFound
      render :json => { errors: "Todo not found. Command failed."}, :status => :not_found
    end
  end

  private
  def todo_params
    params.require(:todo).permit(:description, :if_complete)
  end

  def correct_user_params?
    begin
      if params[:list_id]
        @list = List.find(params[:list_id])
      else
        @todo = Todo.find(params[:id])
        @list = List.find(@todo.list_id)
      end
      @user_param = @list.user
      @user_email = get_user
      @user_param == @user_email
    rescue ActiveRecord::RecordNotFound
      render :json => { errors: "User not found. Command failed."}, :status => :not_found
    end
  end

end