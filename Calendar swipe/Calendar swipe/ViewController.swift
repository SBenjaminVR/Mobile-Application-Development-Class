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
    let formato: DateFormatter = DateFormatter()
    
    func llenarLabels(dia: String, mes: String, anio: String, numero: String ) {
        lbAnio.text = anio;
        lbMes.text = mes;
        lbNumero.text = numero;
        lbDia.text = dia;
    }
    
    func obtenerFecha(dia: inout String, mes: inout String, anio: inout String, numero: inout String, fecha: String) {
        var bDia = false, bMes = false, bNumero = false, primerEspacio = false, segundoEspacio = false;
        
        for character in fecha {
            if character != "," {
               if !bDia && character != " " {
                    dia += String(character)
                }
               else {
                    bDia = true
                    if !bMes && character != " " {
                        mes += String(character)
                    }
                    else {
                        if (!primerEspacio) {
                            primerEspacio = true
                            continue
                        }
                        bMes = true
                        if !bNumero && character != " " {
                            numero += String(character)
                        }
                        else {
                            if (!segundoEspacio) {
                                segundoEspacio = true
                                continue
                            }
                            bNumero = true
                            anio += String(character)
                        }
                    }
                }
            }
        }
    }
    
    
    @IBAction func swipeRight(_ sender: UISwipeGestureRecognizer) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        formato.dateStyle = DateFormatter.Style.full
        let fechaEnString = formato.string(from: fecha)
        
        formato.dateFormat = "EEE"
        var dia = formato.string(from: fecha),
        mes = " ", anio = " ", numero = " "
        
        /*
        obtenerFecha(dia: &dia, mes: &mes, anio: &anio, numero: &numero, fecha: fechaEnString)
 */
        llenarLabels(dia: dia, mes: mes, anio: anio, numero: numero)
    }


}

