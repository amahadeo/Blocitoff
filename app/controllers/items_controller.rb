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
  
  def destroy
    @item = Item.find(params[:id])
    
    if @item.destroy
      flash[:notice] = "Yes! Todo finished and deleted."
    else
      flash[:error] = "Oops! There was an error deleting that todo, try again."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  protected 
  
  def items_params
    params.require(:item).permit(:name)
  end
end
