package com.grupo53.tienda53.tienda_londono.BO;

import java.util.ArrayList;


import org.springframework.web.bind.annotation.GetMapping;


import org.springframework.web.bind.annotation.RestController;

import com.grupo53.tienda53.tienda_londono.DAO.VentaclienteDAO;
import com.grupo53.tienda53.tienda_londono.DTO.VentaclienteVO;

;

@RestController
public class VentaclienteController {
	
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */

		
	
	@GetMapping("/listarventascliente")
	public ArrayList<VentaclienteVO> listaDeVentascliente() {
		VentaclienteDAO Dao = new VentaclienteDAO();
		return Dao.listaDeVentascliente();
	}

	

}
