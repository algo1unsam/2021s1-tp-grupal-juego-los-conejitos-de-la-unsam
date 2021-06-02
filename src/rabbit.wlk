import wollok.game.*
import config.*
import visual.*


object rabbit {

	var property energia = 100
	var property vidas = 3
	var property position = new Position(x = 7, y = 0) 

	method image() = "assets/rabbit2.png"

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

	method limiteLeft() {
		if (self.position().x() >= 4) {
			self.irA(self.position().left(1))
		} else self.noPuedo()
	}

	method limiteRight() {
		if (self.position().x() <= game.width() - 5) {
			self.irA(self.position().right(1))
		} else self.noPuedo()
	}

	method limiteDown() {
		if (self.position().y() >= 1) {
			self.irA(self.position().down(1))
		} else self.noPuedo()
	}

	method limiteUp() {
		if (self.position().y() < game.height() - 1) {
			self.irA(self.position().up(1))
		}
		self.llego()
	}

	method noPuedo() = game.say(self, "No puedo, se terminó el tablero!")

	method llego() {
		if (self.position().y() == game.height() - 1) {
			game.schedule(50, { => rabbitWin.ganar()})
			
		}
	}
	
	method perderVidas(choque){
		vidas= (vidas - choque).max(0)
		if (vidas==0){
			self.finJuegoPor(choque)
		}
	}
	method finJuegoPor(motivo){
		game.schedule(2000,{game.stop()})
	}
	
	
	method chocoCharco(){
		position= new Position(x = 7, y = 0) 
		 barraVidas.perderVida()
	}

}



