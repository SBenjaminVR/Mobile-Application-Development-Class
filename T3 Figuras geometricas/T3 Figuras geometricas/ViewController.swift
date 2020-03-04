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
        if unwindSegue.source is ViewControllerPrisma {
            
        }
        else if unwindSegue.source is ViewControllerEsfera {
            lbMedidas.text = "Radio = " + String(describing: medidas!)
            lbVolumen.text = String(describing: volumen!)
        }
    }

}

