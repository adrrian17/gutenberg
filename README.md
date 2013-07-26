## Gutenberg

**Gutenberg** es una pequeña biblioteca. Administra préstamos de libros y revistas, así como los propios libros y revistas.


## Lista de recursos

* **Libro**: es la representación de un libro físico.
* **Autor**: se refiere a la persona creadora del libro.
* **Revista**: colección de artículos relacionados por un tema general.
* **Usuario**: usuario de la aplicación. Puede ver libros y obtenerlos para un préstamo. Algunos usuarios pueden tener la capacidad de realizar tareas administrativas.
* **Categoría**: es un contenedor lógico de propósito general, utilizado para organizar categorías más precisas. Ejemplos: Negocios, Política, Tecnología, Derecho.
* **Subcategoría**: un contenedor lógico y específico. Ejemplos: Ciencia Ficción, Novela Romántica de Vampiros, etc...
* **Préstamo**: representa el evento de un préstamo.


## Matriz de relaciones


 | Libro | Autor | Revistas | Usuarios | Editorial | categoria | Tipos de recurso | Prestamo 
----|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:
Libro               |   -   |   N-N    |          |          |    N-1    |   N-1     |       N-1         |    1-N     |   
Autor               |       |    -     |          |          |           |           |                   |            |
Revistas            |       |          |     -    |          |           |           |                   |    1-N     |
Usuarios            |       |          |          |     -    |           |           |                   |    1-N     | 
Editorial           |       |          |          |          |     -     |           |                   |            |
Categoria           |       |          |          |          |           |     -     |                   |            |
Tipos de recurso    |       |          |          |          |           |           |         -         |    N-1     |
Prestamo            |       |          |          |          |           |           |                   |      -     |



## Tablas

* **Books**
    * book_id (isbn)
    * title
    * published_date
    * pages
    * copies
    * publishing_house_id
    * category_id
* **Authors_Books**
* **Books_Subcategories**
* **Books_Users**
* **Authors**
    * author_id
    * first_name
    * last_name
    * nationality (?!)
    * born_date (?!)
* **Magazines**
    * magazine_id
    * title
    * volume
    * published_date
    * copies
* **Magazines_Users**
* **Users**
    * user_id
    * first_name
    * last_name
    * email
    * password_digest
    * remember_token
* **Categories**
    * category_id
    * category
* **ItemTypes**
    * item_type_id
    * item_type
* **Loan**
    * loan_id
    * item_type_id
    * item_id
    * user_id
    * timestamps
    * returned_at


## Instalación

#### Versión de Ruby

    $ rvm list
    
    =* ruby-2.0.0-p247 [ x86_64 ]
    
    
#### Instalación de dependencias
    
    $ bundle install

#### Configuración

#### Creación de base de datos
    $ bundle exec rake db:create
    $ bundle exec rake db:migrate

#### Instalación de devise

Agregar le gema devise en el gemfile 

    gem 'devise'

Después de agregar al gemfile e instalar devise, utilizamos el siguiente generador:

    $ rails generate devise:install

Genera lo necesario para utilizar devise, pero hay que dar un vistazo al código generado.

Despues de esto podemos integrarlo al modelo User:

    $ rails generate devise Users


#### Inicialización de base de datos
    
    $ bundle exec rake db:seed
    
Para crear e inicializar en un solo paso:

    $ bundle exec rake db:setup

#### Cómo ejecutar las pruebas

    $ rake [test]

#### Deploy

TODO


## Autores

* Uriel **"Sílaarma"** Molina ([@urielable](http://twitter.com/urielable))
* Adrian **"Mostacho"** Ayala ([@adrrian17](http://twitter.com/adrrian17))
* Daniel **"Nolaarma"** Martínez ([@dtumbolia](http://twitter.com/dtumbolia))

## Licencia

Copyright 2013 Uriel Molina, Adrian Ayala, Daniel Martínez

Licensed under the Apache License, Version 2.0: http://www.apache.org/licenses/LICENSE-2.0
