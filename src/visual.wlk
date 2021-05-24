import wollok.game.*
import rabbit.*
import config.*
import transito.*
import sonidos.*

class Arbol {

	var property image = "assets/arbol.png"
	var property position


}

class Bache {
	const posX = [3, 4, 5, 6, 7, 8, 9, 10,11]
	const posY = [1,2,3,5,6,7]
	
	var property image = "assets/bache.png"
	var property position = new Position( x = posX.anyOne(), y = posY.anyOne())
	
}



object tablero {

	method inicio() {
		
		
		
		game.title("Rabbit Wollok Game")
		game.height(9)//alto
		game.width(15)//ancho
		game.boardGround("assets/tableroSA.png")
		game.addVisual(intro)
		game.schedule(1000, { => game.addVisual(titulo)})
		game.schedule(1000, { => game.addVisual(logo)})  // esta generando problemas
		
		
		
		game.schedule(1000, { => game.say(logo, "Presionar 'Enter' para comenzar")})
		keyboard.enter().onPressDo({ start.inicio()})
		
		
	}

}

const arbol1 = new Arbol(position = new Position(x = 4, y = 4))
const arbol2 = new Arbol(position = new Position(x = 7, y = 4))
const arbol3 = new Arbol(position = new Position(x = 10, y = 4))

const bache1 = new Bache()
const bache2 = new Bache()
const bache3 = new Bache()
const bache4 = new Bache()

const auto1= new Auto(image="assets/auto1R.png",posicionInicial= new Position(x= 2 ,y=5))


object intro {

	var property image = "assets/inicio.png"
	var property position = game.origin()

}

object titulo {

	var property image = "assets/titulo.png"
	var property position = game.origin()

}

object logo {

	var property image = "assets/logo.png"
	var property position = new Position(x = 5, y = 2)

}

object start {

	method inicio() {
		game.clear()
		game.addVisual(arbol1)
		game.addVisual(arbol2)
		game.addVisual(arbol3)
//		if (not game.hasVisual(bache1)) {game.onTick(3000, "AgregarBache", { => game.addVisual(bache1) })}
//		if (game.hasVisual(bache1)) {game.onTick(5000, "QuitarBache", { => game.removeVisual(bache1) })
		game.addVisual(bache1)
		game.addVisual(bache2)
		game.addVisual(bache3)
		game.addVisual(bache4)
		game.addVisual(rabbit)
		config.configurarTeclas()
		game.showAttributes(rabbit) // Debug	
		game.addVisual(barraVidas)
		
		
		game.addVisual(auto1)
		auto1.arrancarIzquierdaDerecha()
		game.showAttributes(auto1)
		
		
		
	
		
		

	}

}

object rabbitWin {

	var property image = "assets/win3.png"
	var property position = game.origin()

	method ganar() {
		game.clear()
		game.addVisual(self)
		//game.schedule(1000, { => tablero.inicio()}) //VA AL INICIO DEL JUEGO
		game.schedule(1000, { => start.inicio()}) //VA AL INICIO DEL TABLERO EN ULTIMA POSICION 
	}
}


object barraVidas{
	
	
	method image() = "assets/vidas-"  + rabbit.vidas() + ".png"

	method position() = game.at(0,5)
	
}




