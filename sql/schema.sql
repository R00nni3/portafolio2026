--Base de datos para guardar los correos de quienes se suscriben al newsletter.
create database portafolio;
use portafolio; 

create table suscriptores (
id int auto_increment primary key,
email varchar(50) not null unique,
fecha_ingreso datetime default current_timestamp
);

create table contactos (
id int auto_increment primary key,
nombre varchar(50) not null,
correo varchar(50) not null, 
telefono varchar(13),
motivo varchar(50) not null,
mensaje text not null,
fecha_envio datetime default current_timestamp
);