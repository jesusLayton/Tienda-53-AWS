package com.grupo53.tienda53.tienda_londono.BO;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.grupo53.tienda53.tienda_londono.DAO.ProductoDAO;
import com.grupo53.tienda53.tienda_londono.DTO.ProductoVO;

@RestController
public class ProductoController {
	
	/*
	 * @GetMapping obtener o buscar
	 * @PostMapping insertar o agregar
	 * @PutMapping modificar o actualizar
	 * @DeleteMapping eliminar o borrar
	 * */
	
	@PostMapping("/registrarProducto")
	public void registrarProducto(ProductoVO producto) {
		ProductoDAO Dao = new ProductoDAO();
		Dao.registrarProducto(producto);
	}
	
	@GetMapping("/consultarProducto/{codigo}")
	public ArrayList<ProductoVO> consultarProducto(@PathVariable(value = "codigo")Integer codigo_producto){
		ProductoDAO Dao = new ProductoDAO();
		return Dao.consultarProducto(codigo_producto);
	}
	
	@GetMapping("/listarProductos")
	public ArrayList<ProductoVO> listarProductos() {
		ProductoDAO Dao = new ProductoDAO();
		return Dao.listaDeProductos();
	}
	
	@GetMapping("/eliminarProducto/{codigo}")
	public ModelAndView eliminarProducto(@PathVariable(value = "codigo")Integer codigo_producto){
		ProductoDAO Dao = new ProductoDAO();
		if (Dao.eliminarProducto(codigo_producto)) 
			return new ModelAndView("redirect:" + "../Admin/producto.jsp?delete=1");
		else 
			return new ModelAndView("redirect:" + "../Admin/producto.jsp?error=1");
		
	}
	
	@PostMapping("/actualizarProducto")
	public ModelAndView actualizarProducto(ProductoVO codigo_producto) {
		ProductoDAO Dao = new ProductoDAO();
		if (Dao.actualizarProducto(codigo_producto))
			return new ModelAndView("redirect:" + "/Admin/producto.jsp?update=1");
		else
			return new ModelAndView("redirect:" + "/Admin/actualizarProducto.jsp?error=1&codigo=" + codigo_producto.getCodigo_producto());
	}
	
	@DeleteMapping("/eliminarTodoProducto")
	public void eliminarTodoProducto(){
		ProductoDAO Dao = new ProductoDAO();
		Dao.eliminarTodoProducto();
	}

}
