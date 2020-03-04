//
//  ViewControllerEsfera.swift
//  T3 Figuras geometricas
//
//  Created by Benjamín Valdez on 3/1/20.
//

import UIKit

class ViewControllerEsfera: UIViewController {

    @IBOutlet weak var imgEsfera: UIImageView!
    @IBOutlet weak var tfRadio: UITextField!
    
    @IBAction func quitarTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if Double (tfRadio.text!) == nil {
            let alerta = UIAlertController(title: "Error", message: "Los campos deben tener datos numéricos", preferredStyle: .alert)
            let accion = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
            return false;
        }
        return true;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let numero = Double(tfRadio.text!) else { return }
        let volumenEsfera = pow(numero, 3)  * ((4/3) * Double.pi)
        guard let medidasEsfera = NumberFormatter().number(from: tfRadio.text!) else { return }
        
        let vistaInicial = segue.destination as! ViewController
        vistaInicial.fotoPrincipal = imgEsfera.image
        vistaInicial.medidas = medidasEsfera as? CGFloat
        vistaInicial.volumen = CGFloat(volumenEsfera)
    }


}
