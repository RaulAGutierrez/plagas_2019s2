
class Plaga {
	var property poblacion
	
	method transmiteEnfermedades() { return poblacion >= 10 }
	method efecto() { poblacion = poblacion + (poblacion * 0.1) }
}

class Cucaracha inherits Plaga {
	var property peso
	
	method pesoPromedio() { return poblacion / peso }
	method nivelDanio() { return poblacion / 2 }
	override method transmiteEnfermedades() { return super() and (self.pesoPromedio() >= 10) }
	override method efecto() { 
		super()
		self.peso(peso + 2)
	}
}

class Pulga inherits Plaga {
	
	method nivelDanio() { return poblacion * 2 }
}

class Garrapatas inherits Plaga {
	
	override method efecto() { 
		super()
		super()
		}
}

class Mosquitos inherits Plaga {
	
	method nivelDanio() { return poblacion }
	override method transmiteEnfermedades() { return super() and ((poblacion % 3) == 0) }
}