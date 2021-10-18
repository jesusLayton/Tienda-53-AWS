package com.grupo53.tienda53.tienda_londono.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.grupo53.tienda53.tienda_londono.DAO.ProveedorDAO;
import com.grupo53.tienda53.tienda_londono.DTO.ProveedorVO;


@RestController
public class ProveedorController {
	
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */

	@PostMapping("/registrarProveedor")
	public ModelAndView registrarProveedor(ProveedorVO user) {
		ProveedorDAO Dao = new ProveedorDAO();
		if (Dao.registrarProveedor(user))
			return new ModelAndView("redirect:" + "Admin/proveedores.jsp?create=1");
		else 
			return new ModelAndView("redirect:" + "Admin/nuevoProveedor.jsp?error=1");
	}

	@GetMapping("/consultarProveedor/{nit}")
	public ArrayList<ProveedorVO> consultarProveedor(@PathVariable(value = "nit") Integer nit_proveedor) {
		ProveedorDAO Dao = new ProveedorDAO();
		return Dao.consultarProveedor(nit_proveedor);
	}

	@GetMapping("/listarProveedores")
	public ArrayList<ProveedorVO> listarProveedores() {
		ProveedorDAO Dao = new ProveedorDAO();
		return Dao.listaDeProveedores();
	}
	@GetMapping("/eliminarProveedor/{nit}")
	public ModelAndView eliminarProveedor(@PathVariable(value = "nit") Integer nit_proveedor) {
		ProveedorDAO Dao = new ProveedorDAO();
		if (Dao.eliminarProveedor(nit_proveedor))
			return new ModelAndView("redirect:" + "../Admin/proveedores.jsp?delete=1");
		
		else 
			return new ModelAndView("redirect:" + "../Admin/proveedores.jsp?error=1");
	}
	
	@PostMapping("/actualizarProveedor")
	public ModelAndView actualizarProveedor(ProveedorVO nit_proveedor) {
		ProveedorDAO Dao = new ProveedorDAO();
		if (Dao.actualizarProveedor(nit_proveedor))
			return new ModelAndView("redirect:" + "Admin/proveedores.jsp?update=1");
		else 
			return new ModelAndView("redirect:" + "Admin/actualizarproveedor.jsp?error=1&nit=" + nit_proveedor.getNit_proveedor());

	}
	
	

}