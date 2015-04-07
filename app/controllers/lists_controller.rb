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
      @message = "List was created successfully."
      redirect_to user_path(current_user), notice: "List was created successfully."
    else
      @message = "Error creating topic. Please try again."
      redirect_to user_path(current_user)
    end
  end
  
  def destroy
    @list = List.find(params[:id])
    @user = @list.user
    if @list.destroy
      @message = "List deleted successfully."
    else
      @message = "List could not be deleted. Please try again."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  

  private

  def list_params
    params.require(:list).permit(:title, :description, :category)
  end
end 