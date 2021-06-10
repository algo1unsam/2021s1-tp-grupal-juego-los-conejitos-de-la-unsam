import wollok.game.*
import rabbit.*
import config.*
import transito.*
import sonidos.*

class Arbol {

	var property image = "assets/arbol.png"
	var property position
	
	
	method chocar(){
	}


}

class Bache {
	const posX = [3, 4, 5, 6, 7, 8, 9, 10,11]
	const posY = [1,2,3,5,6,7]
	
	var property image = "assets/bache.png"
	var property position = new Position( x = posX.anyOne(), y = posY.anyOne())
	
	
	
	method chocar(){
		rabbit.perdioVida()
	}
}



object tablero {

	method inicio() {
		
		
		
		game.title("Rabbit Wollok Game")
		game.height(9)//alto
		game.width(15)//ancho
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

const camion2R = new AutoIzquierdaDerecha(image="assets/camion2R.png")
const camion1L = new AutoDerechaIzquierda(image="assets/camion1L.png")
const camion1R = new AutoIzquierdaDerecha(image="assets/camion1R.png")
const camion2L = new AutoDerechaIzquierda(image="assets/camion2L.png")
const camion3L= new AutoDerechaIzquierda(image="assets/camion3L.png")
const camion3R = new AutoIzquierdaDerecha(image="assets/camion3R.png")
const camion4L = new AutoDerechaIzquierda(image="assets/camion4L.png")
const camion4R= new AutoIzquierdaDerecha(image="assets/camion4R.png")


const auto1L = new AutoDerechaIzquierda(image="assets/camion1L.png") 
const auto1R = new AutoIzquierdaDerecha(image="assets/camion1R.png")
const auto2L = new AutoDerechaIzquierda(image="assets/camion2L.png")
const auto2R = new AutoIzquierdaDerecha(image="assets/camion2R.png")

//carretera de arriba que va de izquierda a derecha

const carreteraArriba = new Carretera(autosTrafico=[camion1L,camion2L,camion3L,camion4L,camion4R])


//carretera de abajo que va de derecha a izquierda

const carreteraAbajo = new Carretera(autosTrafico=[camion2R,camion1R,camion3R,camion4R,auto1R,auto2R])



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
		
		//colisiones del conjeo con los objetos
		game.onCollideDo(rabbit,{elemento => elemento.chocar()})
		
		
		
		
		//puesta en marcha del auto
		game.addVisual(camion4R)
		camion4R.arrancarAuto()
		game.showAttributes(camion4R)
		game.addVisual(camion4L)
		camion4L.arrancarAuto()
	
		game.addVisual(auto1L)
		auto1L.arrancarAuto()
		
	
		
		

	}

}
object vidaExtra{
	
	var property image = "assets/zanahoria50.png"
	
	const posX = [3, 4, 5, 6, 7, 8, 9, 10,11]
	const posY = [1,2,3,5,6,7]
	
	
	
	var property position = new Position( x = posX.anyOne(), y = posY.anyOne())
	
	
	method chocar(){
	

	
		
	}
	
	
	method ganarVida(){
		
	}
	
	
}

object rabbitWin {

	var property image = "assets/win3.png"
	var property position = game.origin()

	method ganar() {
		game.clear()
		game.addVisual(self)
		game.schedule(1000, { => start.inicio()}) //VA AL INICIO DEL TABLERO EN ULTIMA POSICION 
	}
}


object barraVidas{
	

	
	var property image= "assets/vidas-3.png"
	

	method position() = game.at(0,5)
	
	method perderVida(){
		
		if (rabbit.vidas() == 3){
			image= "assets/vidas-2.png"
			rabbit.vidas(2)
			
		}else if(rabbit.vidas()==2){
			image = "assets/vidas-1.png"
			rabbit.vidas(1)
		}else if(rabbit.vidas()==1){
			rabbitGameOver.perder()
		}
	
		
	}
	

}

object rabbitGameOver {

	var property image = "assets/perder.jpg"
	var property position = game.origin()

	method perder() {
		game.clear()
		game.addVisual(self)
		
		game.schedule(1000, { =>tablero.inicio()}) //VA AL INICIO DEL TABLERO EN ULTIMA POSICION 
		rabbit.vidas(3)
		
		barraVidas.image("assets/vidas-3.png")
	
	}
}

object enter {

	var property image = "assets/ENTER.png"
	var property position = new Position(x = 0, y = 0)

}




