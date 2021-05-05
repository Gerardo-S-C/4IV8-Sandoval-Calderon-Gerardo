<%-- 
    Document   : carrito
    Created on : 4/05/2021, 02:50:03 PM
    Author     : illum
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="java.sql.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>carrito</title>
        <link rel="stylesheet" href="./CSS/productos.css">
    </head>
    <body>
        
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
            
            //diferentes vistas para los errores
            //error exclusivo de sql
            try{
                set = con.createStatement();
                //necesito los parametros del formulario
                String sabor, size, forma_servir, q, p, t, r;
                
                sabor = request.getParameter("sabor");
                size = request.getParameter("size");
                forma_servir = request.getParameter("servido");
                
                
                q = "insert into mticket(sabor, size, forma_servir) "
                        + "values ('"+sabor+"', '"+size+"', '"+forma_servir+"')";
                //filtra las tablas para mostrar lo que quiere ver el comprador
                p = "select mticket.id_ticket,"
                    +"mproducto.sabor,"
                    +"mgramaje.size,"
                    +"cservir.forma_servir,"
                    +"mgramaje.precio "
                    +"from mticket inner join mproducto "
                    +"on mticket.sabor=mproducto.id_helado "
                    +"inner join mgramaje "
                    +"on mticket.size=mgramaje.id_gramaje "
                    +"inner join cservir "
                    +"on mticket.forma_servir=cservir.id_servir";
                //suma los valores de precio
                t="select sum(precio) total from mticket inner join mgramaje on mticket.size=mgramaje.id_gramaje";
                int registro = set.executeUpdate(q);
                %>
                <h1>Su carrito hasta ahora</h1>
                <div class="Helado">
                <table border="2">
                    <thead>
                        <tr>
                            <td>Ticket</td>
                            <td>Sabor</td>
                            <td>Tamaño</td>
                            <td>Servido en</td>
                            <td>Precio individual</td>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                                rs = set.executeQuery(p);
                                while(rs.next()){
                                    %>
                <tr>
                    <td><%=rs.getInt("mticket.id_ticket")%> </td>
                    <td><%=rs.getString("mproducto.sabor")%> </td>
                    <td><%=rs.getString("mgramaje.size")%> </td>
                    <td><%=rs.getString("cservir.forma_servir")%> </td>                                        
                    <td><%=rs.getString("mgramaje.precio")%> </td>                                        
                </tr>

                                    <%
                                
                                }
                        %>
                        <%try{
                            Class.forName(driver);
                            con = DriverManager.getConnection(url, userName, password);
                            try{
                                set = con.createStatement();
                                rs = set.executeQuery(t);
                                while(rs.next()){
                                    %>
                <tr>
                    <td>TOTAL</td>
                    <td><%=rs.getInt("total")%> </td>   
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
                    </tbody>
                </table>
                <%
                    rs.close();
                set.close();
            
            }catch(SQLException ed){
                System.out.println("Error al registrar en la tabla");
                System.out.println(ed.getMessage());
                
                %>
                <h1>Registro No Exitoso, error en la lectura de la tabla</h1>
                <%
            
            }
            con.close();
            
        }catch(Exception e){
            System.out.println("Error al conectar bd");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
            %>
            <h1>Sitio en Construccion</h1>
            <%        
        }            
            %>
                </div>
            <form class="comprar" method="post" name="comprar" action="comprar.jsp">
                <input type="submit" id="comprar" name="comprar" value="Comprar" >
            </form>
        <a href="productos.jsp" >Seguir comprando</a>
        <footer>
        <h1>Sandoval Calderón Gerardo</h1>
        <h1>Cruz Santos Cristian Oziel</h1>
        <h1>Camacho Zavala Ricardo</h1>
    </footer>
    </body>
</html>