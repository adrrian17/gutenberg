## Gutenberg

**Gutenberg** es una pequeña biblioteca. Administra préstamos de libros y revistas, así como los propios libros y revistas.

Master  
[![Build Status](https://travis-ci.org/adrrian17/gutenberg.png?branch=master)](https://travis-ci.org/adrrian17/gutenberg)  
Dev  
[![Build Status](https://travis-ci.org/adrrian17/gutenberg.png?branch=dev)](https://travis-ci.org/adrrian17/gutenberg)

[![Coverage Status](https://coveralls.io/repos/adrrian17/gutenberg/badge.png?branch=dev)](https://coveralls.io/r/adrrian17/gutenberg?branch=dev)

## Lista de recursos

* **Libro**: es la representación de un libro físico.
* **Autor**: se refiere a la persona creadora del libro.
* **Revista**: colección de artículos relacionados por un tema general.
* **Usuario**: usuario de la aplicación. Puede ver libros y obtenerlos para un préstamo. Algunos usuarios pueden tener la capacidad de realizar tareas administrativas.
* **Categoría**: es un contenedor lógico de propósito general, utilizado para organizar categorías más precisas. Ejemplos: Negocios, Política, Tecnología, Derecho.
* **Préstamo**: representa el evento de un préstamo.


## Matriz de relaciones


 | Libro | Autor | Revistas | Usuarios | Editorial | Categoria | Tipos de recurso | Préstamo
----|:----:|:----:|:----:|:----:|:----:|:----:|:----:|:----:
Libro               |   -   |   N-N    |          |          |    N-1    |   N-1     |       N-1         |    1-N     |
Autor               |       |    -     |          |          |           |           |                   |            |
Revistas            |       |          |     -    |          |           |   N-1     |       N-1         |    1-N     |
Usuarios            |       |          |          |     -    |           |           |                   |    1-N     |
Editorial           |       |          |          |          |     -     |           |                   |            |
Categoria           |       |          |          |          |           |     -     |                   |            |
Tipos de recurso    |       |          |          |          |           |           |         -         |    N-1     |
Prestamo            |       |          |          |          |           |           |                   |      -     |



## Tablas

* **Books**
    * title
    * published_date
    * pages
    * copies
    * publishing_house_id
    * category_id
    * timestamps
    * slug
* **Authors_Books**
    * book_id
    * timestamps
* **Books_Users**
    * user_id
    * timestamps
* **Authors**
    * first_name
    * last_name
    * timestamps
    * slug
* **Magazines**
    * title
    * volume
    * published_date
    * copies
    * timestamps
    * slug
* **Magazines_Users**
    * magazine_id
    * user_id
    * timestamps
* **Users**
    * first_name
    * last_name
    * email
    * password_digest
    * remember_token
    * timestamps
* **Categories**
    * category
    * timestamps
    * slug
* **ItemTypes**
    * item_type
    * timestamps
* **Loan**
    * item_type_id
    * item_id
    * user_id
    * returned_at
    * timestamps
* **Publishing Houses**
    * publishing_house
    * timestamps
    * slug


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

* Uriel **"Able"** Molina ([@urielable](http://twitter.com/urielable))
* Adrian **"Mostacho"** Ayala ([@adrrian17](http://twitter.com/adrrian17))
* Daniel Martínez ([@dtumbolia](http://twitter.com/dtumbolia))

## Licencia

Copyright 2013 Uriel Molina, Adrian Ayala, Daniel Martínez

Licensed under the Apache License, Version 2.0: http://www.apache.org/licenses/LICENSE-2.0
