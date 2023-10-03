/*
 * Los sabores
 */
object frutilla { }
object chocolate { }
object vainilla { }
object naranja { }
object limon { }


/*
 * Golosinas
 */
 class Golosina{
 	var peso = 0
 	var property precio
 	method peso() = peso
 }
 
class Bombon inherits Golosina {
	
	override method precio() { return 5 }
	method mordisco() { peso = peso * 0.8 - 1 }
	method sabor() { return frutilla }
	method libreGluten() { return true }
}


class Alfajor inherits Golosina{
	
	override method precio() { return 12 }
	method mordisco() { peso = peso * 0.8 }
	method sabor() { return chocolate }
	method libreGluten() { return false }
}

class Caramelo inherits Golosina{

	override method precio() { return 12 }
	method mordisco() { peso = peso - 1 }
	method sabor() { return frutilla }
	method libreGluten() { return true }
}


class Chupetin inherits Golosina{
	
	override method precio() { return 2 }
	method mordisco() { 
		if (peso >= 2) {
			peso = peso * 0.9
		}
	}
	method sabor() { return naranja }
	method libreGluten() { return true }
}

class Oblea inherits Golosina{
	
	override method precio() { return 5 }
	method mordisco() {
		if (peso >= 70) {
			// el peso pasa a ser la mitad
			peso = peso * 0.5
		} else { 
			// pierde el 25% del peso
			peso = peso - (peso * 0.25)
		}
	}	
	method sabor() { return vainilla }
	method libreGluten() { return false }
}

class Chocolatin inherits Golosina{
	// hay que acordarse de *dos* cosas, el peso inicial y el peso actual
	// el precio se calcula a partir del precio inicial
	// el mordisco afecta al peso actual
	var comido = 0
	
	method pesoInicial(unPeso) { peso = unPeso }
	override method precio() { return peso * 0.50 }
	override method peso() { return (peso - comido).max(0) }
	method mordisco() { comido = comido + 2 }
	method sabor() { return chocolate }
	method libreGluten() { return false }

}

class GolosinaBaniada inherits Golosina{
	var golosinaInterior
	var pesoBanio = 4
	
	method golosinaInterior(unaGolosina) { golosinaInterior = unaGolosina }
	override method precio() { return golosinaInterior.precio() + 2 }
	override method peso() { return golosinaInterior.peso() + pesoBanio }
	method mordisco() {
		golosinaInterior.mordisco()
		pesoBanio = (pesoBanio - 2).max(0) 
	}	
	method sabor() { return golosinaInterior.sabor() }
	method libreGluten() { return golosinaInterior.libreGluten() }	
}


class Tuttifrutti inherits Golosina{
	var libreDeGluten
	const sabores = [frutilla, chocolate, naranja]
	var saborActual = 0
	
	method mordisco() { saborActual += 1 }	
	method sabor() { return sabores.get(saborActual % 3) }	

	override method precio() { return (if(self.libreGluten()) 7 else 10) }
	override method peso() { return 5 }
	method libreGluten() { return libreDeGluten }	
	method libreGluten(valor) { libreDeGluten = valor }
}

class BombonDuro inherits Bombon{
	
	override method mordisco(){
		peso = 0.max(peso-1)
	}	
	method gradoDeDureza(){
		if(peso > 12){
			return 3
		}else if(peso >= 8 and peso <= 12){
			return 2
		}else{
			return 1
		}
	}
}

class CarameloConCorazonDeChocolate inherits Caramelo{
	override method mordisco(){
		
	}
}












