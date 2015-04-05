class ListsController < ApplicationController
  def show
    @list = List.find(params[:id])
    @todos = @list.todos
    @todo = Todo.new
  end

  # Post Request
  def create
    @list = current_user.lists.build( list_params )
    if @list.save
      redirect_to user_path(current_user), notice: "List was created successfully."
    else
      flash[:error] = "Error creating topic. Please try again."
      redirect_to user_path(current_user)
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    @user = @list.user
    if @list.destroy
      redirect_to @user, notice: "List deleted successfully."
    else
       redirect_to @user, error: "List could not be deleted. Please try again."
    end
  end

  private

  def list_params
    params.require(:list).permit(:title, :description, :category)
  end
end 