//
//  SelectorNoticiasViewController.swift
//  TareaIOS1TRIM
//
//  Created by Angel  on 17/12/21.
//

import UIKit

class SelectorNoticiasViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var eleccion = ""
    
    var nombresNoticias = ["Futbol", "Baloncesto", "Formula 1" , "Moto GP"]
    
    @IBOutlet weak var picker: UIPickerView!
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nombresNoticias.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return nombresNoticias[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        eleccion = nombresNoticias[row]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vistaCeldas = segue.destination as! TableViewControllerPosts
        vistaCeldas.decision = eleccion
        
        
        
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
