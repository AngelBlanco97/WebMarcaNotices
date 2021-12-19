//
//  TableViewControllerPosts.swift
//  EjemploEstructuras
//
//  Created by Angel  on 13/12/21.
//

import UIKit

class TableViewControllerPosts: UITableViewController, XMLParserDelegate {
    
    var posts = [Post]()
    var titulo = String()
    var link = String()
    var descrip = String()
    var nombreElemento = String()
    @IBOutlet var tabla: UITableView!
    
    let defaults = UserDefaults.standard
    var arrayFavoritos: Array<Post> = []
    
    
    var decision = ""
    
    var parser: XMLParser = XMLParser()
    
    let urlFutbol = "https://e00-marca.uecdn.es/rss/futbol/primera-division.xml"
    let urlBaloncesto = "https://e00-marca.uecdn.es/rss/baloncesto/acb.xml"
    let urlFormula1 = "https://e00-marca.uecdn.es/rss/motor/formula1.xml"
    let urlMotoGP = "https://e00-marca.uecdn.es/rss/motor/motogp.xml"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = decision
        
        
        // HACEMOS QUE LA DECISION DEL PICKER VIEW ENVIADAS POR SEGUE TE MUESTRE LAS INFORMACIONES DE LA MISMA CATEGORIA
        if (decision == "Futbol") {
            guard let url = URL(string: urlFutbol) else { return }
            guard let parser = XMLParser(contentsOf: url) else { return }
            parser.delegate = self
            parser.parse()

        } else if (decision == "Baloncesto") {
            guard let url = URL(string: urlBaloncesto) else {return}
            guard let parser = XMLParser(contentsOf: url) else { return }
            parser.delegate = self
            parser.parse()

        } else if (decision == "Formula 1") {
            guard let url = URL(string: urlFormula1) else {return}
            guard let parser = XMLParser(contentsOf: url) else { return }
            parser.delegate = self
            parser.parse()

        } else if (decision == "Moto GP") {
            guard let url = URL(string: urlMotoGP) else {return}
            guard let parser = XMLParser(contentsOf: url) else { return }
            parser.delegate = self
            parser.parse()

        }
        


        
    }

    
    
    // METODOS DELEGADOS DE XMLPARSER
    
    
           // CUANDO SE INICIA UN ELEMENTO
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        nombreElemento = elementName
        if nombreElemento == "item" {
            titulo = String()
            descrip = String()
            link = String()
        }
    }
    
    
    
           // CUANDO SE ENCUENTRA UN CARACTER
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if !data.isEmpty {
            if nombreElemento == "title" {
                titulo += data
            } else if nombreElemento == "link"{
                link += data
            } else if nombreElemento == "description" {
                descrip += data
            }
        }
    }
    
    
    
           // CUANDO SE TERMINA UN ELEMENTO
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let datosPost = Post(titulo: titulo, link: link, descrip: descrip)
            posts.append(datosPost)
        }
    }
    
    
    
    
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return posts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = posts[indexPath.row].titulo
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // preparamos el envio de informacion, puesto el ifentificador en concreto en el paso de uno a otro
        performSegue(withIdentifier: "irDetalle", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "irDetalle" {
            guard let celdaSeleccionada = tabla.indexPathForSelectedRow?.row else {return}
            let postSeleccionado = posts[celdaSeleccionada]
            let vistaDetalle = segue.destination as! ViewController
            vistaDetalle.contenidoWeb = postSeleccionado.link
        }
    }
    
}
