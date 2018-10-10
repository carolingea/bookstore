class AuthorController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :delete]
    def index
        @autor = Author.all
    end

    def new
    end

    def create
        parametros = params.require(:author).permit(:name, :string, :year) 
        Author.create(parametros)
        redirect_to action: "index"
    end
     
    def show
        @autor = Author.find(params[:id])
        @libros = Book.where(author_id: params[:id])
    end

    def delete
        @autor = Author.find(params[:id])
        unless @autor.nil?
            if @autor.delete
                redirect_to action: "index"
            end
        end
    end
    
    def edit
        @autor = Author.find(params[:id])
    end
    
    def update
        parametros = params.require(:author).permit(:name, :string, :year)
        @autor = Author.find(params[:id])
        
        if @autor.update(parametros)
            redirect_to action: "index"
        else
            puts "Error"
        end
    end
end
