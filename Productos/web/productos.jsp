<%-- 
    Document   : newjsp
    Created on : 3/05/2021, 08:05:12 PM
    Author     : illum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <link rel="stylesheet" href="./CSS/productos.css">
    </head>
    <body>
        <h1 class="titulo">Productos que ofrecemos</h1>
        <div class="Helado">
            <table border="2">
                <thead>
                    <tr>
                        <th>Id_helado</th>
                        <th>Sabor</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        //aqui ya puedo incorporar codigo java
                        Connection con = null;
                        Statement set = null;
                        ResultSet rs = null;
                        String url, userName, password, driver;
                        url = "jdbc:mysql://localhost/productos";
                        userName = "root";
                        password = "illuminova";
                        driver = "com.mysql.jdbc.Driver";
                        
                        try{
                            Class.forName(driver);
                            con = DriverManager.getConnection(url, userName, password);
                            try{
                                String q;
                                q = "select * from mproducto";
                                set = con.createStatement();
                                rs = set.executeQuery(q);
                                while(rs.next()){
                                    %>
                <tr>
                    <td><%=rs.getInt("id_helado")%> </td>
                    <td><%=rs.getString("sabor")%> </td>    
                </tr>       
                
                                    <%
                                        
                                }
                            rs.close();    
                            set.close();
                            
                            }catch(SQLException ed){
                                System.out.println("Error al consultar la tabla");
                                System.out.println(ed.getMessage());
                                %>
                </tbody>
            </table>
                
                <br>
                <h1>Error no se pueden visualiar los datos en este momento</h1>
                                <%
                            
                            }
                        con.close();
                        
                        }catch(Exception e){
                            System.out.println("Error al conectar la bd");
                            System.out.println(e.getMessage());
                            System.out.println(e.getStackTrace());
                        %>
                <br>
                <h1>Sitio en Construccion</h1>
        </table>
                
                        <%
                        
                        }
                        
                    %> 

                        <table border="2">
                <thead>
                    <tr>
                        <th>ID_gramaje</th>
                        <th>Gramos</th>
                        <th>Tamaño</th>
                        <th>Precio</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    try{
                            Class.forName(driver);
                            con = DriverManager.getConnection(url, userName, password);
                            try{
                                String q;
                                q = "select * from mgramaje";
                                set = con.createStatement();
                                rs = set.executeQuery(q);
                                while(rs.next()){
                                    %>
                                                    <tr>
                    <td><%=rs.getInt("id_gramaje")%> </td>
                    <td><%=rs.getString("gramos")%> </td>    
                    <td><%=rs.getString("size")%> </td>    
                    <td><%=rs.getString("precio")%> </td>    
                </tr>                
                                    <%
                                        
                                }
                            rs.close();    
                            set.close();
                            
                            }catch(SQLException ed){
                                System.out.println("Error al consultar la tabla");
                                System.out.println(ed.getMessage());
                                %>
                </tbody>
            </table>
                <br>
                <h1>Error no se pueden visualiar los datos en este momento</h1>
                                <%
                            
                            }
                        con.close();
                        
                        }catch(Exception e){
                            System.out.println("Error al conectar la bd");
                            System.out.println(e.getMessage());
                            System.out.println(e.getStackTrace());
                        %>
                <br>
                <h1>Sitio en Construccion</h1>        
                        <%
                        
                        }
                        
                    %>
                                </table>
                                                <table border="2">
                    <thead>
                        <tr>
                            <th>ID_servir</th>
                            <th>Forma de servir</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                    try{
                            Class.forName(driver);
                            con = DriverManager.getConnection(url, userName, password);
                            try{
                                String q;
                                q = "select * from cservir";
                                set = con.createStatement();
                                rs = set.executeQuery(q);
                                while(rs.next()){
                                    %>
                                                    <tr>
                    <td><%=rs.getInt("id_servir")%> </td>
                    <td><%=rs.getString("forma_servir")%> </td>    
                </tr>                
                                    <%
                                        
                                }
                            rs.close();    
                            set.close();
                            
                            }catch(SQLException ed){
                                System.out.println("Error al consultar la tabla");
                                System.out.println(ed.getMessage());
                                %>
                </tbody>
            </table> 
                <br>
                <h1>Error no se pueden visualiar los datos en este momento</h1>
                                <%
                            
                            }
                        con.close();
                        
                        }catch(Exception e){
                            System.out.println("Error al conectar la bd");
                            System.out.println(e.getMessage());
                            System.out.println(e.getStackTrace());
                        %>
                <br>
                <h1>Sitio en Construccion</h1>        
                        <%
                        }
                        //Usar un form para obtener los datos que se quieren tener, como el sabor, tamaño
                        //forma de servirlo y precio, si la forma es de copa, solo tendra 1 precio, si es de
                        //de los otras 2 formas, solo tendran 2 pecios, isi pisi lemon squisi
                        //se obtendra la id, se pasara a la tabla de mticket
                        //se obtendran los datos ingresados y se mandaran a imprimir como un ticket con el id de folio
                        //si se piden mas de 1 helado, se obtendra el int del precio y se sumara, al final, como se 
                        //mostrara en el folio si solo es 1, se muestran los precios de c/u y el total. fin de lo que hay que hacer
                    %>             
        </table>
                    </div>



        <div class="carrito">
            <label>Ingrese solo el ID para comprar</label>
            <form method="post" name="actualizar" action="carrito.jsp">
                <label for="sabor">Sabor</label><br>
                <input type="number" id="sabor" name="sabor"required min="1" max="8"size="10" maxlength="10"><br>
                <label for="size">Tamaño</label><br>
                <input type="number" id="size" name="size"required min="1" max="3"size="10" maxlength="10"><br>
                <label for="servido">Forma de servido</label><br>
                <input type="number" id="servido" name="servido"required min="1" max="3"size="10" maxlength="10"><br>
                <input type="submit" value="Agregar al carrito" size="10" maxlength="10">
            </form>
        </div>
        <div class="link_regreso">
            <a href="index.html" >Regresar a la Pagina Principal</a>
            <footer>
        <h1>Sandoval Calderón Gerardo</h1>
        <h1>Cruz Santos Cristian Oziel</h1>
        <h1>Camacho Zavala Ricardo</h1>
    </footer>
    </body> 
</html>
