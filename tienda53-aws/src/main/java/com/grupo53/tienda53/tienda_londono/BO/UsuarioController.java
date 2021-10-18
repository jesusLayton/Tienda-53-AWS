package com.grupo53.tienda53.tienda_londono.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.grupo53.tienda53.tienda_londono.DAO.UsuarioDAO;
import com.grupo53.tienda53.tienda_londono.DTO.UsuarioVO;


@RestController
public class UsuarioController {
	
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */

	@PostMapping("/registrarUsuario")
	public ModelAndView registrarUsuario(UsuarioVO user) {
		UsuarioDAO Dao = new UsuarioDAO();
		if(Dao.registrarUsuario(user)) 
			return new ModelAndView("redirect:" + "Admin/usuarios.jsp?create=1");
		else
			return new ModelAndView("redirect:" + "Admin/nuevoUsuario.jsp?error=1");
	}

	@GetMapping("/consultarUsuario/{cedula}")
	public ArrayList<UsuarioVO> consultarUsuarios(@PathVariable(value = "cedula") Integer cedulaUsuario) {
		UsuarioDAO Dao = new UsuarioDAO();
		return Dao.consultarUsuario(cedulaUsuario);
	}

	@GetMapping("/listarUsuarios")
	public ArrayList<UsuarioVO> listaDeUsuarios() {
		UsuarioDAO Dao = new UsuarioDAO();
		return Dao.listaDeUsuarios();
	}
	@GetMapping("/eliminarUsuario/{cedula}")
	public ModelAndView eliminarUsuario(@PathVariable(value = "cedula") Integer cedulaUsuario) {
		UsuarioDAO Dao = new UsuarioDAO();
		Dao.eliminarUsuario(cedulaUsuario);
		return new ModelAndView("redirect:" + "../Admin/usuarios.jsp?delete=1");
	}
	
	@PostMapping("/actualizarUsuario")
	public ModelAndView actualizarUsuario(UsuarioVO user) {
		UsuarioDAO Dao = new UsuarioDAO();
		Dao.actualizarUsuario(user);
		return new ModelAndView("redirect:" + "Admin/usuarios.jsp?update=1");
	}
}