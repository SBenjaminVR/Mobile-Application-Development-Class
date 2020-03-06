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
    @IBOutlet weak var imgPista1: UIImageView!
    @IBOutlet weak var imgPista2: UIImageView!
    @IBOutlet weak var imgPista3: UIImageView!
    @IBOutlet weak var imgPista4: UIImageView!
    @IBOutlet weak var segCtrlModo: UISegmentedControl!
    @IBOutlet weak var lbIntentos: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var vistaVerde: UIView!
    
    
    let listaColores = ["blue", "green", "pink", "red", "yellow", "pistache"]
    var codigoColores = [0,1,2,3,4,5]
    var listaGrises = ["RojoGris", "BlancoGris", "GrisGris"]
    var correlacion = [0,0,0,0]
    
    var coloresUser = [Int]()
    var coloresIA = [Int]()
    var intentos = 0
    
    var frameSuperiorIzquierdo = UIImageView()

    func ponerColoresAlAzar() -> Void {
        codigoColores.shuffle()
        coloresIA.removeAll()
        imgRespuesta1.image = UIImage(named: listaColores[codigoColores[0]])
        imgRespuesta2.image = UIImage(named: listaColores[codigoColores[1]])
        imgRespuesta3.image = UIImage(named: listaColores[codigoColores[2]])
        imgRespuesta4.image = UIImage(named: listaColores[codigoColores[3]])
        for i in 0...3 {
            coloresIA.append(codigoColores[i])
        }
    }
    
    func ponerCuadrosGrises() -> Void {
        imgPista1.image = UIImage(named: listaGrises[2])
        imgPista2.image = UIImage(named: listaGrises[2])
        imgPista3.image = UIImage(named: listaGrises[2])
        imgPista4.image = UIImage(named: listaGrises[2])
    }
    
    func setBackground() -> Void {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background.png")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    
    func ponerBotonesAlAzar() -> Void {
        codigoColores.shuffle()
        coloresUser.removeAll()
        
        btnColor1.setBackgroundImage(UIImage(named: listaColores[codigoColores[4]]), for: .normal)
        coloresUser.append(codigoColores[4])
        btnColor2.setBackgroundImage(UIImage(named: listaColores[codigoColores[3]]), for: .normal)
        coloresUser.append(codigoColores[3])
        btnColor3.setBackgroundImage(UIImage(named: listaColores[codigoColores[0]]), for: .normal)
        coloresUser.append(codigoColores[0])
        btnColor4.setBackgroundImage(UIImage(named: listaColores[codigoColores[2]]), for: .normal)
        coloresUser.append(codigoColores[2])
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
    
    func mostrarLabelIntentos() -> Void {
        lbIntentos.text = "Intentos: " + String(intentos)
    }
    
    func iniciarJuego() -> Void {
        segCtrlModo.selectedSegmentIndex = 0
        cambiarModo(segCtrlModo)
        intentos = 0
        mostrarLabelIntentos()
        ponerColoresAlAzar()
        ponerBotonesAlAzar()
        ponerCuadrosGrises()
        borrarHistorial()
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        iniciarJuego()
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
    
    func checarDuplicados() -> Bool {
        if coloresUser.count != Set(coloresUser).count {
            let alerta = UIAlertController(title: "Cuidado", message: "No puede haber dos o mas cuadros con el mismo color", preferredStyle: .alert)
            let accion = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alerta.addAction(accion)
            present(alerta, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    
    func checarColores() -> Void {
        for i in 0...3 {
            for j in 0...3 {
                if i == j {
                    if (coloresIA[i] == coloresUser[j]) {
                        correlacion[i] = 0
                    }
                }
                else {
                    if (coloresIA[i] == coloresUser[j]) {
                        correlacion[i] = 1
                    }
                }
            }
        }
    }
    
    func limpiarCorrelacion() -> Void {
        for i in 0...3 {
            correlacion[i] = 2
        }
    }
    
    func llenarCuadrosIntento() -> Void {
        correlacion.sort()
        imgPista1.image = UIImage(named: listaGrises[correlacion[0]])
        imgPista2.image = UIImage(named: listaGrises[correlacion[1]])
        imgPista3.image = UIImage(named: listaGrises[correlacion[2]])
        imgPista4.image = UIImage(named: listaGrises[correlacion[3]])
    }
    
    func seGano() -> Bool {
        for i in 0...3 {
            if correlacion[i] != 0 {
                return false
            }
        }
        return true
    }
    
    @IBAction func probarRespuesta(_ sender: Any) {
        if checarDuplicados() {
            limpiarCorrelacion()
            checarColores()
            llenarCuadrosIntento()
            intentos += 1
            mostrarLabelIntentos()
            if seGano() {
                let alerta = UIAlertController(title: "Enhorabuena", message: "Has ganado el juego en " + String(intentos) + " intentos", preferredStyle: .alert)
                let accion = UIAlertAction(title: "Gracias", style: .cancel, handler: {(action: UIAlertAction!) in self.iniciarJuego()})
                alerta.addAction(accion)
                present(alerta, animated: true, completion: nil)
            }
            else {
                agregarIntentoHistorial()
            }
        }
    }
    
    func borrarHistorial() -> Void {
        let subViews = scrollView.subviews
        for subview in subViews{
            if (subview.tag == 100) {
                subview.removeFromSuperview()
            }
        }
        scrollView.addSubview(vistaVerde)
        scrollView.contentSize = vistaVerde.frame.size
        
        frameSuperiorIzquierdo = UIImageView(image: UIImage(named: "blue"))
        frameSuperiorIzquierdo.frame = CGRect(x: 0, y: -66, width: 66, height: 66)
        
    }
    
    @IBAction func presionarIniciar(_ sender: Any) {
        iniciarJuego()
    }
    
    func agregarIntentoHistorial() -> Void {
        let primero = UIImageView(image: UIImage(named: listaColores[coloresUser[0]]))
        primero.frame = CGRect(x: frameSuperiorIzquierdo.frame.origin.x, y: frameSuperiorIzquierdo.frame.origin.y + frameSuperiorIzquierdo.frame.height + 2, width: 66, height: 66)
        primero.tag = 100
        scrollView.addSubview(primero)
        
        let segundo = UIImageView(image: UIImage(named: listaColores[coloresUser[1]]))
        segundo.frame = CGRect(x: primero.frame.origin.x + (primero.frame.width) + 3.25, y: frameSuperiorIzquierdo.frame.origin.y + frameSuperiorIzquierdo.frame.height + 2, width: 66, height: 66)
        
        let tercero = UIImageView(image: UIImage(named: listaColores[coloresUser[2]]))
        tercero.frame = CGRect(x: segundo.frame.origin.x + (segundo.frame.width) + 3.25, y: frameSuperiorIzquierdo.frame.origin.y + frameSuperiorIzquierdo.frame.height + 2, width: 66, height: 66)
        let cuarto = UIImageView(image: UIImage(named: listaColores[coloresUser[3]]))
        cuarto.frame = CGRect(x: tercero.frame.origin.x + (tercero.frame.width) + 3.25, y: frameSuperiorIzquierdo.frame.origin.y + frameSuperiorIzquierdo.frame.height + 2, width: 66, height: 66)
        let quinto = UIImageView(image: UIImage(named: listaGrises[correlacion[0]]))
        quinto.frame = CGRect(x: cuarto.frame.origin.x + (cuarto.frame.width) + 3.25, y: frameSuperiorIzquierdo.frame.origin.y + frameSuperiorIzquierdo.frame.height + 2, width: 30, height: 30)
        let sexto = UIImageView(image: UIImage(named: listaGrises[correlacion[1]]))
        sexto.frame = CGRect(x: quinto.frame.origin.x + (quinto.frame.width) + 3, y: frameSuperiorIzquierdo.frame.origin.y + frameSuperiorIzquierdo.frame.height + 2, width: 30, height: 30)
        let septimo = UIImageView(image: UIImage(named: listaGrises[correlacion[2]]))
        septimo.frame = CGRect(x: cuarto.frame.origin.x + (cuarto.frame.width) + 3.5, y: quinto.frame.origin.y + (quinto.frame.height) + 3, width: 30, height: 30)
        let octavo = UIImageView(image: UIImage(named: listaGrises[correlacion[3]]))
        octavo.frame = CGRect(x: septimo.frame.origin.x + (septimo.frame.width) + 3.5, y: sexto.frame.origin.y + (sexto.frame.height) + 3, width: 30, height: 30)
        
        segundo.tag = 100
        tercero.tag = 100
        cuarto.tag = 100
        quinto.tag = 100
        sexto.tag = 100
        septimo.tag = 100
        octavo.tag = 100
    
        scrollView.addSubview(segundo)
        scrollView.addSubview(tercero)
        scrollView.addSubview(cuarto)
        scrollView.addSubview(quinto)
        scrollView.addSubview(sexto)
        scrollView.addSubview(septimo)
        scrollView.addSubview(octavo)
        
        frameSuperiorIzquierdo = primero
    }

}


    
