import UIKit

class Empleado: CustomStringConvertible, Equatable, Comparable, Codable {
    static func < (izq: Empleado, der: Empleado) -> Bool {
        return izq.apellidos < der.apellidos
    }
    
    static func == (izq: Empleado, der: Empleado) -> Bool {
        return izq.ident == der.ident
    }
    
    var description: String {
        return "Id: \(ident), Nombre: \(nombre) \(apellidos), Trabaja en: \(depto)"
    }
    
    var ident : Int
    var nombre : String
    var apellidos : String
    var depto : String

    init(ident: Int, nombre: String, apellidos: String, depto: String) {
        self.ident = ident
        self.nombre = nombre
        self.apellidos = apellidos
        self.depto = depto

    }
}
let emp1 = Empleado(ident: 123, nombre : "Perla",   apellidos : "Leal Flores", depto : "Ventas")
let emp2 = Empleado(ident: 456, nombre : "Jorge", apellidos : "Garza Junco", depto : "Mercadotecnia")
let emp3 = Empleado(ident: 789, nombre : "Karla", apellidos : "Delgado Ruiz", depto : "Finanzas")
let emp4 = Empleado(ident: 234, nombre : "Rolando", apellidos : "Espinoza Junco", depto : "Ventas")

var empleados = [emp1, emp2, emp3, emp4]

print("Muestra el empleado 1")
print(emp1)

print("Compara empleado 1 con empleado 2")
print(emp1 == emp2)
print("Compara empleado 1 con empleado 1")
print(emp1 == emp1)

empleados.sort(by: <)
print("Muestra lista de empleados ordenados usando <")
for emp in empleados {
    print(emp)
}

let jsonEncoder = JSONEncoder()

if let jsonData = try? jsonEncoder.encode(empleados),
    let jsonString = String(data: jsonData, encoding: .utf8) {
        print(jsonString)
    }
