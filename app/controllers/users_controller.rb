class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @list = List.new
    @lists = @user.lists
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end

end