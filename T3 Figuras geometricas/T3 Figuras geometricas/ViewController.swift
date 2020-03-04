//
//  ViewController.swift
//  T3 Figuras geometricas
//
//  Created by Benjamín Valdez on 3/1/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgFotoPrincipal: UIImageView!
    @IBOutlet weak var lbMedidas: UILabel!
    @IBOutlet weak var lbVolumen: UILabel!
    
    var fotoPrincipal: UIImage!
    var medidas: CGFloat?
    var largo: CGFloat?
    var ancho: CGFloat?
    var altura: CGFloat?
    var volumen: CGFloat?
    
    
    @IBAction func borrarDatos(_ sender: Any) {
        imgFotoPrincipal.image = nil;
        lbMedidas.text = ""
        lbVolumen.text = ""
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgFotoPrincipal.image = fotoPrincipal;
        lbMedidas.text = ""
        lbVolumen.text = ""
    }
    
    @IBAction func unwindEditar(unwindSegue: UIStoryboardSegue) {
        imgFotoPrincipal.image = fotoPrincipal;
        lbVolumen.text = String(describing: volumen!)
        if unwindSegue.source is ViewControllerPrisma {
            lbMedidas.text = "Largo = " + String(describing: largo!) + "\nAncho = " + String(describing: ancho!) +
            "\nAltura = " + String(describing: altura!)
        }
        else if unwindSegue.source is ViewControllerEsfera {
            lbMedidas.text = "Radio = " + String(describing: medidas!)
        }
    }

}

