class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    authorize @user
    @items = @user.items
  end
end
