class ListsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @list = @user.lists.build(list_params)

    if @list.save
      flash[:notice] = "New list \'#{@list.title}\' created."
    else
      flash.now[:alert] = "There was an error saving the list.  Please try again."
    end
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:user_id])
    @list = @user.lists.find(params[:id])
    if @list.destroy
      flash[:notice] = "\"#{@list.title}\" -is- DONE!"
    else
      flash.now[:alert] = "There was an error deleting this list."
    end
  end

  private

  def list_params
    params.require(:list).permit(:title)
  end

end
