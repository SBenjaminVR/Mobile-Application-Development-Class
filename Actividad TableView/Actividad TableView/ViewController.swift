//
//  ViewController.swift
//  Actividad TableView
//
//  Created by Fabiola Valdez on 3/5/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbNombre: UILabel!
    @IBOutlet weak var lbPuntos: UILabel!
    @IBOutlet weak var lbEmail: UILabel!
    @IBOutlet weak var imgImagen: UIImageView!
    
    var nombre: String!
    var puntos: Int!
    var email: String!
    var imagen: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lbNombre.text = "Nombre: " + nombre
        lbEmail.text = "Email: " + email
        lbPuntos.text = "Puntos: " + String(describing: puntos!)
        imgImagen.image = imagen
        title = nombre
    }


}

