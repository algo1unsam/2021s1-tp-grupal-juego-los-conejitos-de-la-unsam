import wollok.game.*


object sonido{
	
	var property cancionActual = null
	
	method cancion() = game.sound("sound/zelda.mp3")
	
	method reproducir(){
		cancionActual =game.sound("sound/zelda.mp3")
		cancionActual.play()
	}
	
	method reproducirLoop(){
		//.shouldLoop(true)
	}

}	