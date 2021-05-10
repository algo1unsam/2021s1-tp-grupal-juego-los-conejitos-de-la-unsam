import wollok.game.*
import rabbit.*

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ rabbit.limiteLeft() })
		keyboard.right().onPressDo({ rabbit.limiteRight() })
		keyboard.up().onPressDo({ rabbit.limiteUp() })
		keyboard.down().onPressDo({ rabbit.limiteDown() })
		keyboard.h().onPressDo({ rabbit.saluda()})
		
	}
//prueba
//	method configurarColisiones() {
//		game.onCollideDo(pepita, { algo => algo.teEncontro(pepita)})
//	}
}



