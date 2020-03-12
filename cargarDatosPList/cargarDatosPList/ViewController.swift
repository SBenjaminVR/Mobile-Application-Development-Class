//
//  ViewController.swift
//  cargarDatosPList
//
//  Created by Benjamin Valdez on 3/12/20.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var arrDiccionarios: NSArray!

    @IBOutlet weak var lbCapacidad: UILabel!
    @IBOutlet weak var lbPrecio: UILabel!
    @IBOutlet weak var lbTipo: UILabel!
    @IBOutlet weak var imgFoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "Property List", ofType: "plist")
        arrDiccionarios = NSArray(contentsOfFile: path!)
    }
    
    //MARK: - Metodos de Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrDiccionarios.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celda")!
        let dic = arrDiccionarios[indexPath.row] as! NSDictionary
        
        celda.textLabel?.text = dic["tipo"] as? String
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let dic = arrDiccionarios[indexPath.row] as! NSDictionary
        lbTipo.text = dic["tipo"] as? String
        lbCapacidad.text = dic["tipo"] as? String
       
        let NSNum = dic["precio"] as! NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        //formatter.currencyCode = "USD"
        formatter.currencySymbol = "$"
        lbPrecio.text = formatter.string(from: NSNum)
        
        let sUrl = dic["urlFoto"] as? String
        let url = URL(string: sUrl!)
        let imgData = NSData(contentsOf: url!)
        imgFoto.image = UIImage(data: imgData! as Data)
        
    }


}

