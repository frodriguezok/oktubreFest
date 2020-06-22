import marcas.*

class Jarras {
	var property capacidad
	
	var property contenido
	
	method contenidoDeAlcohol(){
		return self.capacidad() * self.contenido().graduacionAlcoholica()
	}

}