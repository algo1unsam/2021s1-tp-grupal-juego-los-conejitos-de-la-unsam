import wollok.game.*


class Sonido{
	
	var property cancionActual = null
	var property direccion
	
	method cancion() = game.sound(direccion)
	
	method reproducir(){
		cancionActual =self.cancion()
		cancionActual.play()
	}
	
	method reproducirLoop(){
		//.shouldLoop(true)
	}
	
	method parar(){
		if (cancionActual != null){
			cancionActual.stop()
		}
		
	}

}	

const vida = new Sonido(direccion="sound/vida.mp3")

const gameOver =new Sonido(direccion="sound/perder.mp3")

const auch = new Sonido(direccion="sound/error-fallo.mp3")

const ganador = new Sonido(direccion="sound/ganador.mp3")

const ruido = new Sonido(direccion="sound/ruidoTrafico.mp3")
