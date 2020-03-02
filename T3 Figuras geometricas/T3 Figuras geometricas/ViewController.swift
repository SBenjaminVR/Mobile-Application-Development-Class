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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgFotoPrincipal.image = fotoPrincipal;
        lbMedidas.text = String(describing: medidas!)
        lbVolumen.text = String(describing: volumen!)
    }
    
    @IBAction func unwindEditar(unwindSegue: UIStoryboardSegue) {
        lbMedidas.text = String(describing: medidas!)
        lbVolumen.text = String(describing: volumen!)
    }

}

