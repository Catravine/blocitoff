class ItemsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @list = @user.lists.find(params[:list_id])
    @item = @list.items.build(item_params)

    if @item.save
      flash[:notice] = "Item was saved."
    else
      flash.now[:alert] = "There was an error saving the item.  Please try again."
    end
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:user_id])
    @list = @user.lists.find(params[:list_id])
    @item = @list.items.find(params[:id])
    if @item.destroy
      flash[:notice] = "\"#{@item.name}\" -is- DONE!"
    else
      flash.now[:alert] = "There was an error marking off this item."
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end
