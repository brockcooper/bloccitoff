class TodosController < ApplicationController
  def create
    @list = List.find(todo_params[:list_id])
    @user = @list.user
    @todo = Todo.new(todo_params)
    @todo.list = @list
    if @todo.save
      redirect_to [@user, @list], notice: 'Your new Todo was saved'
    else
      flash[:error] = 'There was an error saving your TODO'
      redirect_to [@user, @list]
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :list_id)
  end
end