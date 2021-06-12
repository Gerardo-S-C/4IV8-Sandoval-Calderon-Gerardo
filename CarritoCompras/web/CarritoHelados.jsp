<%-- 
    Document   : CarritoHelados
    Created on : 7/06/2021, 07:10:52 PM
    Author     : illum
--%>

<%@page import="Modelo.DCompra"%>
<%@page import="Modelo.MProducto"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" %>

<%
    String usuario = "";
    double totalpagar = 0;
    HttpSession sesionuok = request.getSession();
    if(sesionuok.getAttribute("usuario")==null){
    
    %>
    
    <jsp:forward page="index.html">
        <jsp:param name="error" value="Es obligatorio Identificarse" />
        
    </jsp:forward>
    
    <%
    
    }else{
        usuario = (String)sesionuok.getAttribute("usuario");
    }
    %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito</title>
        <link rel="stylesheet" href="./CSS/consultausuarios.css">
    </head>
    <body>
        
        <%
              //obtener primero el carrito
            Vector<DCompra> vectorDetCompra = (Vector<DCompra>)sesionuok.getAttribute("detalleVenta");
            %>
            <div class="productos">
            <table border="2">
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Cantidad comprada</th>
                        <th>Precio</th>
                        <th>Sabor</th>
                        <th>Usuario</th>
                    </tr>
                </thead>
                <tbody>
                        <tr>
                    <%
                    for(DCompra detcompra : vectorDetCompra){
                            totalpagar += detcompra.getSubtotal_compra();
                    %>    
                            <td><%=detcompra.getId_producto() %></td>
                            <td><%=detcompra.getCantidad_compra() %></td>
                            <td><%=detcompra.getSubtotal_compra() %></td>
                            <td><%=detcompra.getSabor() %></td>
                            <td><%=usuario%></td>
                        </tr>
                            <%
                    }%>
                        <tr>
                            <td>Total: </td>
                            <td><%=totalpagar %></td>
                        </tr>
                </tbody>
            </table>
            </div>
            <form>
                <a href="MensajeCompra.jsp" class="cerrarS1">Comprar</a>
                <br>
                <a href="MostrarHelados.jsp" class="cerrarS2">Seguir comprando</a>
            </form>
                                    <footer>
                <h1>Sandoval Calderón Gerardo</h1>
                <h1>Cruz Santos Cristian Oziel</h1>
                <h1>Camacho Zavala Ricardo</h1>
            </footer>
    </body>
</html>
