//
//  EditUserDefaultsViewController.swift
//  TareaIOS1TRIM
//
//  Created by Angel  Blanco on 19/12/21.
//

import UIKit

class EditUserDefaultsViewController: UIViewController {

    @IBOutlet weak var newUserName: UITextField!
    @IBOutlet weak var newSubName: UITextField!
    @IBOutlet weak var saveNewData: UIButton!
    @IBOutlet weak var txt: UILabel!
    @IBOutlet weak var campoVacioName: UILabel!
    @IBOutlet weak var campoVacioSubname: UILabel!
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Profile"
        txt.text = "Guarda los cambios"
        campoVacioName.isHidden = true
        campoVacioSubname.isHidden = true
        
        // Do any additional setup after loading the view.
    }
    
    // GUARDAMOS LA INFORMACION CONTENIDA EN LOS INPUTS EN LOS USERDEFAULTS
    @IBAction func saveUserDefaults(_ sender: Any) {
        
        
        guard let username = newUserName.text, username != "" else {
            campoVacioName.isHidden = false
            txt.text = "No se ha podido guardar"
            return
        }
        guard let subname = newSubName.text, subname != "" else {
            campoVacioSubname.isHidden = false
            txt.text = "No se ha podido guardar."
            return
        }
        
        
         
        
        if (!username.isEmpty && !subname.isEmpty){
            // EN CASO DE QUE SE HAYAN RELLENADO, CAMBIAMOS LAS PREFERENCIAS DE USUARIO Y AVISAMOS AL USUARIO DEL CAMBIO.
            defaults.set(username, forKey: "name")
            defaults.set(subname, forKey: "subname")
            campoVacioName.isHidden = true
            campoVacioSubname.isHidden = true
            
            txt.text = "Datos cambiados"
            
        }
    }

}
