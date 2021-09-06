class GenresController < ApplicationController
    def index
        @genres = Genre.all

        render 200, json: @genres
    end 
    def show
        @genre = Genre.find(params[:id])

        render 200, json: @genre  
    end
    def create
        @genre = Genre.new(genre_params)

        if @genre.save
            render 201, json: @genre        
        else
            render 422, json: @genre.error  
        end
    end
    def update
        @genre = Genre.find(params[:id])

        if @genre.update(genre_params)
            render 200, json: @genre        
        else
            render 422, json: @genre.error  
        end
    end
    def destroy
        @genre = Genre.find(params[:id])

        if @genre.destroy
            head 204       
        else
            render 422, json: @genre.error  
        end
    end
    protected
    def genre_params
        params.require(:book).permit(:name, :genre, :pubdate)
    end
end
