class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def show
    @todo = Todo.find params[:id]
  end

  def create
    @list = List.find_by(todo_params[:list_id])
    @todo = Todo.new(todo_params)
    @todo.list = @list
    if @todo.save
      redirect_to @todo.list, notice: 'Your new Todo was saved'
    else
      flash[:notice] = 'There was an error saving your TODO'
      redirect_to @todo.list
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :list_id)
  end
end