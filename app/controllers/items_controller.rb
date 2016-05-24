class ItemsController < ApplicationController
	
	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		@item.user = current_user

		if @item.save
			flash[:notice] = "Item saved succesfully"
		else
			flash[:error] = "Item Failed to Save"
		end
		redirect_to user_path(current_user)
	end

	def destroy
		@user = User.find(params[:user_id])
     	@item = @user.items.find(params[:id])
		
		if @item.destroy
			flash[:notice] = "\"#{@item.name}\" was deleted succesfully."			
		else
			flash[:error] = "There was an error deleting the Item"
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
