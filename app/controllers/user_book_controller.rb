class UserBookController < ApplicationController
    before_action :authenticate_user!
    def index
        @books = current_user.books.select("books.id as id_libro,books.title, books.description, user_books.id")
        #@books = current_user.books
    end

    def add
        book_id = params.require(:book).permit(:id)
        book = Book.find(book_id[:id])   
        unless book.nil?
            current_user.books.push(book)
        end     
        redirect_to action: 'index'
    end

    def delete
        @librosUsuario = UserBook.find(params[:id])
        
        if @librosUsuario.nil?
        else
            if @librosUsuario.delete
                redirect_to action: "index"
            end
        end
    end
end
