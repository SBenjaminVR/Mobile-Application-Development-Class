//
//  ViewControllerPrisma.swift
//  T3 Figuras geometricas
//
//  Created by Benjamín Valdez on 3/1/20.
//

import UIKit

class ViewControllerPrisma: UIViewController {

    @IBOutlet weak var imgPrisma: UIImageView!
    @IBOutlet weak var tfLargo: UITextField!
    @IBOutlet weak var tfAncho: UITextField!
    @IBOutlet weak var tfAltura: UITextField!
    
    
    @IBAction func quitarTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
           if Double (tfLargo.text!) == nil || Double (tfAncho.text!) == nil || Double (tfAltura.text!) == nil {
               let alerta = UIAlertController(title: "Error", message: "Los campos deben tener datos numéricos", preferredStyle: .alert)
               let accion = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
               alerta.addAction(accion)
               present(alerta, animated: true, completion: nil)
               return false;
           }
           return true;
       }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let largo = NumberFormatter().number(from: tfLargo.text!) else { return }
        guard let ancho = NumberFormatter().number(from: tfAncho.text!) else { return }
        guard let altura = NumberFormatter().number(from: tfAltura.text!) else { return }
        
        let volumenPrisma = Double(truncating: largo) * Double(truncating: ancho) * Double(truncating: altura)
        
        let vistaInicial = segue.destination as! ViewController
        vistaInicial.fotoPrincipal = imgPrisma.image
        vistaInicial.largo = largo as? CGFloat
        vistaInicial.ancho = ancho as? CGFloat
        vistaInicial.altura = altura as? CGFloat
        vistaInicial.volumen = CGFloat(volumenPrisma)
    }

}
