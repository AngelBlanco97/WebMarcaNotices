//
//  ProfileViewController.swift
//  TareaIOS1TRIM
//
//  Created by Angel  Blanco on 19/12/21.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    let userDefaults = UserDefaults.standard

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var apellidos: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        setNames();
        super.viewDidLoad()
        title = "Profile"
        imgView.image = UIImage(named: "sports")
        
        // Do any additional setup after loading the view.
    }
    
    // CADA VEZ QUE CARGUE LA PANTALLA, SE ACTUALIZARA LOS NOMBRES SEGUN LAS PREFERENCIAS DEL USUARIO 
    override func viewDidAppear(_ animated: Bool) {
        setNames();
    }
    
    
    
    // BUSCA LOS VALORES DEL USERDEFAULTS PARA SETEARLOS EN LOS LABELS 
    func setNames() {
        username.text = userDefaults.string(forKey: "name")
        apellidos.text = userDefaults.string(forKey: "subname")
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
