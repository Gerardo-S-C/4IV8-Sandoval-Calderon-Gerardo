<%-- 
    Document   : MostrarAdministrador
    Created on : 11/06/2021, 04:45:27 PM
    Author     : illum
--%>
<%@page import="Control.Conexion"%>
<%@page import="java.sql.*"%>
<%@page import="Modelo.DCompra"%>
<%@page import="Modelo.MProducto"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <title>Administrador</title>        
        <link rel="stylesheet" href="./CSS/consultausuarios.css">

    </head>
    <body>
        <h1>Bienvenido</h1>        
        <br>
        <div>
            <form method="post" action="index.html" name="cerrarS">
                <input type="submit" value="Cerrar Sesión" class="cerrarS">
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
                            <h1>Ingrese un nuevo producto para presentar</h1>
        <div class="box">

            <form method="post"  name="agregar" action="AgregarAdmin">
                <table>
                    <tr>
                        <td>
                    <label for="precio">Precio </label><br>
                    <input type="number" id="precio" name="precio" required min="1" max="50" size="10"><br>
                        </td>
                        <td>
                    <label for="idsabor">Sabor </label><br>
                    <input type="number" id="idsabor" name="idsabor" required min="1" max="3" size="10"><br>
                        </td>
                        <td>
                    <label for="idcantidad">Cantidad </label><br>
                    <input type="number" id="idcantidad" name="idcantidad" required min="1" max="2" size="10"><br>
                        </td>
                        <td>
                    <label for="idsize">Tamaño </label><br>
                    <input type="number" id="idsize" name="idsize" required min="1" max="3" size="10"><br>
                        </td>
                        <td>
                    <label for="idpresentacion">Presentacion </label><br>
                    <input type="number" id="idpresentacion" name="idpresentacion" required min="1" max="3" size="10"><br>
                        </td>
                        <td>
                    <label for="precioproducto">Precio del producto </label><br>
                    <input type="number" id="precioproducto" name="precioproducto" required min="10" max="50" size="10"><br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <input type="submit" value="AgregarAdmin" size="10" class="cerrarS2">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
                            <footer>
                <h1>Sandoval Calderón Gerardo</h1>
                <h1>Cruz Santos Cristian Oziel</h1>
                <h1>Camacho Zavala Ricardo</h1>
            </footer>
    </body>
</html>
