//
//  ViewController.swift
//  EjemploEstructuras
//
//  Created by Angel  on 13/12/21.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var favButton: UIBarButtonItem!
    
    var contenidoWeb: String?
    var userDefaults = UserDefaults.standard
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }
    
    private func configureView() {
        guard let urlRecibida = contenidoWeb else {return}
        guard let url = URL(string: urlRecibida) else {return}
        
       
        
        let request = URLRequest(url: url)
        
        
        webView.load(request)
        
        webView.navigationDelegate = self
    }
    
    // METODOS DEL NAVIGATION DELEGATE
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        // cuando empieza la navegacion
        
        activity.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        // cuando acaba la navegacion
        activity.stopAnimating()
        activity.hidesWhenStopped = true
    }
    
    
    
    // FUNCION QUE PERMITE COMPARTIR EL POST QUE ESTABA LEYENDO POR OTRAS APLICACIONES
    
    @IBAction func shareInfo(_ sender: Any) {
       
        let activityACompartir = UIActivityViewController(activityItems: [self.webView.url!], applicationActivities: nil)
        
        activityACompartir.popoverPresentationController?.sourceView = self.view
        
        self.present(activityACompartir, animated: true, completion: nil)
        
        
    }
    
    // FUNCION QUE PERMITE GUARDAR EL POST EN FAVORITOS
    
    @IBAction func addFavPage(_ sender: Any) {
        let nombre = self.webView.title!
        let url = self.webView.url!
        let objecto = [nombre,url] as [Any]
        
        userDefaults.set(objecto, forKey: "Pagina Preferida")
        
        
    }
    
}

