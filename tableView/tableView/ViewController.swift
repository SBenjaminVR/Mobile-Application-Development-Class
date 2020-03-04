//
//  ViewController.swift
//  tableView
//
//  Created by Benjamín Valdez on 3/2/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var lista = ["Star Platinum", "Crazy Diamond", "Gold Experience", "Stone Free", "Tusk", "Soft & Wet"]
    var lista2 = ["Jotaro Kujo", "Josuke Higashikata", "Giorno Giovanna", "Jolyne Kujo", "Johnny Joestar", "Gappy"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Jojo"
        
    }
    
    //MARK: - Metodos de Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "idCell")!
        celda.textLabel?.text = lista[indexPath.row]
        celda.detailTextLabel?.text = lista2[indexPath.row]
        //celda.detailTextLabel?.text = "\(indexPath.row + 3)"
        celda.imageView?.image = UIImage(named: "frog")
        return celda
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaDetalle = segue.destination as! ViewControllerDetalle
        let indice = tableView.indexPathForSelectedRow!
        vistaDetalle.datoMostrar = lista[indice.row]
    }
}

