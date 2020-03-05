//
//  ViewController.swift
//  Minireto1 MasterMind
//
//  Created by Fabiola Valdez on 3/5/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgRespuesta1: UIImageView!
    @IBOutlet weak var imgRespuesta2: UIImageView!
    @IBOutlet weak var imgRespuesta3: UIImageView!
    @IBOutlet weak var imgRespuesta4: UIImageView!
    @IBOutlet weak var btnColor1: UIButton!
    @IBOutlet weak var btnColor2: UIButton!
    @IBOutlet weak var btnColor3: UIButton!
    @IBOutlet weak var btnColor4: UIButton!
    
    var listaColores = ["blue", "green", "pink", "red", "yellow", "pistache"]
    
    var coloresUser = [Int]()

    func ponerColoresAlAzar() -> Void {
        listaColores.shuffle()
        imgRespuesta1.image = UIImage(named: listaColores[0])
        imgRespuesta2.image = UIImage(named: listaColores[1])
        imgRespuesta3.image = UIImage(named: listaColores[2])
        imgRespuesta4.image = UIImage(named: listaColores[3])
    }
    
    func setBackground() -> Void {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.png")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    func ponerBotonesAlAzar() -> Void {
        listaColores.shuffle()
        coloresUser.removeAll()
        
        btnColor1.setBackgroundImage(UIImage(named: listaColores[4]), for: .normal)
        coloresUser.append(4)
        btnColor2.setBackgroundImage(UIImage(named: listaColores[3]), for: .normal)
        coloresUser.append(3)
        btnColor3.setBackgroundImage(UIImage(named: listaColores[0]), for: .normal)
        coloresUser.append(0)
        btnColor4.setBackgroundImage(UIImage(named: listaColores[2]), for: .normal)
        coloresUser.append(2)
    }
    
    func esconderRespuesta() -> Void {
        imgRespuesta1.isHidden = true
        imgRespuesta2.isHidden = true
        imgRespuesta3.isHidden = true
        imgRespuesta4.isHidden = true
    }
    
    func mostrarRespuesta() -> Void {
        imgRespuesta1.isHidden = false
        imgRespuesta2.isHidden = false
        imgRespuesta3.isHidden = false
        imgRespuesta4.isHidden = false
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        esconderRespuesta()
        ponerColoresAlAzar()
        ponerBotonesAlAzar()
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        if coloresUser[sender.tag] != 5 {
            coloresUser[sender.tag] += 1;
        }
        else {
            coloresUser[sender.tag] = 0;
        }
        sender.setBackgroundImage(UIImage(named: listaColores[coloresUser[sender.tag]]), for: .normal)
    }
    
    @IBAction func cambiarModo(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            esconderRespuesta()
        case 1:
            mostrarRespuesta()
        default:
            break
        }
    }
    
    func checarDuplicados() -> Void {
        if coloresUser.count != Set(coloresUser).count {
            let alerta = UIAlertController(title: "Error", message: "No puede haber dos o mas cuadros con el mismo color", preferredStyle: .alert)
            let accion = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
        }
    }
    
    @IBAction func probarRespuesta(_ sender: Any) {
        checarDuplicados()
        print(btnColor1.backgroundImage(for: .normal) == imgRespuesta1.image)
    }
    
    
}

