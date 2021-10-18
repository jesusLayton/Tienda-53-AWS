package com.grupo53.tienda53.tienda_londono.DAO;

import java.sql.*;
import java.util.ArrayList;


import com.grupo53.tienda53.tienda_londono.DTO.VentaclienteVO;


import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;

/**
 * Clase que permite el acceso a la base de datos
 *
 */

public class VentaclienteDAO {
	
	
	
	public ArrayList<VentaclienteVO> listaDeVentascliente() {
		// lista que contendra el o los usuarios obtenidos
		ArrayList<VentaclienteVO> ventascliente = new ArrayList<VentaclienteVO>();

		// instancia de la conexión
		Conexion conex = new Conexion();

		try {
			// prepare la sentencia en la base de datos
			PreparedStatement consulta = conex.getConnection().prepareStatement("SELECT clientes.cedula_cliente, clientes.nombre_cliente, SUM(total_venta) AS total_venta FROM ventas INNER JOIN clientes on clientes.cedula_cliente = ventas.cedula_cliente GROUP BY clientes.cedula_cliente");

			// ejecute la sentencia
			ResultSet res = consulta.executeQuery();

			// cree un objeto para cada encontrado en la base de datos basado en la clase
			// entidad con los datos encontrados
			while (res.next()) {
				VentaclienteVO Ventacliente = new VentaclienteVO();
				
				Ventacliente.setCedula_cliente(Integer.parseInt(res.getString("cedula_cliente")));
				Ventacliente.setNombre_cliente(res.getString("nombre_cliente"));				
				Ventacliente.setTotal_venta(Double.parseDouble(res.getString("total_venta")));
				

				ventascliente.add(Ventacliente);
			}

			// cerrar resultado, sentencia y conexión
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (SQLException e) {
			// si hay un error en el sql mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todas las ventas");
			System.out.println(e.getMessage());
			System.out.println(e.getErrorCode());
		} catch (Exception e) {
			// si hay cualquier otro error mostrarlo
			System.out.println("------------------- ERROR --------------");
			System.out.println("No se pudo consultar todas las ventas");
			System.out.println(e.getMessage());
			System.out.println(e.getLocalizedMessage());
		}

		return ventascliente;
	}

	

	
	

	}
	

