import wollok.game.*
import rabbit.*
import visual.*
// si el auto hace derecha-izquierda tiene que empezar con x=12 de posicion inicial
//si el auto hace izquierda-derecha tienq que empezar con x= de posicion inicial

class Auto{
	var property posicionInicial = new Position( x=0, y=0) //  eje y decide carril
	var property image 
	var property position = posicionInicial
	var property velocidad = 200  // menor es este valor mas rapido
	
	
	method imagen(unaImagen){ // tengo que pasarle una direccion
		image = unaImagen
		
	}
	
	method posicionIzquierda(){
		return position.left(1)

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
				position = self.posicionIzquierda()
			}
		
	}	
	
	method posicionDerecha(){
		return position.right(1)

	}
	
		method moverDerecha(){
		if (self.estaAlBordeDerecho()){
			position = posicionInicial
			}
			else{
				position = self.posicionDerecha()
			}
		
	}
	
	method estaAlBordeIzquierdo(){
		return self.posicionIzquierda().x() < 2
		
	}
	
	method estaAlBordeDerecho(){
		return self.posicionDerecha().x() > 11
		
	}
}	
	
	





		
		
	
		
	





	

