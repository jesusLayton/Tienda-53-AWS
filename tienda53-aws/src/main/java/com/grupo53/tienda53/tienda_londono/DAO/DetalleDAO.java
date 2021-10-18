package com.grupo53.tienda53.tienda_londono.DAO;

import java.sql.*;
import java.util.ArrayList;

import com.grupo53.tienda53.tienda_londono.DTO.DetalleventaVO;
import com.grupo53.tienda53.tienda_londono.DTO.VentaVO;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

/**
 * Clase que permite el acceso a la base de datos
 *
 */

public class DetalleDAO {
	public void registrardetalleVenta(DetalleventaVO venta) {
		// llama y crea una instancia de la clase encargada de hacer la conexión
		Conexion conex = new Conexion();

		try {
			// sentencia que se ejecutara en la base de datos
			Statement estatuto = conex.getConnection().createStatement();

			// String que contiene la sentencia insert a ejecutar
			String sentencia = "INSERT INTO detalle_ventas VALUES(" + venta.getCodigo_detalle_venta() + "," + venta.getCantidad_producto()
					+ "," + venta.getCodigo_producto() + "," + venta.getCodigo_venta() + "," + venta.getValor_venta() + "," + venta.getValor_venta() + ","
					+ venta.getValor_iva() + "" + ");";

			// se ejecuta la sentencia en la base de datos
			estatuto.executeUpdate(sentencia);
			// impresión en consola para verificación
			System.out.println("Registrado " + sentencia);
			// cerrando la sentencia y la conexión
			estatuto.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo insertar el detalle de la venta");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo insertar el detalle de la venta");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

	}

	
	

	

	public ArrayList<DetalleventaVO> listadetalleventas() {
		// lista que contendra el o los usuarios obtenidos
		ArrayList<DetalleventaVO> listadetalleventas = new ArrayList<DetalleventaVO>();

		// instancia de la conexión
		Conexion conex = new Conexion();

		try {
			// prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT * FROM detalle_ventas");

			// ejecute la sentencia
			ResultSet res = consulta.executeQuery();

			// cree un objeto para cada encontrado en la base de datos basado en la clase
			// entidad con los datos encontrados
			while (res.next()) {
				DetalleventaVO Detalle = new DetalleventaVO();
				Detalle.setCodigo_detalle_venta(Integer.parseInt(res.getString("codigo_detalle_venta")));
				Detalle.setCantidad_producto(Integer.parseInt(res.getString("cantidad_producto")));
				Detalle.setCodigo_producto(Integer.parseInt(res.getString("codigo_producto")));
				Detalle.setCodigo_venta(Integer.parseInt(res.getString("codigo_venta")));
				Detalle.setValor_total(Double.parseDouble(res.getString("valor_total")));
				Detalle.setValor_venta(Double.parseDouble(res.getString("valor_venta")));
				Detalle.setValor_iva(Double.parseDouble(res.getString("valor_iva")));

				listadetalleventas.add(Detalle);
			}

			// cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todas los detalles de venta");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todas  los detalles de venta");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

		return listadetalleventas;
	}

	

}
