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


 | Libro | Autor | Revista | Usuario | Editorial | Categoría | Subcategoría
----|----|:----:|----|:----:|:----:|:----:|:----:|:----:
**Libro** | | N - N | | N - N | N - 1 | N - 1 | N - N
**Autor** | | | | | | |
**Revista** | | | | N - N | | |
**Usuario** | | | | | | |
**Editorial** | | | | | | |
**Categoría** | | | | | | | 1 - N
**Subcategoría** | | | | | | |


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
* **Subcategories**
    * subcategory_id
    * subcategory
    * category_id
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

    $ bundle exec rake db:migrate

#### Inicialización de base de datos
    
    $ bundle exec rake db:seed
    
Para crear e inicializar en un solo paso:

    $ bundle exec rake db:setup

#### Cómo ejecutar las pruebas

    $ rake [test]

#### Deploy

TODO


## Autores

* Uriel "**Nolaarma**" Molina ([@urielable](http://twitter.com/urielable))
* Adrian "**Mostacho**" Ayala ([@adrrian17](http://twitter.com/adrrian17))
* Daniel "**Sílaarma**" Martínez ([@dtumbolia](http://twitter.com/dtumbolia))

## Licencia

Copyright 2013 Uriel Molina, Adrian Ayala, Daniel Martínez

Licensed under the Apache License, Version 2.0: http://www.apache.org/licenses/LICENSE-2.0
