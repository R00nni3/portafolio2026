<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String email = request.getParameter("email");
    String mensaje = "";
    boolean exito = false;

    // Datos de conexión a MySQL
    String url = "jdbc:mysql://localhost:3306/portafolio?useSSL=false&serverTimezone=UTC";
    String usuario = "root";
    String contrasena = "IPCHILE2026."; 

    Connection conexion = null;
    PreparedStatement statement = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conexion = DriverManager.getConnection(url, usuario, contrasena);

        String sql = "INSERT INTO suscriptores (email) VALUES (?)";
        statement = conexion.prepareStatement(sql);
        statement.setString(1, email);
        statement.executeUpdate();

        exito = true;
        mensaje = "¡Gracias por suscribirte!";

    } catch (SQLIntegrityConstraintViolationException e) {
        mensaje = "Este correo ya está suscrito.";
    } catch (Exception e) {
        mensaje = "Ocurrió un error: " + e.getMessage();
    } finally {
        if (statement != null) statement.close();
        if (conexion != null) conexion.close();
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Suscripción</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
    <div class="container py-5 text-center">
        <h2 class="titulo-destacado"><%= exito ? "¡Listo!" : "Ups..." %></h2>
        <p><%= mensaje %></p>
        <a href="../index.html" class="btn btn-primary mt-3">Volver al inicio</a>
    </div>
</body>
</html>