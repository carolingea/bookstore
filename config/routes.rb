Rails.application.routes.draw do
  devise_for :users
  
  #Rutas Libros
  root 'book#index'
  get "libros/todos", to: "book#index"

  get "libros/nuevo", to:"book#new"
  post "libros/crear", to: "book#create"

  get "libros/mostrar/:id", to:"book#show"
  post "libros/borrar/:id", to:"book#delete"
  
  get "libros/editar/:id", to:"book#edit"
  post "libros/update/:id", to:"book#update"

  #Rutas Usuarios Libros
  get "mis-libros/todos", to:"user_book#index"
  post "mis-libros/agregar", to:"user_book#add"
  
  post "mis-libros/borrar/:id", to:"user_book#delete"

  #Rutas Autores
get "autores/todos", to: "author#index"

get "autores/nuevo", to: "author#new"
post "autores/crear", to: "author#create"

get "autores/mostrar/:id", to: "author#show"
post "autores/borrar/:id", to: "author#delete"

get "autores/editar/:id", to: "author#edit"
post "autores/update/:id", to: "author#update"

end
