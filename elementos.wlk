import plagas.*

// es clase xq dice que puede haber varios. "De cada hogar..."

class Hogar {
    var mugre 
    const confort // si no cambia nunca, para qué defino una var? va const.
    method esBueno() = confort >= mugre / 2
    method esAtacada() {mugre += Plaga.daño()} // POR PARAMETRO

    // profe
    method efectoDelAtaque(unaPlaga) {
        mugre = mugre + unaPlaga.daño() // el += mezcla cosas q son distintas. el + es un mensaje y el = es una asignación
    }
}

class Huerta {
    var produccion // es distinta para cada huerta, asi que la indico al momento de crearla
    method esBueno() = produccion > nivelMinimoProduccion.valor() // Tiene que existir.
    method esAtacada() {
        if(Plaga.transmiteEnfermedades()) {
            produccion = produccion - (10 + (Plaga.daño() * 0.1))
        }
        else {
            produccion = produccion - (Plaga.daño() * 0.1)
        }
    }

    // profe
    method efectoDelAtaque(unaPlaga) {
        produccion = 0.max(produccion - (unaPlaga.daño()*0.1) + if(unaPlaga.transmiteEnfermedades()) 10 else 0)
    }
}

// MUY IMPORTANTE!!! APARECE MUCHO EN EL PARCIAL II !!!!!!!!!!! datos FIJOS para todas las instancias de la clase: creo un objeto aparte.
object nivelMinimoProduccion {
    var property valor = 100
    // es un objeto porque este valor inicial debe ser comun para todas las huertas.
    // con el var me aseguro que varie y con el property me aseguro que no es fijo.
    // Puedo forzar este nivelMinimo con un initialize en la clase pero no sirve porque despues puedo cambiarlo en cualquier momento q instancie una huerta (?) "El famoso singleton )???? OBJ II"
}

class Mascota {
    var salud
    method esBueno() = salud > 250
    method esAtacada() {
        if(Plaga.transmiteEnfermedades()) {
          salud =  (salud - Plaga.daño()).max(0)
        }
    }
}

class Barrio {
    const elementos = []
    method esBueno(unElemento) = unElemento.esBueno()
    method esCopado() = self.cantElementosBuenos() > self.cantElementosMalos()
    method cantElementosBuenos() = elementos.count({e=>e.esBueno()}) // el closure siempre entre llaves
    method cantElementosMalos() = elementos.size() - self.cantElementosBuenos()
}