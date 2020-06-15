import plagas.*

class Hogar {
	var property mugre  // unidades -> numerico
	var property conford   // unidades -> numerico
	
	method esBueno() { return mugre <= (conford / 2) }
	method efecto(plaga) { 
		mugre = mugre + plaga.nivelDanio()
		plaga.efecto()
	}
}

class Huerta {
	var property produccion // Kg -> numerico
	var property nivelMaxProduccion // kg -> numerico
	
	method esBueno() { return produccion > nivelMaxProduccion }
	method efecto(plaga) {
		produccion = produccion - (plaga.nivelDanio() * 0.1)
		if (plaga.transmiteEnfermedades()) { produccion = produccion - 10 }
		plaga.efecto()
	}
}

class Mascota {
	var property salud // unidades -> numerico
	var property nivelSalud = 250 // unidades -> numerico
	
	method esBueno() { return salud > nivelSalud }
	method efecto(plaga) { 
		if (plaga.transmiteEnfermedades()) { nivelSalud = nivelSalud - plaga.nivelDanio() }
		plaga.efecto()
	}
}

class Barrio {
	const property elementos = []
	
	method esBueno(elemento) { return elemento.esBueno() }
	method elementosBuenos() { 
		return elementos.filter( { elemento => self.esBueno(elemento) } )
	}
	method elementosNoBuenos() {
		return elementos.filter( { elemento => (not self.esBueno(elemento)) } )
	}
	method esCopado() {
		return (elementos.count( { elemento => self.esBueno(elemento) } )) >
			(elementos.count( { elemento => not self.esBueno(elemento) } ))
	}
	method sufrirAtaque(plaga) {
		elementos.forEach( { elemento => elemento.efecto(plaga) } )
	}
}