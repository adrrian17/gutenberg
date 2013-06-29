## Gutenberg

**Gutenberg** es una pequeña biblioteca. Administra préstamos de libros y revistas, así como los propios libros.


## Lista de recursos

* *Libro*: es la representación de un libro físico.
* *Autor*: se refiere a la persona creadora del libro.
* *Revista*: colección de artículos relacionados por un tema general.
* *Usuario*: usuario de la aplicación. Puede ver libros y obtenerlos para un préstamo. Algunos usuarios pueden tener la capacidad de realizar tareas administrativas.
* *Categoría*: es un contenedor lógico de propósito general, utilizado para organizar categorías más precisas. Ejemplos: Negocios, Política, Tecnología, Derecho.
* *Subcategoría*: un contenedor lógico y específico. Ejemplos: Ciencia Ficción, Novela Romántica de Vampiros, etc...


## Matriz de relaciones

_            | Libro |   Autor  | Revista | Usuario | Editorial | Categoría | Subcategoría
             | ----- | -------- | ------- | ------- | --------  | --------- | -----------
Libro        |       |  n-n     |         |   n-n   | n-1       |   n-1     |  n-n
Autor        |       |          |         |         |           |           | 
Revista      |       |          |         |   n-n   |           |           |
Usuario      |       |          |         |         |           |           |
Categoría    |       |          |         |         |           |           |  1-n
Subcategoría |       |          |         |         |           |           |


## Tablas

* Books
    * id (isbn)
    * title
    * published_date
    * pages
    * copies
    + publishing_house_id
    + category_id
* Authors_Books
* Books_Subcategories
* Books_Users
* Authors
    * id
    * first_name
    * last_name
    * nationality (?!)
    * born_date (?!)
* Magazines
    * id
    * title
    * volume
    * published_date
    * copies
* Magazines_Users
* Users
    * id
    * first_name
    * last_name
    * email
    * password_digest
    * remember_token
* Categories
    * id
    * title
* Subcategories
    * id
    * title
    + category_id    


## Instalación

#### Versión de Ruby

    $ rvm list
    
    =* ruby-2.0.0-p195 [ x86_64 ]
    
    
#### Instalación de dependencias
    
    $ bundle install

#### Configuración

#### Creación de base de datos

    $ bundle exec rake db:migrate

#### Inicialización de base de datos
    
    $ bundle exec rake db:seed
    
Para crear e inicializar en un solo paso:

    $ bundle exec rake db:setup

#### Cómo ejecutar las pruebas

    $ rake

#### Deploy



## Autores

* Uriel Molina ([@urielable](http://twitter.com/urielable))
* Adrian Ayala ([@adrrian17](http://twitter.com/adrrian17))
* Daniel Martínez ([@dtumbolia](http://twitter.com/dtumbolia))

## Licencia

Copyright 2013 Uriel Molina, Adrian Ayala, Daniel Martínez

Licensed under the Apache License, Version 2.0: http://www.apache.org/licenses/LICENSE-2.0
