<%@page contentType="text/html" pageEncoding="utf-8" %>
<%@page import="java.util.Map" %>
<%
Map<String,String> errores = (Map<String,String>) request.getAttribute("errores");

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulario de Usuarios</title>
</head>
<body>
<h3>Formulario de Usuarios</h3>
<%
    if(errores!=null && errores.size()>0){

%>
<ul>

    <%
    for(String err : errores.values()){
    %>
    <li><%=err%></li>
    <%}%>
</ul>
<%}%>
<form action="/webapp-form/registro" method="post">
    <div>
        <label for="username">Username: </label>
        <div><input type="text" name="username" id="username"></div>
        <%
        if(errores!=null && errores.containsKey("username")){
            out.println("<small style='color:red;'>" + errores.get("username") + "</small>");
        }
        %>
    </div>
    <div>
        <label for="password">Password:</label>
        <div><input type="password" name="password" id="password"></div>
        <%
            if(errores!=null && errores.containsKey("password")){
                out.println("<small style='color:red;'>" + errores.get("password") + "</small>");
            }
        %>
    </div>
    <div>
        <label for="email">Email: </label>
        <div><input type="text" name="email" id="email"></div>
        <%
            if(errores!=null && errores.containsKey("email")){
                out.println("<small style='color:red;'>" + errores.get("email") + "</small>");
            }
        %>
    </div>
    <div>
        <label for="pais">Pais</label>
        <div>
            <select name="pais" id="pais">
                <option value="">--Seleccionar--</option>
                <option value="ES"> Espania </option>
                <option value="MX">Mexico</option>
                <option value="CL" selected>Chile</option>
                <option value="AR">Argentina</option>
                <option value="PE">Peru</option>
                <option value="CO">Colombia</option>
                <option value="VE">Venezuela</option>
            </select>
        </div>
        <%
            if(errores!=null && errores.containsKey("pais")){
                out.println("<small style='color:red;'>" + errores.get("pais") + "</small>");
            }
        %>
    </div>

    <div>
        <label for="lenguajes">Lenguajes de programacion</label>
        <div>
        <select name="lenguajes" id="lenguajes" multiple>
            <option value="java" selected>Java SE</option>
            <option value="jakarta" selected> Jakarta EE9</option>
            <option value="spring">Spring Boot</option>
            <option value="js">JavaScript</option>
            <option value="angular" selected>Angular</option>
            <option value="react">React</option>
        </select>
    </div>
        <%
            if(errores!=null && errores.containsKey("lenguajes")){
                out.println("<small style='color:red;'>" + errores.get("lenguajes") + "</small>");
            }
        %>
    </div>
    <div>
        <label>Roles</label>
        <div>
            <input type="checkbox" name="roles" value="ROLE_ADMIN" checked>
            <label>Adiministrador</label>
        </div>
        <div>
            <input type="checkbox" name="roles" value="ROLE_USER">
            <label>Usuario</label>
        </div>
        <div>
            <input type="checkbox" name="roles" value="ROLE_MODERATOR">
            <label>Moderador</label>
        </div>
        <%
            if(errores!=null && errores.containsKey("roles")){
                out.println("<small style='color:red;'>" + errores.get("roles") + "</small>");
            }
        %>
    </div>
    <div>
        <label>Idiomas</label>
        <div>
            <input type="radio" name="idioma" value="es">
            <label>Espaniol</label>
        </div>
        <div>
            <input type="radio" name="idioma" value="en">
            <label>Ingles</label>
        </div>
        <div>
            <input type="radio" name="idioma" value="fr">
            <label>Frances</label>
        </div>
        <%
            if(errores!=null && errores.containsKey("idioma")){
                out.println("<small style='color:red;'>" + errores.get("idioma") + "</small>");
            }
        %>
    </div>
    <div>
        <label for="habilitar">Habilitar</label>
         <div>
             <input type="checkbox" name="habilitar" id="habilitar" checked>
         </div>
    </div>

    <div>
        <div>
            <input type="submit" value="Enviar">
        </div>
    </div>

    <input type="hidden" name="secreto" value="12345">
</form>
</body>
</html>