import personas.*
import jarras.*
import marcas.*

class CarpasCerveceras {
	var property limiteDeGente
	var property tieneBanda = false
	var marcaQueVende
	const personasDentro = []
	
	method marcaQueVende(marca) { marcaQueVende = marca}
	method marcaQueVende(){return marcaQueVende}
	
	method quiereEntrar(persona){
		
		return persona.leGusta(self.marcaQueVende()) 
		and self.tieneBanda() == persona.escuchaMusicaTradicional()
	}
	
	
	method dejaIngresar(persona){
		return (personasDentro.size() < limiteDeGente) and not persona.estaEbria()
	}

	method puedeEntrar(persona){
		return self.quiereEntrar(persona) and self.dejaIngresar(persona)
	}
	method entraPersona(persona){personasDentro.add(persona)}
	
	method ingresaPersona(persona){
		
		if( self.quiereEntrar(persona) 
			and self.dejaIngresar(persona) 
			and self.puedeEntrar(persona))
		    {	
				 self.entraPersona(persona)
				 return true
				 
			} else {
				 return "Error: carpa llena"
				
			}
	}
	method personasDentro(){return personasDentro}
	
	method servirJarra(unaPersona, tamanio){
		if(self.personasDentro().contains(unaPersona)){
			unaPersona.comprarJarras(new Jarras(capacidad = tamanio , contenido = marcaQueVende))
		}
		else {self.error("La persona no se encuentra dentro de la carpa")}
	}
	method ebrios(persona){return persona.jarrasCompradas().all({j => j.capacidad() >= 1})}
	
	method ebriosEmpedernidos(){
		var ebrios = personasDentro.filter({p => p.estaEbria()})
		return ebrios.count({e => self.ebrios(e)})
	}
	
	method esPatriota(unaPersona){
		return unaPersona.jarrasCompradas().all({j => j.contenido().pais() == unaPersona.nacionalidad()})
	
	}
	
}
