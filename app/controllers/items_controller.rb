class ItemsController < ApplicationController
  def create
    @user = current_user
    @item = @user.items.new(item_params)
    @item.user = current_user
    @new_item = Item.new
    
    if @item.save
      flash[:notice] = "Task saved successfully"
    else
      flash[:error] = "Task failed to save"
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:name)
  end
end
