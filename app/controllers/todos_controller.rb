class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def show
    @todo = Todo.find params[:id]
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to @todo, notice: 'Your new TODO was saved'
    else
      flash[:notice] = 'There was an error saving your TODO'
      redirect_to new_todo_path
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:description)
  end
end