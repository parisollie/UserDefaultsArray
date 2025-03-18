//
//  ViewController.swift
//  UserDefaultsArray
//
//  Created by Paul Jaime Felix Flores on 19/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    //V-102,paso 1.0

    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    
    //Paso 1.1Variable para el uso defaults
    var array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Paso 1.6,Mandamos a llamar el Userdefault
        if let myArray = UserDefaults.standard.stringArray(forKey: "array") {
            //Ponemos esto para poder guardar 
            text1.text = myArray[0]
            text2.text = myArray[1]
            text3.text = myArray[2]
        }
    }

    //Paso 1.3 ,Paso para nuestro botton guardar
    @IBAction func guardar(_ sender: UIButton) {
        //Paso 1.4 .Aqui validamos solo el text 1,aunque lo deberíamos hacer para todos.
        if text1.text == "" {
            //Si esta vacio ,asi validamos nuestro textfield
            alerta(titulo: "Error", mensaje: "Completa todos los campos")
        }else{
            //(??),valor por defecto pondremos algo vacío
            array.append(text1.text ?? "")
            array.append(text2.text ?? "")
            array.append(text3.text ?? "")
            //Paso 1.5, lo metemos en Userdaults para guardarlo
            UserDefaults.standard.set(array, forKey: "array")
            //Vemos que se haya guardado
            print("guardo")
        }
    }
    //Paso 1.2,Creamos nuestra alerta
    func alerta(titulo: String, mensaje: String){
        
            let alert = UIAlertController(title: titulo, message: mensaje, preferredStyle: .alert)
            
            //handler: nil,no queremos que haga nada cuando le demos en ok
            let ok = UIAlertAction(title: "Okr", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
    }
}

