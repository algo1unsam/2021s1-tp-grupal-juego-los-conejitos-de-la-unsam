import wollok.game.*
import rabbit.*
import visual.*

//aca se van a ir agregando los autos que van a ir por la carretera
class Carretera {

	var property autosTrafico = []

	method agregarAuto(unAuto) {
		autosTrafico.add(unAuto)
	}

	method autoAleatorio() {
		return autosTrafico.anyOne()
	}

}

// si el auto hace derecha-izquierda tiene que empezar con x=12 de posicion inicial
//si el auto hace izquierda-derecha tienq que empezar con x=2 de posicion inicial
// auto no puede ir en y=4 y=0 y=9 porque es el cantero
//problemas al pasarle una posicion inicial nueva al auto
class Auto {

	 // eje y decide carril
	var property image
	
	var property velocidad = 200 // menor es este valor mas rapido

	method imagen(unaImagen) { // tengo que pasarle una direccion de archivo
		image = unaImagen
	}

	method arrancarAuto() {
	}

	method estaAlBorde() {
	}

	method mover() {
	}

	method chocar() {
		rabbit.perdioVida()
	}
	
	
	// crear metodo para que no se creen dos autos superpuestos
	//game.uniqueCollider(self) // este metodo retorna el objecto que este en la misma posicion que el mismo (por el self)
//la idea es que elimine al otro elemento que este el la misma posicion con game.removeVisual()
}
	
//aca voy a crear dos clases disintas dependiendo si el auto va de izquierda-derecha o viceverza
class AutoIzquierdaDerecha inherits Auto {
	
	const posX = [ ]
	//const posY = [5,6,7 ]
	var property posicionInicial = new Position(x = 2, y = 5.randomUpTo(7))
	var property position = posicionInicial
	
	override method estaAlBorde() {
		return position.x() > 9
	}

	override method arrancarAuto() {
		game.onTick(velocidad, "mover auto", { self.mover()})
	}

	override method mover() {
		if (self.estaAlBorde()) {
			position = posicionInicial
		} else {
			position = position.right(1)
		}
	}

}

class AutoDerechaIzquierda inherits Auto {
	
	const posX = []
	//const posY = [1 ,2 ,3]
	var property posicionInicial = new Position(x = 10, y = 1.randomUpTo(3))
	var property position = posicionInicial

	override method estaAlBorde() {
		return position.x() < 4
	}

	override method arrancarAuto() {
		game.onTick(velocidad, "mover auto", { self.mover()})
	}

	override method mover() {
		if (self.estaAlBorde()) {
			position = posicionInicial
		} else {
			position = position.left(1)
		}
	}

}


		
		
	
		
	





	

