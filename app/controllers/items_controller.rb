class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = @user.items.build(items_params)
    
    if @item.save
      redirect_to @user, notice: "Yes! New todo saved!"
    else
      redirect_to @user, error: "There was an error creating todo, please try again."
    end
  end
  
  def items_params
    params.require(:item).permit(:name)
  end
end
