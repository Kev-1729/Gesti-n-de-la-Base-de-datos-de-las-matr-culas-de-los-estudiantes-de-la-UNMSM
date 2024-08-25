-- Creacion de tabla de estudiantes
create table "estudiantes"(
    "id" integer,
    "nombre" text not null,
    "apellido_paterno" text not null,
    "apellido_materno" text not null,
    "edad" integer,
    PRIMARY KEY("id")
);

-- Creacion de tabla de profesor
create table "profesor"(
    "id" integer,
    "nombre" text not null,
    "apellido_paterno" text not null,
    "apellido_materno" text not null,
    PRIMARY KEY("id")
);

-- Creacion de tabla de carrera
create table "carrera"(
    "id" integer,
    "estudiante_id" integer,
    "nombre" integer,
    primary key("id"),
    foreign key("estudiante_id") references "estudiantes"("id")
);

-- Creacion de tabla de cursos
create table "cursos"(
    "id" integer,
    "nombre" text not null,
    "creditos" integer,
    PRIMARY KEY("id")
);

-- Creacion de tabla de relacion entre cursos y estudiantes
create table "matricula"(
    "id" integer,
    "estudiante_id" integer,
    "profesor_id" integer,
    "curso_id" integer,
    primary key("id"),
    foreign key("estudiante_id") references "estudiantes"("id"),
    foreign key("profesor_id") references "profesor"("id"),
    foreign key("curso_id") references "cursos"("id")
);
