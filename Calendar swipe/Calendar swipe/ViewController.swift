//
//  ViewController.swift
//  Calendar swipe
//
//  Created by Benjamín Valdez on 2/22/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lbAnio: UILabel!
    @IBOutlet weak var lbMes: UILabel!
    @IBOutlet weak var lbNumero: UILabel!
    @IBOutlet weak var lbDia: UILabel!
    
    var fecha = Date()
    var dia = " ", mes = " ", anio = " ", numero = " "
    let formato: DateFormatter = DateFormatter()
    
    func llenarLabels() -> Void {
        lbAnio.text = anio;
        lbMes.text = mes;
        lbNumero.text = numero;
        lbDia.text = dia;
    }
    
    func obtenerFecha() -> Void {
        formato.dateFormat = "EEEE"
        dia = formato.string(from: fecha)
        formato.dateFormat = "dd"
        numero = formato.string(from: fecha)
        formato.dateFormat = "MMMM"
        mes = formato.string(from: fecha)
        formato.dateFormat = "y"
        anio = formato.string(from: fecha)
        
    }
    
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        fecha.addTimeInterval(86400)
        obtenerFecha()
        llenarLabels()
    }
    
    @IBAction func swipeLeft(_ sender: UISwipeGestureRecognizer) {
        fecha.addTimeInterval(-86400)
        obtenerFecha()
        llenarLabels()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        obtenerFecha()
        llenarLabels()
    }


}

