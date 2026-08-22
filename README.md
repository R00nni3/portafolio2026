# portafolio2026 - Rosario González Perucich

Este es un portafolio personal que fue creado para la asignatura de Desarrollo Web II de la profesora Sabina Romero, en él se encuentran una descripción sobre mi, mis proyectos públicos de github, mis habilidades técnicas, experiencia y un buzón de contacto y newsletter, los cuales están conectados en una base de datos mediante JSP.

# Tecnologías utilizadas

-HTML5
-CSS3
-Boostrap 5.3.3
-JavaScript
-JavaServer Pages (JSP) + JDBC
-MySQL
-Apache Tomcat 10
-Git/GitHub

# Estructura

\`\`\`
portafolio/
├── css/
│   └── style.css
├── js/
│   ├── data.js
│   └── script.js
├── jsp/
│   ├── suscribir.jsp
│   └── contacto.jsp
├── sql/
│   └── schema.sql
├── WEB-INF/
│   └── web.xml
├── index.html
├── proyectos.html
├── habilidades.html
├── experiencia.html
├── contacto.html
└── README.md
\`\`\`

# Requisitos
- JDK instalado
- MySql Workbench
- Apache Tomcat instalado y configurado

# Decisiones.

- **Paleta de colores**: Me fui por una paleta de rosa cuarzo y serenidad, con un degradé en diagonal en el fondo, que representan a mi grupo favorito. Y usé violeta/índigo para los detalles, como los acentos para títulos o íconos porque contrastaba bien con el color del fondo.
- **Tipografía**: Usé Inter para el texto en general y JetBrains Mono para títulos destacados.
- **Proyectos** Preferí traer mis proyectos automáticamente desde la API pública de GitHub para no tener que estar listándolos manualmente, para que la sección se vaya actualizando cada vez que se suba un repositorio público nuevo.

# Desafíos encontrados. 

- Por como estaba estructurado mi proyecto, mis archivos usaban rutas con "../", pero al pasar el proyecto a Tomcat la estructura de las carpetas cambiaba, por lo que mejor reorganicé las carpetas del proyecto para que quedaran igual en ambos y quedaran al mismo nivel que en tomcat.
- Tuve algunos problemas con el puerto del LiveServer, por lo que tuve que cambiar de puerto para que pudiera abrirse bien el proyecto.

# Funcionalidades con la base de datos. 

-**Newsletter**: Este guarda el correo de quien se subscriba en la base de datos, evitando duplicados. 
-**Formulario de contacto**: valida los datos tanto en el navegador como en el servidor y guarda los mensajes en la tabla contactos de mi base de datos. 
