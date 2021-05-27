import wollok.game.*
import rabbit.*
import visual.*
// si el auto hace derecha-izquierda tiene que empezar con x=12 de posicion inicial
//si el auto hace izquierda-derecha tienq que empezar con x=2 de posicion inicial

// auto no puede ir en y=4 y=0 y=9 porque es el cantero
class Auto{
	var property posicionInicial = new Position( x=3, y=5) //  eje y decide carril
	var property image 
	var property position = posicionInicial
	var property velocidad = 200  // menor es este valor mas rapido
	
	
	method imagen(unaImagen){ // tengo que pasarle una direccion de archivo
		image = unaImagen
		
	}
	
	
	method arrancarDerechaIzquierda(){
		
	game.onTick(velocidad,"mover auto",{self.moverIzquierda()})
	
	
	}
	
	method arrancarIzquierdaDerecha(){
		
	game.onTick(velocidad,"mover auto",{self.moverDerecha()})
	
	
	}
	
	method moverIzquierda(){
		if (self.estaAlBordeIzquierdo()){
			position = posicionInicial
			}
			else{
				position = position.left(1)
			}
		
	}	

	
		method moverDerecha(){
		if (self.estaAlBordeDerecho()){
			position = posicionInicial
			}
			else{
				position = position.right(1)
			}
		
	}
	
	method estaAlBordeIzquierdo(){
		return position.x() < 2
		
	}
	
	method estaAlBordeDerecho(){
		return position.x() > 10
		
	}
	
	method chocar(){
	
		
	}
	
	
	
}	

class AutoIzquierdaDerecha inherits Auto{
	
	
	
	
}

class AutoDerechaIzquierda inherits Auto{
	
}
	
	





		
		
	
		
	





	

