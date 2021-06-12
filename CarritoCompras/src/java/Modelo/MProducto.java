/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Control.Conexion;
import java.sql.*;
import java.util.Vector;

/**
 *
 * @author illum
 */
public class MProducto {
    
    private int id_producto, id_sabor, id_cantidad, id_size;
    private int id_presentacion, stock_producto, precio;
    private String nom_sabor, unidad_cantidad, nom_size, tipo_presentacion;
    private double precio_producto;
    
    public MProducto(){
    
    }
    public Vector<MProducto> listaProductos(){
        Vector<MProducto> lista = new Vector<MProducto>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try{
            con = Conexion.getConexion();
            String q = "SELECT mproducto.id_producto, mproducto.precio, csabores.nom_sabor, ccantidad.unidad_cantidad, ccantidad.valor_cantidad, csize.nom_size, \n" +
                    "cpresentacion.tipo_presentacion, mproducto.precio_producto\n" +
                    "FROM mproducto inner join csabores\n" +
                    "on mproducto.id_sabor=csabores.id_sabor\n" +
                    "inner join ccantidad\n" +
                    "on mproducto.id_cantidad=ccantidad.id_cantidad\n" +
                    "inner join csize\n" +
                    "on mproducto.id_size=csize.id_size\n" +
                    "inner join cpresentacion\n" +
                    "on mproducto.id_presentacion=cpresentacion.id_presentacion;";
            
            ps = con.prepareStatement(q);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                MProducto producto = new MProducto();
                producto.setId_producto(rs.getInt("id_producto"));
                producto.setNom_sabor(rs.getString("nom_sabor"));
                //join
                //csabores.setNombre_sabor(rs.getString("nombre_sabor"));
                producto.setUnidad_cantidad(rs.getString("unidad_cantidad"));
                producto.setNom_size(rs.getString("nom_size"));
                producto.setTipo_presentacion(rs.getString("tipo_presentacion"));   
                producto.setPrecio_producto(rs.getDouble("precio_producto"));
                lista.add(producto);
            }
        }catch(SQLException sq){
            System.out.println("Error al consultar los productos");
            System.out.println(sq.getMessage());
            lista = null;
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
        return lista;
    }
   
    public MProducto buscarProducto(int codigoProducto){
        MProducto producto = null;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        
        try{
            con = Conexion.getConexion();
            String q = "SELECT mproducto.id_producto, mproducto.precio, csabores.nom_sabor, ccantidad.unidad_cantidad, ccantidad.valor_cantidad, csize.nom_size,\n" +
                        "cpresentacion.tipo_presentacion, mproducto.precio_producto\n" +
                        "FROM mproducto inner join csabores\n" +
                        "on mproducto.id_sabor=csabores.id_sabor\n" +
                        "inner join ccantidad\n" +
                        "on mproducto.id_cantidad=ccantidad.id_cantidad\n" +
                        "inner join csize\n" +
                        "on mproducto.id_size=csize.id_size\n" +
                        "inner join cpresentacion\n" +
                        "on mproducto.id_presentacion=cpresentacion.id_presentacion\n" +
                        "where id_producto=?";
            
            ps = con.prepareStatement(q);
            
            ps.setInt(1, codigoProducto);
            
            rs = ps.executeQuery();
            
            while(rs.next()){
                producto = new MProducto();
                producto.setId_producto(rs.getInt("id_producto"));
                producto.setNom_sabor(rs.getString("nom_sabor"));
                producto.setUnidad_cantidad(rs.getString("unidad_cantidad"));
                producto.setNom_size(rs.getString("nom_size"));
                producto.setTipo_presentacion(rs.getString("tipo_presentacion"));   
                producto.setPrecio_producto(rs.getDouble("precio_producto"));
            }
        
        }catch(SQLException sq){
            System.out.println("Error al buscar el producto");
            System.out.println(sq.getMessage());
            producto = null;
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
        return producto;
    }
     
    public boolean actualizarStock(Vector<MProducto> vp){
        boolean actualizo = false;
        Connection con = null;
        PreparedStatement ps = null;
        try{
            con = Conexion.getConexion();
            for(MProducto producto : vp){
                String q = "insert into mproducto (precio, id_sabor, id_cantidad, id_size, id_presentacion, precio_producto) "
                        + "values ('?','?','?','?','?','?')";
                ps = con.prepareStatement(q);
                
                ps.setInt(1, producto.getPrecio());
                ps.setInt(2, producto.getId_sabor());
                ps.setInt(3, producto.getId_cantidad());
                ps.setInt(4, producto.getId_size());
                ps.setInt(5, producto.getId_presentacion());
                ps.setDouble(6, producto.getPrecio_producto());
                
                
                if(ps.executeUpdate() == 1){
                    actualizo = true;
                }else{
                    actualizo = false;
                    break;
                }
            }
        
        }catch(SQLException sq){
            System.out.println("Error al actualizar el stock producto");
            System.out.println(sq.getMessage());
            actualizo = false;
        }finally{
            try{
                
                ps.close();
                con.close();
                
            
            }catch(Exception e){
                System.out.println("No encontro la clase");
                System.out.println(e.getMessage());
            
            }
        }
        return actualizo;
    }
    
    

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getId_sabor() {
        return id_sabor;
    }

    public void setId_sabor(int id_sabor) {
        this.id_sabor = id_sabor;
    }

    public int getId_cantidad() {
        return id_cantidad;
    }

    public void setId_cantidad(int id_cantidad) {
        this.id_cantidad = id_cantidad;
    }

    public int getId_size() {
        return id_size;
    }

    public void setId_size(int id_size) {
        this.id_size = id_size;
    }

    public int getId_presentacion() {
        return id_presentacion;
    }

    public void setId_presentacion(int id_presentacion) {
        this.id_presentacion = id_presentacion;
    }

    public int getStock_producto() {
        return stock_producto;
    }

    public void setStock_producto(int stock_producto) {
        this.stock_producto = stock_producto;
    }

    public double getPrecio_producto() {
        return precio_producto;
    }

    public void setPrecio_producto(double precio_producto) {
        this.precio_producto = precio_producto;
    }

    public String getNom_sabor() {
        return nom_sabor;
    }

    public void setNom_sabor(String nom_sabor) {
        this.nom_sabor = nom_sabor;
    }

    public String getUnidad_cantidad() {
        return unidad_cantidad;
    }

    public void setUnidad_cantidad(String unidad_cantidad) {
        this.unidad_cantidad = unidad_cantidad;
    }

    public String getNom_size() {
        return nom_size;
    }

    public void setNom_size(String nom_size) {
        this.nom_size = nom_size;
    }

    public String getTipo_presentacion() {
        return tipo_presentacion;
    }

    public void setTipo_presentacion(String tipo_presentacion) {
        this.tipo_presentacion = tipo_presentacion;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    
    
}
