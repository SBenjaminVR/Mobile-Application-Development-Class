//
//  TableViewController.swift
//  Actividad TableView
//
//  Created by Benjamín Valdez on 3/5/20.
//

import UIKit

class TableViewController: UITableViewController {

    // Crea un arreglo de objetos de tipo jugador vacío
    var listaJugadores = [Jugador]()
    
    var lista : [Jugador]! //Aqui es una variable que apunta al aarreglo de objetos pero este no existe.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        let jug1 = Jugador(nombre: "David", puntos: 1800, email: "david.cantu@tec.mx", imagen: (UIImage(named: "user") ?? nil)!)
        let jug2 = Jugador(nombre: "Lasagna", puntos: 2500, email: "lasagna@tec.mx", imagen: (UIImage(named: "user3") ?? nil)!)
        let jug3 = Jugador(nombre: "Dimitri", puntos: 1900, email: "dimitri@tec.mx", imagen: (UIImage(named: "user2") ?? nil)!)
           
        listaJugadores += [jug1, jug2, jug3]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaJugadores.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idCell", for: indexPath)
        cell.textLabel?.text = listaJugadores[indexPath.row].nombre
        cell.imageView?.image = listaJugadores[indexPath.row].imagen
        return cell
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaDetalle = segue.destination as! ViewController
        let indice = tableView.indexPathForSelectedRow!
        vistaDetalle.nombre = listaJugadores[indice.row].nombre
        vistaDetalle.puntos = listaJugadores[indice.row].puntos
        vistaDetalle.email = listaJugadores[indice.row].email
        vistaDetalle.imagen = listaJugadores[indice.row].imagen
    }

}
