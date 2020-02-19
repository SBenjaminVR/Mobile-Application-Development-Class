//
//  ViewController.swift
//  Calificaciones
//
//  Created by Benjamín Valdez on 2/18/20.
//

import UIKit

class ViewController: UIViewController {
    
    func limpiaTextFields() -> Void {
        tfParciales.text = "";
        tfActividades.text = "";
        tfExamenFinal.text = "";
        tfResultado.text = "";
    }
    
    func mostrarAlerta() -> Void {
        let alerta = UIAlertController(title: "Error", message: "Todos los campos deben tener valor numérico", preferredStyle: .alert)
        let accion = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alerta.addAction(accion)
        present(alerta, animated: true, completion: nil)
    }

    @IBOutlet weak var tfParciales: UITextField!
    @IBOutlet weak var tfActividades: UITextField!
    @IBOutlet weak var tfExamenFinal: UITextField!
    @IBOutlet weak var tfResultado: UITextField!
    @IBOutlet weak var lbResultado: UILabel!
    @IBOutlet weak var lbExamenFinal: UILabel!
    @IBOutlet weak var btnCalcular: UIButton!
    @IBOutlet weak var swModo: UISwitch!
    
    @IBAction func quitarTeclado(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func cambiarModo(_ sender: UISwitch) {
        limpiaTextFields()
        lbExamenFinal.isHidden = !lbExamenFinal.isHidden;
        tfExamenFinal.isHidden = !tfExamenFinal.isHidden;
        
        if sender.isOn {
            btnCalcular.setTitle("Calcular nota final", for: .normal)
            lbResultado.text = "Nota Final"
        }
        else {
            btnCalcular.setTitle("Calcular nota pasar", for: .normal)
            lbResultado.text = "Nota para pasar"
        }
    }
    
    @IBAction func calcularNotas(_ sender: UIButton) {
        if swModo.isOn {
            if let parciales = Double (tfParciales.text!), let actividades = Double (tfActividades.text!), let examen = Double (tfExamenFinal.text!) {
                let final =  parciales * 0.5 + actividades * 0.2 + examen * 0.3
                tfResultado.text = String(format:"%.2f", final)
            }
            else {
                mostrarAlerta()
            }
        }
        else {
            if let parciales = Double (tfParciales.text!), let actividades = Double (tfActividades.text!) {
                var final = ((parciales * 0.5 + actividades * 0.2) - 70) / -0.3
                if (final <= 0) { final *= -1 }
                tfResultado.text = String(format:"%.2f", final)
            }
            else {
                mostrarAlerta()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

