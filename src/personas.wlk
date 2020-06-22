import marcas.*
import jarras.*
import carpasCerveceras.*
class Personas {
	var property nacionalidad
	var property peso
	const jarrasCompradas = []
	const marcasQueLeGustan = #{}
	var property escuchaMusicaTradicional = false
	var property nivelDeAguante
	
	
	method comprarJarras(jarra){
		jarrasCompradas.add(jarra)
	}
	method jarrasCompradas(){return jarrasCompradas}
	
	method estaEbria(){
		return jarrasCompradas.sum({j => j.contenido().graduacionAlcoholica()})*self.peso() > nivelDeAguante
	}
	
	method marcasQueLeGustan(cerveza){
		marcasQueLeGustan.add(cerveza)
	}
	
	method totalDeAlcohol(){
		return jarrasCompradas.sum({j=>j.contenidoDeAlcohol()})
	}
	
	method leGusta(marca){
		return marcasQueLeGustan.contains(marca)
	}
	
	method esPatriota(){
		return self.jarrasCompradas().all({j => j.contenido().pais() == self.nacionalidad()})
	
	}
}

class Belgas inherits Personas {

	override method leGusta(cerveza){
		return cerveza.lupulo() > 4
	}
}

class Checos inherits Personas {
	override method leGusta(cerveza){
		return cerveza.graduacionAlcoholica() > 0.08
	}
}

class Alemanes inherits Personas {

}
