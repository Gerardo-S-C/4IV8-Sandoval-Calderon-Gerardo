/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author illum
 */
/*
Connection nos ayuda a realizar la conexion con las bd, con el servidor
*/
import java.sql.Connection;
import java.sql.DriverManager;
/*
Statement nos ayuda a poder definir y manipular los datos de las bd
creacion de la bd, insertar tablas, eleminar tablas,  create, drop, alter
    manipulacion de los datos, insert, update, delete
*/
import java.sql.Statement;
/*
nos ayuda para las querrys, o las consultas a la bd
*/
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletConfig;

public class Actualizar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    private Connection con;
    private Statement set;
    private ResultSet rs;
    
    public void init (ServletConfig cfg) throws ServletException{
        
        //lo primero que necesitamos es trazar la ruta al servidor DB
        String URL = "jdbc:mysql:3306//localhost/registro4iv8";
        //driver:gestor:puerto//IP/nombreBD
        
        String userName = "root";
        String password = "illuminova";
        
         try{
            //colocamos el tipo de driver
            Class.forName("com.mysql.jdbc.Driver");
            
            /*
            en algunas ocaciones enviar error al conectarse con la bd
            y eso se debe a que ya estegrado el puerto en el driver
            URL = "jdbc:mysql://localhost/registro4iv8";
            */
            URL = "jdbc:mysql://localhost/registro4iv8";
            con = DriverManager.getConnection(URL, userName, password);
            set = con.createStatement();
            System.out.println("Conexion exitosa");
        
        }catch(Exception e){
            
            System.out.println("Conexion no exitosa");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        
        }
    }
    
    protected void processRequest(HttpServletRequest request, 
            HttpServletResponse response)
        throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {                      

    }
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try(PrintWriter out = response.getWriter()){
            /* TODO output your page here. You may use following sample code. */
            
            
            String nomnvo, appatnvo, apmatnvo, correonvo;
            int idnvo,edadnvo;

            nomnvo= request.getParameter("nombrenvo");
            appatnvo= request.getParameter("appatnvo");
            apmatnvo= request.getParameter("apmatnvo");
            correonvo= request.getParameter("correonvo");
            idnvo= Integer.parseInt(request.getParameter("idactualizar"));
            edadnvo= Integer.parseInt(request.getParameter("edadnvo"));    
                                    
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Actualizar</title>"
                    + "<link rel=\"stylesheet\" type=\"text/css\" href=\"./CSS/estilos-servlet.css\">\n" +
"        <script src=\"./JS/servlet-js.js\"></script>");            
            out.println("</head>");
            out.println("<body>");

                try{    
                String q = "update mregistro set nom_usu='"+nomnvo+"', appat_usu='"+appatnvo+"',"
                + "apmat_usu='"+apmatnvo+"',correo_usu='"+correonvo+"' ,"
                + "edad_usu='"+edadnvo+"' where id_usu="+idnvo;   
                    
                    set.executeUpdate(q);

                    rs.close();
                    set.close();
                    out.println("<h1>Actualizar datos con exito</h1>");
                    out.println("</div>");
                        System.out.println("Actualizacion correcta");   
                    
                    }catch(Exception e){
                    out.println("<h1>Fallo en actualizacion</h1>");
                        System.out.println("No se actualizo en la tabla");
                        System.out.println(e.getMessage());
                        System.out.println(e.getStackTrace());
                }
            out.println("<a href='index.html'>Regresar a la pagina principal</a>"
                        + "<br>");
            out.println("</body>");
            out.println("</html>");   
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    public void destroy(){
        try{
            con.close();
        
        }catch(Exception e){
            super.destroy();
        
        }
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
