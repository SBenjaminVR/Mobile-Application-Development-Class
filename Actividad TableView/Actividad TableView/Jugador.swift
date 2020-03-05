//
//  Jugador.swift
//  Actividad TableView
//
//  Created by Benjamín Valdez on 3/5/20.
//

import UIKit

class Jugador: NSObject {
    var nombre: String  = ""
    var puntos: Int  = 0
    var email: String  = ""
    var imagen: UIImage!
    
    init(nombre: String, puntos: Int, email: String, imagen: UIImage) {
        self.nombre = nombre;
        self.puntos = puntos;
        self.email = email;
        self.imagen = imagen;
    }
}
