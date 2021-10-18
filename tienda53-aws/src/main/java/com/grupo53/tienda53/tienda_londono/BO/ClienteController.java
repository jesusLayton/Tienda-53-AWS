package com.grupo53.tienda53.tienda_londono.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.grupo53.tienda53.tienda_londono.DAO.ClienteDAO;
import com.grupo53.tienda53.tienda_londono.DTO.ClienteVO;


@RestController
public class ClienteController {
	
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */

	@PostMapping("/registrarcliente")
	public ModelAndView registrarCliente(ClienteVO user) {
		ClienteDAO Dao = new ClienteDAO();
		if (Dao.registrarCliente(user))
			return new ModelAndView("redirect:" + "Admin/clientes.jsp?create=1");
		else 
			return new ModelAndView("redirect:" + "Admin/nuevoCliente.jsp?error=1");
			
	}

	@GetMapping("/consultarcliente/{cedula}")
	public ArrayList<ClienteVO> consultarClientes(@PathVariable(value = "cedula") Integer cedulaCliente) {
		ClienteDAO Dao = new ClienteDAO();
		return Dao.consultarCliente(cedulaCliente);
	}

	@GetMapping("/listarclientes")
	public ArrayList<ClienteVO> listaDeClientes() {
		ClienteDAO Dao = new ClienteDAO();
		return Dao.listaDeClientes();
	}
	@GetMapping("/eliminarcliente/{cedula}")
	public ModelAndView eliminarCliente(@PathVariable(value = "cedula") Integer cedulaCliente) {
		ClienteDAO Dao = new ClienteDAO();
		Dao.eliminarCliente(cedulaCliente);
		return new ModelAndView("redirect:" + "../Admin/clientes.jsp?delete=1");
	}
	
	@PostMapping("/actualizarclientes")
	public ModelAndView actualizarCliente(ClienteVO user) {
		ClienteDAO Dao = new ClienteDAO();
		if (Dao.actualizarCliente(user))
			return new ModelAndView("redirect:" + "Admin/clientes.jsp?update=1");
		else 
			return new ModelAndView("redirect:" + "Admin/actualizarcliente.jsp?error=1&cedula=" + user.getCedula_cliente());

	}
	
	

}