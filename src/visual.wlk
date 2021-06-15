import wollok.game.*
import rabbit.*
import config.*
import transito.*
import sonidos.*

class Arbol {

	var property image = "assets/arbol.png"
	var property position

	method chocar() {
	}

}

class Bache {

	const posX = [ 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
	const posY = [ 1, 2, 3, 5, 6, 7 ]
	var property image = "assets/bache.png"
	var property position = new Position(x = posX.anyOne(), y = posY.anyOne())

	method chocar() {
		rabbit.perdioVida()
	}

}

object tablero {

	method inicio() {
		game.title("Rabbit Wollok Game")
		game.height(9) // alto
		game.width(15) // ancho
		game.boardGround("assets/tableroSA.png")
		game.addVisual(intro)
		game.schedule(500, { => game.addVisual(titulo)})
		game.schedule(500, { => game.addVisual(logo)})
		game.schedule(500, { => game.addVisual(enter)})
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

//autos
const camion1L = new AutoDerechaIzquierda(image = "assets/camion1L.png")

const camion1R = new AutoIzquierdaDerecha(image = "assets/camion1R.png")

const camion2L = new AutoDerechaIzquierda(image = "assets/camion2L.png")

const camion2R = new AutoIzquierdaDerecha(image = "assets/camion2R.png")

const camion3L = new AutoDerechaIzquierda(image = "assets/camion3L.png")

const camion3R = new AutoIzquierdaDerecha(image = "assets/camion3R.png")

const camion4L = new AutoDerechaIzquierda(image = "assets/camion4L.png")

const camion4R = new AutoIzquierdaDerecha(image = "assets/camion4R.png")

const auto1L = new AutoDerechaIzquierda(image = "assets/auto1L.png")

const auto1R = new AutoIzquierdaDerecha(image = "assets/auto1R.png")

const auto2L = new AutoDerechaIzquierda(image = "assets/auto2L.png")

const auto2R = new AutoIzquierdaDerecha(image = "assets/auto2R.png")

//const vehiculosDeIzquierdaADerecha = [ camion1R, camion2R, camion3R, camion4R, auto1R, auto2R ]
//const vehiculosDeDerechaAIzquierda = [ camion1L, camion2L, camion3L, camion4L, auto1L, auto2L ]
//carretera de arriba que va de izquierda a derecha
//const carreteraArriba = new Carretera(autosTrafico = vehiculosDeIzquierdaADerecha)
//carretera de abajo que va de derecha a izquierda
//const carreteraAbajo = new Carretera(autosTrafico = vehiculosDeDerechaAIzquierda)
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
	var property position = new Position(x = 4, y = 4)

}

object start {

	method inicio() {
		game.clear()
		ruido.reproducir()
		game.addVisual(arbol1)
		game.addVisual(arbol2)
		game.addVisual(arbol3)
		game.addVisual(bache1)
		game.addVisual(bache2)
		game.addVisual(bache3)
		game.addVisual(bache4)
		game.addVisual(rabbit)
		config.configurarTeclas()
		game.showAttributes(rabbit) // Debug	
		game.addVisual(barraVidas)
		game.addVisual(vidaExtra)
			// colisiones del conjeo con los objetos
		game.onCollideDo(rabbit, { elemento => elemento.chocar()})
			// puesta en marcha del auto
		game.addVisual(camion1R)
		camion1R.arrancarAuto()
		game.addVisual(camion2R)
		camion2R.arrancarAuto()
			// game.addVisual(camion3R)
			// camion3R.arrancarAuto()
			// game.addVisual(camion4R)
			// camion4R.arrancarAuto()
		game.addVisual(auto1R)
		auto1R.arrancarAuto()
		game.addVisual(auto2R)
		auto2R.arrancarAuto()
			// game.addVisual(camion1L)
			// camion1L.arrancarAuto()
			// game.addVisual(camion2L)
			// camion2L.arrancarAuto()
		game.addVisual(camion3L)
		camion3L.arrancarAuto()
		game.addVisual(camion4L)
		camion4L.arrancarAuto()
		game.addVisual(auto1L)
		auto1L.arrancarAuto()
		game.addVisual(auto2L)
		auto2L.arrancarAuto()
	}

}

object vidaExtra {

	var property image = "assets/zanahoria50.png"
	const posX = [ 3, 4, 5, 6, 7, 8, 9, 10, 11 ]
	const posY = [ 1, 2, 3, 5, 6, 7 ]
	var property position = new Position(x = posX.anyOne(), y = posY.anyOne())

	method chocar() {
		barraVidas.ganarVida()
		game.removeVisual(self)
	}

	method positionRandom() {
		position = new Position(x = posX.anyOne(), y = posY.anyOne())
	}

}

object rabbitWin {

	var property image = "assets/win3.png"
	var property position = game.origin()

	method ganar() {
		ruido.parar()
		ganador.reproducir()
		game.clear()
		game.addVisual(self)
		rabbit.gano()
		vidaExtra.positionRandom()
		game.schedule(4000, { => tablero.inicio()}) // VA AL INICIO DEL TABLERO EN ULTIMA POSICION 
		//
	}

}

object barraVidas {

	var property image = "assets/vidas-3.png"

	method position() = game.at(0, 5)

	method perderVida() {
		if (rabbit.vidas() == 3) {
			image = "assets/vidas-2.png"
			rabbit.vidas(2)
		} else if (rabbit.vidas() == 2) {
			image = "assets/vidas-1.png"
			rabbit.vidas(1)
		} else if (rabbit.vidas() == 1) {
			rabbitGameOver.perder()
		}
	}

	method ganarVida() {
		vida.reproducir()
		if (rabbit.vidas() == 2) {
			image = "assets/vidas-3.png"
			rabbit.vidas(3)
		} else if (rabbit.vidas() == 1) {
			image = "assets/vidas-2.png"
			rabbit.vidas(2)
		}
	}

}

object rabbitGameOver {

	var property image = "assets/perder.jpg"
	var property position = game.origin()

	method perder() {
		ruido.parar()
		gameOver.reproducir()
		game.clear()
		game.addVisual(self)
		game.schedule(4000, { => tablero.inicio()}) // VA AL INICIO DEL TABLERO EN ULTIMA POSICION 
		rabbit.vidas(3)
		barraVidas.image("assets/vidas-3.png")
		vidaExtra.positionRandom()
	}

}

//
object enter {

	var property image = "assets/ENTER.png"
	var property position = new Position(x = 0, y = 0)

}

