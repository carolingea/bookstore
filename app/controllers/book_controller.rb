class BookController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :delete]
    def index
        #Consulta a todos los libros
        @books = Book.all 
    end

    def new  #Muestra formulario
        @authors = Author.all
        # Author.find()
        # Author.find_by()
        # Author.where()
    end

    def create # Crea un libro
        book_param = params.require(:book).permit(:title, :description, :author_id) 
        Book.create(book_param)
        redirect_to action: "index"
    end
    
    def show
        @book = Book.find(params[:id])
        if @book.nil?
            redirect_to action: "index"
        else
            @autores = Author.where(id: @book.author_id)
        end
    end

    def delete
        @book = Book.find(params[:id])
        unless @book.nil?
            @book.delete
        end
        redirect_to action: "index"
    end

    def edit  # Get
        @book = Book.find(params[:id])
        @authors = Author.all
    end

    def update 
        @book = Book.find(params[:id])
        parametros = params.require(:book).permit(:title, :description, :author_id) 
    
        if @book.update(parametros)
            redirect_to action: "index"
        else
            puts "Error"
         end
    end

end
