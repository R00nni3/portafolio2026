<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String nombre = request.getParameter("nombre");
    String correo = request.getParameter("correo");
    String telefono = request.getParameter("telefono");
    String motivo = request.getParameter("motivo");
    String mensaje = request.getParameter("mensaje");

    String resultado = "";
    boolean exito = false;

    String url = "jdbc:mysql://localhost:3306/portafolio?useSSL=false&serverTimezone=UTC";
    String usuario = "root";
    String contrasena = "IPCHILE2026.";

    Connection conexion = null;
    PreparedStatement statement = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conexion = DriverManager.getConnection(url, usuario, contrasena);

        String sql = "INSERT INTO contactos (nombre, correo, telefono, motivo, mensaje) VALUES (?, ?, ?, ?, ?)";
        statement = conexion.prepareStatement(sql);
        statement.setString(1, nombre);
        statement.setString(2, correo);
        statement.setString(3, telefono);
        statement.setString(4, motivo);
        statement.setString(5, mensaje);
        statement.executeUpdate();

        exito = true;
        resultado = "¡Gracias " + nombre + ", tu mensaje fue enviado! Te responderé pronto.";

    } catch (Exception e) {
        resultado = "Ocurrió un error: " + e.getMessage();
    } finally {
        if (statement != null) statement.close();
        if (conexion != null) conexion.close();
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Contacto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div class="container py-5 text-center">
        <h2 class="titulo-destacado"><%= exito ? "¡Mensaje enviado!" : "Ups..." %></h2>
        <p><%= resultado %></p>
        <a href="../index.html" class="btn btn-primary mt-3">Volver al inicio</a>
    </div>
</body>
</html>