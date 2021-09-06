class AuthorsController < ApplicationController
    def index
        @authors = Author.all

        render 200, json: @authors
    end 
    def show
        @author = Author.find(params[:id])

        render 200, json: @author  
    end
    def create
        @author = Author.new(author_params)

        if @author.save
            render 201, json: @author        
        else
            render 422, json: @author.error  
        end
    end
    def update
        @author = Author.find(params[:id])

        if @author.update(author_params)
            render 200, json: @author        
        else
            render 422, json: @author.error  
        end
    end
    def destroy
        @author = Author.find(params[:id])

        if @author.destroy
            head 204       
        else
            render 422, json: @author.error  
        end
    end
    protected
    def author_params
        params.require(:book).permit(:name, :lastname, :blog)
    end
end
