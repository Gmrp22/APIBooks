class BooksController < ApplicationController
    def index
        @books = Book.all

        render 200, json: @books
    end 
    def show
        @book = Book.find(params[:id])

        render 200, json: @book  
    end
    def create
        @book = Book.new(book_params)

        if @book.save
            render 201, json: @book        
        else
            render 422, json: @book.error  
        end
    end
    def update
        @book = Book.find(params[:id])

        if @book.update(book_params)
            render 200, json: @book        
        else
            render 422, json: @book.error  
        end
    end
    def destroy
        @book = Book.find(params[:id])

        if @book.destroy
            head 204       
        else
            render 422, json: @book.error  
        end
    end
    protected
    def book_params
        params.require(:book).permit(:name, :genre, :pubdate)
    end
end
