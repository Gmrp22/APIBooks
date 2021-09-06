class ListsController < ApplicationController
    def index
        @lists = List.all

        render 200, json: @lists
    end 
    def show
        @list = List.find(params[:id])

        render 200, json: @list
    end
    def create
        @list= List.new(list_params)

        if @list.save
            render 201, json: @list      
        else
            render 422, json: @list.error  
        end
    end
    def update
        @list = List.find(params[:id])

        if @list.update(list_params)
            render 200, json: @list        
        else
            render 422, json: @list.error  
        end
    end
    def destroy
        @list = List.find(params[:id])

        if @list.destroy
            head 204       
        else
            render 422, json: @list.error  
        end
    end
    protected
    def list_params
        params.require(:book).permit(:name, :genre, :pubdate)
    end
end
