// HOY HERENCIA SIMPLE: Permite que la Clase Persona {edad, dni, nombre, direccion}
// Clase Alumno {materias [], titulo = Lic} / Clase Profe {comision = []} Puedo hacer que estas clases hereden los atributos y métodos de la Clase Persona. Tipo jerarquía
// Clase Persona sería la supraentidad  y las otras 2 clases serían las subentidades.

// LOS TEST SON OBLIGATORIOS . 

// lookup method: cuando digo super() digo LOOK UP para la clase Padre. en el lookup method IMPORTA MUCHO el orden.
// CLASE PADRE
import elementos.*

class Plaga { // SUPERCLASE
    var poblacion 
    method transmiteEnfermedades() = poblacion >= 10 && self.condicionAdicional() // EL self ES LA INSTANCIA DE ESA CLASE. OSEA LOS GATITOS, ETC. NO ES LA SUPERCLASE, ES SIEMPRE INSTANCIA DEL OBJETO.
    method condicionAdicional() // CLASE ABSTRACTA: NO SE PUEDE INSTANCIAR. Se puede redefinir como cualquier otro método.
    method daño() = poblacion
    method efectoDeAtacar() {poblacion = poblacion + poblacion * 0.1}
    method atacar(unElemento) {
        unElemento.recibirAtaque(self)
        self.efectoDeAtacar()
    }
}

// el inherits: vas a heredar de la Clase Plaga todos sus atributos y métodos.
// EL HIJO SIEMPRE DICE QUIÉN ES SU PADRE. RELACIÓN DE JERARQUÍA EN UNA HERENCIA.
class Gatitos inherits Plaga { // cuca
    // pongo gatitoS en plural xq cada que instancie la clase, necesito que sean muchas, no solo 1, x eso plural el nombre.
    //var poblacion // si termino el ejercicio y sigue en amarillo, significa que debe ser CONST xq nunca cambia.
    var pesoPromedioBicho
    override method daño() = super() * 0.5
   // method transmiteEnfermedadesSINHERENCIA() = poblacion >= 10 && pesoPromedioBicho >= 10
    //DEBO REDEFINIR EL MÉTODO: con OVERRIDE (SOBREESCRIBIR) Y SUPER(). Va y busca en la superclase el metodo en el que se usa el super() y lo ejecuta. Si tiene parametro, el super() también debe ir con parametro.
    override method condicionAdicional() = pesoPromedioBicho >= 10 // redefino directamente el metodo condicionAdicional
    override method atacar() {
        super()
        pesoPromedioBicho += 2
    }
}

class Pulgas inherits Plaga {
    //var poblacion. Ya no va porque lo tengo por herencia.
    override method daño() = super() * 2
    // method transmiteEnfermedadesSINHERENCIA() = poblacion >= 10
    override method condicionAdicional() = true
}

// POR MÁS QUE EL MODELADO SEA EL MISMO, DEBEN SER DOS CLASES DISTINTAS XQ ME PIDE UNA DE PULGAS Y OTRA DE PERRITOS
class Perritos inherits Pulgas { //garra
    override method atacar() {super() * 0.1}
}

class Mosquitos inherits Plaga {
   //lo saco xq lo hereda de plaga: var poblacion // si los mosquitos no necesitan saber la poblacion, x polimorfismo entonces no haría falta que mosquitos tambiien lo tenga. Eso NO ES POLIMORFISMO! ERROR COMUN EN PARCIAL.
    //method transmiteEnfremedadesSINHERENCIA() = poblacion >= 10 && poblacion % 3 == 0
    override method condicionAdicional() = poblacion % 3 == 0
}

// el método daño() no es codigo repetido xq responde cosas distintas. Es polimórfico eso sí.
// el transmiteEnfermedades tiene el mismo nombre y dice lo mismo en todos, entonces: HERENCIA.