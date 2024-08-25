# Design Document

By Tupac Agüero, Kevin

Video overview: ([url](https://youtu.be/yFpBwNbnUHM))

## Scope

Esta base de datos incluye todo lo necesario para facilitar la matricula en una universidad y administrar la informacion de cada entidad

* Estudiantes, incluye informacion de los estudiantes
* Profesores, incluye informacion de los profesores
* Cursos, incluye informacion de los cursos
* Carrera, incluye informacion de la carrera
* Matricula, incluye la relacion de estudiantes, profesor y cursos.

## Functional Requirements

* Operaciones CRUD para estudiantes, profesores, cursos y carrera.
* Permitir vizualizar la relacion entre estas entidades.
* Organizado mediante nombre en las tablas de estudiantes y cursos.

## Representation

Las entidades se capturan en tablas SQLite con el siguiente esquema.

### Entities

La base de datos incluye las siguientes entidades:

#### Estudiantes

La tabla `estudiantes` incluye:

* `id`, especifica el ID unico del estudiante como `integer`. Esta columna tiene aplicada la restriccion `primary key`.
* `nombre` especifica el nombre del alumno como `text`, dado que `text` es adecuado para los campos de nombre.
* `apellido_paterno` especifica el nombre del alumno como `text`, dado que `text` es adecuado para los campos de apellido_paterno.
* `apellido_materno` especifica el nombre del alumno como `text`, dado que `text` es adecuado para los campos de apellido_materno.
* `edad` especifica la edad de los estudiantes es de tipo `integer` porque la edad es un valor entero.

Todas las columnas son obligatorias y, por lo tanto, se aplica la restricción `NOT NULL` donde no se aplica una restricción `PRIMARY KEY` o `FOREIGN KEY`.

#### Profesor

La tabla `Profesor` incluye:

* `id` especifica el ID unico del profesor como `integer`. Esta columna tiene aplicada la restriccion `primary key`.
* `nombre` especifica el nombre del profesor como `text`, dado que `text` es adecuado para los campos de nombre.
* `apellido_paterno` especifica el nombre del profesor como `text`, dado que `text` es adecuado para los campos de apellido_paterno.
* `apellido_materno` especifica el nombre del profesor como `text`, dado que `text` es adecuado para los campos de apellido_paterno.

Todas las columnas son obligatorias y, por lo tanto, se aplica la restricción `NOT NULL` donde no se aplica una restricción `PRIMARY KEY` o `FOREIGN KEY`.

#### Carrera

La tabla `Carrera` incluye:

* `id` especifica el ID unico de la carrera como `integer`. Esta columna tiene aplicada la restriccion `primary key`.
* `estudiante_id` que es el ID del estudiante que realizó el envío como un `INTEGER`. Por lo tanto, esta columna tiene aplicada la restricción `FOREIGN KEY`, que hace referencia a la columna `id` en la tabla `estudiantes` para garantizar la integridad de los datos.
* `nombre` especifica el nombre de la carrera como `text`, dado que `text` es adecuado para los campos de nombre.

Todas las columnas son obligatorias y, por lo tanto, se aplica la restricción `NOT NULL` donde no se aplica una restricción `PRIMARY KEY` o `FOREIGN KEY`.

#### Cursos

La tabla `Cursos` incluye:

* `id` especifica el ID unico del curso como `integer`. Esta columna tiene aplicada la restriccion `primary key`.
* `nombre` especifica el nombre del curso como `text`, dado que `text` es adecuado para los campos de nombre.
* `creditos` especifica la cantidad de creditos que tiene el curso por eso es un valor  `INTEGER` ya que es un numero entero los creditos.

Todas las columnas son obligatorias y, por lo tanto, se aplica la restricción `NOT NULL` donde no se aplica una restricción `PRIMARY KEY` o `FOREIGN KEY`.

#### Matricula

La tabla `Matricula` incluye:

* `id` especifica el ID unico de la matricula como `integer`. Esta columna tiene aplicada la restriccion `primary key`.

* `estudiante_id` que es el ID del estudiante que realizó el envío como un `INTEGER`. Por lo tanto, esta columna tiene aplicada la restricción `FOREIGN KEY`, que hace referencia a la columna `id` en la tabla `estudiantes` para garantizar la integridad de los datos.

* `profesor_id` que es el ID del profesor que realizó el envío como un `INTEGER`. Por lo tanto, esta columna tiene aplicada la restricción `FOREIGN KEY`, que hace referencia a la columna `id` en la tabla `profesores` para garantizar la integridad de los datos.

* `curso_id` que es el ID del cursos que realizó el envío como un `INTEGER`. Por lo tanto, esta columna tiene aplicada la restricción `FOREIGN KEY`, que hace referencia a la columna `id` en la tabla `cursos` para garantizar la integridad de los datos.

### Relationships

El siguiente diagrama de relaciones entre entidades describe las relaciones entre las entidades en la base de datos.

![ER Diagram](diagram.png)

Como se detalla en el diagrama:

* Un estudiantes puede estudiar 1 carrera en la universidad, pero muchos estudiantes pueden estudiar 1 la carrera en la universidad.
* Un estudiantes puede tener 1 curso o muchos cursos y 1 curso puede tener muchos estudiantes.
*  Un estudiante puede tener 1 profesor o muchos profesores y un profesor puede dictar 1 estudiantes o muchos estudiantes.
* Un profesor puede enseñar 1 a muchos cursos y un curso puede ser enseñado por 1 o por muchos profesores.

## Optimizations

Segun las consultas en `queries.sql`, mayomente en la base de datos se trata de buscar a un estudiante por eso se creo un index con las columnas `nombre` para acelerar la busqueda de estudiante.

De manera similar tambien se hizo un idex para la columna `nombre` de los cursos para acelarar la busqueda del curso y demas consultas que se quiera realizar con esa columna.

## Limitations

El esquma actual vizualiza la relacion de estudiantes, profesores y cursos, pero no vizualiza la relacion entre los estudiantes, para ello se tendria que realizar un view con una consulta para buscar dicha relacion de compañeros.
