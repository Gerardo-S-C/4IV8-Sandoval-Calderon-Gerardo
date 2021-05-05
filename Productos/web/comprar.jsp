<%-- 
    Document   : comprar
    Created on : 4/05/2021, 07:01:18 PM
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
                        set = con.createStatement();
                        //necesito los parametros del formulario
                        String q;
                        
                        q = "truncate table mticket";
                        
                        int eliminar = set.executeUpdate(q);
                        
                        %>
                        <h1>Compra exitosa, gracias cliente con dinero infinito <3</h1>
                        <%
                            set.close();
                    
                }catch(SQLException ed){
                        System.out.println("Error al eliminar el registro en la tabla");
                        System.out.println(ed.getMessage());
                        %>
                        <h1>Que haces aca?</h1>
                        <%
                        
                
                }
                con.close();
            
            }catch(Exception e){
                System.out.println("Error al conectar con la bd");
                System.out.println(e.getMessage());
                System.out.println(e.getStackTrace());
                %>
                <br>
                <h1>Sitio en Construccion</h1>        
                        <%
            }
            
            %>
        
        
        <a href="index.html" >Regresar a la Pagina Principal</a>   
    </body>
</html>
