class ListsController < ApplicationController
  def show
    @list = List.find(params[:id])
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

  private

  def list_params
    params.require(:list).permit(:title, :description, :category)
  end
end