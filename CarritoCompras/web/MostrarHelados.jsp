<%-- 
    Document   : MostarHelados
    Created on : 7/06/2021, 07:10:22 PM
    Author     : illum
--%>
<%@page import="Control.Conexion"%>
<%@page import="java.sql.*"%>
<%@page import="Modelo.DCompra"%>
<%@page import="Modelo.MProducto"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true" %>

<%
    String usuario = "";
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
        <title>Helados Ben and Jerrys</title>
        <link rel="stylesheet" href="./CSS/consultausuarios.css">
    </head>
    <body>
        
        <br>
        <div>
            <form method="post" action="index.html" name="cerrarS">
                <input type="submit" value="Cerrar Sesión" name="cerrarS" class="cerrarS">
            </form>
        </div>
        <br>
                    <h1>Productos que ofrecemos</h1>
        <div class="productos"> 

            <table border="2">
                <thead>
                    <tr>
                        <th>ID_helado</th>
                        <th>Sabor</th>
                    </tr>
                </thead>
                <tbody>
                        <%
                        Connection con = null;
                        PreparedStatement ps = null;
                        ResultSet rs = null;
                        try{
                            con = Conexion.getConexion();
                            String q = "select * from csabores";
                            ps = con.prepareStatement(q);
                            rs = ps.executeQuery();
                            while(rs.next()){
                                %>
                    <tr>
                        <td><%=rs.getInt("id_sabor")%> </td>
                        <td><%=rs.getString("nom_sabor")%> </td>    
                    </tr> 
                                <%
                            }
                        }catch(SQLException ed){
                            System.out.println("Error al consultar los productos");
                            System.out.println(ed.getMessage());
                        }finally{
                                try{
                                    rs.close();
                                    ps.close();
                                    con.close();
                                }catch(Exception e){
                                    System.out.println("No encontro la clase");
                                    System.out.println(e.getMessage());
                                }
                        }
                        %> 
                </tbody>
            </table>

            <table border="2">
                <thead>
                    <tr>
                        <th>ID_Cantidad</th>
                        <th>Valores</th>
                        <th>Unidades maximas</th>
                    </tr>
                </thead>
                <tbody>
                        <%
                        try{
                            con = Conexion.getConexion();
                            String q = "select * from ccantidad";
                            ps = con.prepareStatement(q);
                            rs = ps.executeQuery();
                            while(rs.next()){
                                %>
                    <tr>
                        <td><%=rs.getInt("id_cantidad")%> </td>
                        <td><%=rs.getString("valor_cantidad")%> </td>    
                        <td><%=rs.getString("unidad_cantidad")%></td>
                    </tr> 
                                <%
                            }
                        }catch(SQLException ed){
                            System.out.println("Error al consultar los productos");
                            System.out.println(ed.getMessage());
                        }finally{
                                try{
                                    rs.close();
                                    ps.close();
                                    con.close();
                                }catch(Exception e){
                                    System.out.println("No encontro la clase");
                                    System.out.println(e.getMessage());
                                }
                        }
                        %> 
                </tbody>
            </table>

            <table border="2">
                <thead>
                    <tr>
                        <th>ID_Tamaño</th>
                        <th>Tamaños</th>
                    </tr>
                </thead>
                <tbody>
                        <%
                        try{
                            con = Conexion.getConexion();
                            String q = "select * from csize";
                            String t = "select * from presentacion";
                            ps = con.prepareStatement(q);
                            rs = ps.executeQuery();
                            while(rs.next()){
                                %>
                    <tr>
                        <td><%=rs.getInt("id_size")%> </td>
                        <td><%=rs.getString("nom_size")%> </td>    
                    </tr> 
                                <%
                            }
                        }catch(SQLException ed){
                            System.out.println("Error al consultar los productos");
                            System.out.println(ed.getMessage());
                        }finally{
                                try{
                                    rs.close();
                                    ps.close();
                                    con.close();
                                }catch(Exception e){
                                    System.out.println("No encontro la clase");
                                    System.out.println(e.getMessage());
                                }
                        }
                        %> 
                </tbody>
            </table>

            <table border="2">
                <thead>
                    <tr>
                        <th>ID_presentacion</th>
                        <th>Presentaciones</th>
                    </tr>
                </thead>
                <tbody>
                        <%
                        try{
                            con = Conexion.getConexion();
                            String q = "select * from cpresentacion";
                            ps = con.prepareStatement(q);
                            rs = ps.executeQuery();
                            while(rs.next()){
                                %>
                    <tr>
                        <td><%=rs.getInt("id_presentacion")%> </td>
                        <td><%=rs.getString("tipo_presentacion")%> </td>    
                    </tr> 
                                <%
                            }
                        }catch(SQLException ed){
                            System.out.println("Error al consultar los productos");
                            System.out.println(ed.getMessage());
                        }finally{
                                try{
                                    rs.close();
                                    ps.close();
                                    con.close();
                                }catch(Exception e){
                                    System.out.println("No encontro la clase");
                                    System.out.println(e.getMessage());
                                }
                        }
                        %> 
                </tbody>
            </table>
        </div>
                <h1>Productos disponibles</h1>
                <div class="productos">
            
            <%
            //todos los productos
            Vector<MProducto> vecproducto = new MProducto().listaProductos();
            %>
            <table border="2">
                <thead>
                    <tr>
                        <th>ID producto</th>
                        <th>Precio producto</th>
                        <th>Sabor</th>
                        <th>Cantidad</th>
                        <th>Tamaño</th>
                    </tr>
                </thead>
                <tr>
            <%
                //recorrer el vector del producto
                for(MProducto producto : vecproducto){
                //voy imprimiendo producto por producto
            %>
                    <td><%=producto.getId_producto()%></td>
                    <td><%=producto.getPrecio_producto() %></td>
                    <td><%=producto.getNom_sabor() %></td>   
                    <td><%=producto.getUnidad_cantidad() %></td>
                    <td><%=producto.getNom_size() %></td>
                </tr>
            <%
                }
            %>
            </table>
        </div>
        <h1>Ingrese el helado que quiere comprar.</h1>
        <h2>Solo ingrese valores numericos para una consulta mas sencilla:</h2>
        <br>
        <form method="post" name="agregar" action="AgregarCarrito">
            <label for="txtCodigo">ID del producto: </label><br>
            <input type="number" id="txtCodigo" name="txtCodigo" required min="1" size="10"><br>
            <label for="txtCantidad">Cantidad a comprar: </label><br>
            <input type="number" id="txtCantidad" name="txtCantidad" required min="1" size="10"><br>
            <input type="submit" value="AgregarCarrito" size="10">
        </form>
            <footer>
                <h1>Sandoval Calderón Gerardo</h1>
                <h1>Cruz Santos Cristian Oziel</h1>
                <h1>Camacho Zavala Ricardo</h1>
            </footer>
    </body>
</html>