--Base de datos para guardar los correos de quienes se suscriben al newsletter.
create database portafolio;
use portafolio; 

create table suscriptores (
id int auto_increment primary key,
email varchar(50) not null unique,
fecha_ingreso datetime default current_timestamp
);