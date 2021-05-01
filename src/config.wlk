import wollok.game.*
import rabbit.*

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ rabbit.irA(rabbit.position().left(2))})
		keyboard.right().onPressDo({ rabbit.irA(rabbit.position().right(2))})
		keyboard.up().onPressDo({ rabbit.irA(rabbit.position().up(2))})
		keyboard.down().onPressDo({ rabbit.irA(rabbit.position().down(2))})
		keyboard.h().onPressDo({rabbit.saluda()})
		keyboard.m().onPressDo({rabbit.limiteTablero()})
	}
	


//	method configurarColisiones() {
//		game.onCollideDo(pepita, { algo => algo.teEncontro(pepita)})
//	}
}


