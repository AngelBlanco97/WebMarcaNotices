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
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Edit Profile"
        
        // Do any additional setup after loading the view.
    }
    
    // GUARDAMOS LA INFORMACION CONTENIDA EN LOS INPUTS EN LOS USERDEFAULTS
    @IBAction func saveUserDefaults(_ sender: Any) {
        guard let username = newUserName.text else {return}
        guard let subname = newSubName.text else {return}
        
        defaults.set(username, forKey: "name")
        defaults.set(subname, forKey: "subname")
        
        print("Datos cambiados")
        
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
