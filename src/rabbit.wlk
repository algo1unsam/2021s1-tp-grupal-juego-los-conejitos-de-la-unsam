import wollok.game.*
import config.*

object rabbit {
	var property energia = 100
	var property position = game.origin()

	method image() {
		return "assets/rabbit2.png"
	}


	method mueve(espacios) {
		energia = energia - espacios * 3
	}

	method irA(nuevaPosicion) {
		self.mueve(position.distance(nuevaPosicion))
		position = nuevaPosicion
	
	}

	method estaCansado() {
		return energia <= 0
	}
	
	method saluda() {
		game.say(self, "Hola Peque!!!")

	}
	
//self.position().y().max(9))
	method limiteTablero() {
		const ancho = game.width() - 2 // debemos restarles uno para 
	   	const alto = game.height() - 2 // que las posiciones se generen bien.
		if (self.position().x()<0 || self.position().x()>ancho)
			{return game.say(self, "Chau X!!!")}
		else {return game.say(self, "Hola Peque!!!")}
		if (self.position().y()<0 || self.position().y()> alto)
			{return game.say(self, "Hola Peque Y!!!")}
		else {return game.say(self,"Chau Y!!!")}
	}
	
	
//	method llego() {
//		return position == nido.position() // ESTÁ EN EXTRAS
//	}
}


