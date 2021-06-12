/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Modelo.MProducto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author illum
 */
public class AgregarAdmin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession sesionuok = request.getSession();
            
            
            int precio, idsabor, idcantidad, idsize, idpresentacion;
            double precioproducto;
            
            precio=Integer.parseInt(request.getParameter("precio").trim());
            idsabor=Integer.parseInt(request.getParameter("idsabor").trim());
            idcantidad=Integer.parseInt(request.getParameter("idcantidad").trim());
            idsize=Integer.parseInt(request.getParameter("idsize").trim());
            idpresentacion=Integer.parseInt(request.getParameter("idpresentacion").trim());
            precioproducto=Double.parseDouble(request.getParameter("precioproducto").trim());
            
            
            MProducto producto = new MProducto();
                        
            
            producto.setPrecio(precio);
            producto.setId_sabor(idsabor);
            producto.setId_cantidad(idcantidad);
            producto.setId_size(idsize);
            producto.setId_presentacion(idpresentacion);
            producto.setPrecio_producto(precioproducto);
            
            response.sendRedirect("MostrarAdministrador.jsp");   
            
            
        }catch(Exception e){
            System.out.println(e);
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
