//
//  ViewController.swift
//  Divisas
//
//  Created by Benjamin Valdez on 2/13/20.
//  Copyright © 2020 Benjamín Valdez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfTipoCambio: UITextField!
    @IBOutlet weak var tfPesos: UITextField!
    @IBOutlet weak var tfDolares: UITextField!
    
    @IBOutlet weak var imgDinero: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgDinero.image = UIImage(named: "dollarSign")
    }

    @IBAction func quitaTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func calculaDolares(_ sender: UIButton) {
        if let tipoCambio = Double (tfTipoCambio.text!),
            let pesos = Double (tfPesos.text!) {
            
            let dolares = pesos / tipoCambio
            tfDolares.text = "\(dolares)"
        }
        else {
            let alerta = UIAlertController(title: "Error", message: "Los campos deben tener valor numérico", preferredStyle: .alert)
            let accion = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            
            alerta.addAction(accion)
            
            present(alerta, animated: true, completion: nil)
        }
    }
}

