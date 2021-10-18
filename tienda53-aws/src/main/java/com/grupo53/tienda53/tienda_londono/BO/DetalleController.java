package com.grupo53.tienda53.tienda_londono.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grupo53.tienda53.tienda_londono.DAO.DetalleDAO;
import com.grupo53.tienda53.tienda_londono.DAO.VentaDAO;
import com.grupo53.tienda53.tienda_londono.DTO.DetalleventaVO;
import com.grupo53.tienda53.tienda_londono.DTO.VentaVO;

;

@RestController
public class DetalleController {
	
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */

	@PostMapping("/registrardetalleventa")
	public void registrardetalleVenta(DetalleventaVO user) {
		DetalleDAO Dao = new DetalleDAO();
		Dao.registrardetalleVenta(user);
	}
	

	
	@GetMapping("/listardetalleventas")
	public ArrayList<DetalleventaVO> listaDetalleVentas() {
		DetalleDAO Dao = new DetalleDAO();
		return Dao.listadetalleventas();
	}
	
	
	
	


}
