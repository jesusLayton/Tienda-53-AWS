package com.grupo53.tienda53.tienda_londono.DAO;

import java.sql.*;
import java.util.ArrayList;

import com.grupo53.tienda53.tienda_londono.DTO.ProductoVO;

/**
 * Clase que permite el acceso a la base de datos
 *
 */
public class ProductoDAO {
	/**
	 * Permite registrar un Producto nuevo
	 * 
	 * @param user
	 */
	public boolean registrarProducto(ProductoVO user) {
		//llama y crea una instancia de la clase encargada de hacer la conexión
		Conexion conex = new Conexion();

		try {
			//sentencia que se ejecutara en la base de datos
			Statement estatuto = conex.getConnection().createStatement();
			
			//String que contiene la sentencia insert a ejecutar
			String sentencia = "INSERT INTO productos VALUES(" 
					+ user.getCodigo_producto() + "," + ""
					+ user.getIva_compra() + "," + "" 
					+ user.getNit_proveedor() + "," + "'" 
					+ user.getNombre_producto()+ "'," + "" 
					+ user.getPrecio_compra() + "," + ""
					+ user.getPrecio_venta() + ""
					+ ");";
			
			System.out.println(sentencia);
			
			//se ejecuta la sentencia en la base de datos
			estatuto.executeUpdate(sentencia);
			//impresión en consola para verificación 
			//cerrando la sentencia y la conexión
			estatuto.close();
			conex.desconectar();
			return true;

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo insertar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
			return false;
			
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo insertar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
			return false;
		}

	}

	/**
	 * permite consultar el Producto asociado al user enviado como parametro
	 * 
	 * @param documento
	 * @return
	 */
	public ArrayList<ProductoVO> consultarProducto(Integer codigo) {	
		//lista que contendra el o los productos obtenidos
		ArrayList<ProductoVO> listaDeproductos = new ArrayList<ProductoVO>();		
		//instancia de la conexión
		Conexion conex = new Conexion();
		try {
			//prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection()
					.prepareStatement("SELECT * FROM productos WHERE codigo_producto =" + codigo);	
			
			
			//ejecute la sentencia
			ResultSet res = consulta.executeQuery();			
			//cree un objeto basado en la clase entidad con los datos encontrados
			if (res.next()) {
				ProductoVO Producto = new ProductoVO();
				Producto.setCodigo_producto(Integer.parseInt(res.getString("codigo_producto")));
				Producto.setIva_compra(Double.parseDouble(res.getString("iva_compra")));
				Producto.setNit_proveedor(Integer.parseInt(res.getString("nit_proveedor")));
				Producto.setNombre_producto(res.getString("nombre_producto"));
				Producto.setPrecio_compra(Double.parseDouble(res.getString("precio_compra")));
				Producto.setPrecio_venta(Double.parseDouble(res.getString("precio_venta")));

				listaDeproductos.add(Producto);
			}
			//cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}
		return listaDeproductos;
	}

	/**
	 * permite consultar la lista de todos los usuarios
	 * 
	 * @return
	 */
	public ArrayList<ProductoVO> listaDeProductos() {
		//lista que contendra el o los usuarios obtenidos
		ArrayList<ProductoVO> listaDeproductos = new ArrayList<ProductoVO>();
		
		//instancia de la conexión
		Conexion conex = new Conexion();

		try {
			//prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM productos ORDER BY codigo_producto");
			
			//ejecute la sentencia
			ResultSet res = consulta.executeQuery();
			
			//cree un objeto para cada encontrado en la base de datos basado en la clase entidad con los datos encontrados
			while (res.next()) {
				ProductoVO Producto = new ProductoVO();
				Producto.setCodigo_producto(Integer.parseInt(res.getString("codigo_producto")));
				Producto.setIva_compra(Double.parseDouble(res.getString("iva_compra")));
				Producto.setNit_proveedor(Integer.parseInt(res.getString("nit_proveedor")));
				Producto.setNombre_producto(res.getString("nombre_producto"));
				Producto.setPrecio_compra(Double.parseDouble(res.getString("precio_compra")));
				Producto.setPrecio_venta(Double.parseDouble(res.getString("precio_venta")));

				listaDeproductos.add(Producto);

			}
			
			//cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todos los productos");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todos los productos");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

		return listaDeproductos;
	}

	public boolean eliminarProducto(Integer codigo_producto) {
		
		//instancia de la conexion
		Conexion conex = new Conexion();

		try {
			//sentencia inicializada
			Statement consulta = conex.getConnection().createStatement();
			
			//preparando sentencia a realizar
			String sentencia = "DELETE FROM productos WHERE codigo_producto = " + codigo_producto + ";";
			System.out.println(sentencia);
			
			//impresion de verificación
			System.out.println("Registrado " + sentencia);
			
			//ejecutando la sentencia en la base de datos
			consulta.execute(sentencia);
			
			//cerrando sentencia y conexión
			consulta.close();
			conex.desconectar();
			
			return true;

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
			return false;
			
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
			return false;
		}

	}

	public boolean actualizarProducto(ProductoVO codigo) {
		
		//instancia de conexion
		Conexion conex = new Conexion();

		try {
			//inicializando sentencia
			Statement estatuto = conex.getConnection().createStatement();
			
			//String con la sentencia a ejecutar
			String sentencia = "UPDATE productos "
					+ "SET codigo_producto = '" + codigo.getCodigo_producto() + "',"
					+ "iva_compra = '" + codigo.getIva_compra() + "',"
					+ "nit_proveedor = '" + codigo.getNit_proveedor() + "',"
					+ "nombre_producto = '" + codigo.getNombre_producto() + "', "
					+ "precio_compra = '" + codigo.getPrecio_compra() + "', "
					+ "precio_venta = '" + codigo.getPrecio_venta() + "' "					
					+ "WHERE codigo_producto = " + codigo.getCodigo_producto()+";";
			
			System.out.println(sentencia);
			
			//ejecuta la sentencia 
			estatuto.executeUpdate(sentencia);
			
			//verificación por consola de la sentencia
			System.out.println("Registrado " + sentencia);
			
			//cerrando sentencia y conexión
			estatuto.close();
			conex.desconectar();
			
			return true;

		} catch (SQLException e) {
			//si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR EN SQL -------------------");
			System.out.println("No se pudo actualizar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
			return false;
			
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo eliminar el producto");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
			return false;
		}

	}

	public void eliminarTodoProducto() {
		//instancia de la conexión
		Conexion conex = new Conexion();
		
		try {
			//sentencia inicializada
			Statement consulta = conex.getConnection().createStatement();
			
			//preparando sentencia a realizar
			String sentencia = "DELETE FROM productos";
			
			//impresion de verificacion
			System.out.println(sentencia);
			
			//ejecutando la sentencia en la base de datos
			consulta.execute(sentencia);
			
			//cerrando sentencia y conexión
			consulta.close();
			conex.desconectar();
			
		} catch (SQLException e) {
			//si hay error en el SQL mostrarlo
			System.out.println("-----------------  ERROR  -----------------");
			System.out.println("No se pudo eliminar todos los productos");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
			
		} catch (Exception e) {
			//si hay cualquier otro error mostrarlo
			System.out.println("-----------------  ERROR  -----------------");
			
			System.out.println("No se pudo eliminar todos los productos");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}
	}
}