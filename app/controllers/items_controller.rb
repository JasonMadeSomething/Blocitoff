class ItemsController < ApplicationController
  def create
    @user = current_user
    @item = @user.items.new(item_params)
    @item.user = current_user
    @item.activate
    @new_item = Item.new
    
    if @item.save
      flash.now[:notice] = "Task saved successfully"
    else
      flash[:error] = "Task failed to save"
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def complete
    
    update_state(:completed)

    respond_to do |format|
      format.html
      format.js
    end
    
  end
  
  def archive
    
    update_state(:archived)
    
    respond_to do |format|
      format.html
      format.js
    end   
    
  end
  
  def activate
    update_state(:active)
    
    respond_to do |format|
      format.html
      format.js
    end
    
  end
  
  private
  
  def update_state(new_state)
    @item = Item.find(params[:item_id])
    
    if(new_state == :active)
      @item.activate
    else
      @item.deactivate(new_state)
    end
    
    if @item.save
      flash.now[:notice] = "#{@item.name} is now marked #{new_state.to_s}"
    else
      flash[:error] = "Task could not be marked #{new_state.to_s}"
    end
  end
  
  def item_params
    params.require(:item).permit(:name)
  end
end
