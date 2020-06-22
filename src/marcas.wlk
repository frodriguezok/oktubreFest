class Cervezas {
	var property marca
	var property lupulo
	var property pais
	
}

class CervezaRubia inherits Cervezas {

	var property graduacionAlcoholica
	
}

class CervezaNegra inherits Cervezas {
	
	method graduacionAlcoholica(){
	 return (graduacionReglamentaria.graduacion()).min(self.lupulo()*2)
	}
	
}

object graduacionReglamentaria {
	var property graduacion = 0
}

class CervezaRoja inherits CervezaNegra {
	
	override method graduacionAlcoholica(){
		return super()*1.25
	}
}