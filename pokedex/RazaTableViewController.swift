//
//  RazaTableViewController.swift
//  pokedex
//
//  Created by Daniel Suárez Souto on 8/11/17.
//  Copyright © 2017 UPM. All rights reserved.
//

import UIKit

class RazaTableViewController: UITableViewController {
    
    
    var raza : [Race]!
    
    var nameTipo : String!
    
    @IBOutlet weak var titulo: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titulo.title = nameTipo
        setUpNavBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return raza.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CeldaRaza", for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = raza[indexPath.row].name
        cell.detailTextLabel?.text = String(raza[indexPath.row].code)
        cell.detailTextLabel?.textColor = UIColor.red
        cell.imageView?.image = UIImage(named: raza[indexPath.row].icon)

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier! == "navegador" {
            if let vc = segue.destination as? WebViewController, let cell = sender as? UITableViewCell{
                vc.url = URL(string: "http://es.pokemon.wikia.com/wiki/" + (cell.textLabel?.text)!)
            }
        }
       
    }
    
    /* Función privada para el diseño del titulo de la tabla*/
    private func setUpNavBar(){
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }

}
