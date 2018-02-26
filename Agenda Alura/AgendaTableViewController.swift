//
//  AgendaTableViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 22/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import CoreData

class AgendaTableViewController: UITableViewController, UISearchBarDelegate, NSFetchedResultsControllerDelegate{
    
    let searchControl = UISearchController(searchResultsController: nil)
    var gerenciaSearch: NSFetchedResultsController<AgendaDados>?
    var agendaView: AgendaViewController?
 
    var contexto: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        return appDelegate.persistentContainer.viewContext
    }
    
    func searchItem() {
        self.searchControl.searchBar.delegate = self
        self.searchControl.dimsBackgroundDuringPresentation = false
        self.navigationItem.searchController = searchControl
        
    }
    
    func recuperaAgenda() {
        
        let searchAgenda: NSFetchRequest<AgendaDados> = AgendaDados.fetchRequest()
        let ordenaNome = NSSortDescriptor(key: "nome", ascending: false)

        searchAgenda.sortDescriptors = [ordenaNome]
        
        gerenciaSearch = NSFetchedResultsController(fetchRequest: searchAgenda, managedObjectContext: contexto, sectionNameKeyPath: nil, cacheName: nil)
        gerenciaSearch?.delegate = self
        
        do{
            try
            gerenciaSearch?.performFetch()
            print("Foi")
        }catch{
            print(error.localizedDescription)
        }
        
//        let searchAgenda: NSFetchRequest<AgendaDados> = AgendaDados.fetchRequest()
//        let ordenaNome = NSSortDescriptor(key: "nome", ascending: true)
//        searchAgenda.sortDescriptors = [ordenaNome]
        
    }
    
    @objc func mudaTela() {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchItem()
        recuperaAgenda()
        
        NotificationCenter.default.addObserver(self, selector: #selector(mudaTela), name: .UIDeviceOrientationDidChange, object: nil)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        guard let listaAgenda = gerenciaSearch?.fetchedObjects?.count else { return 0 }
        
        return listaAgenda
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellAgenda", for: indexPath) as! AgendaTableViewCell
        // Configure the cell...
        guard let agendaCell = gerenciaSearch?.fetchedObjects![indexPath.row] else { return cell}
        cell.configCell(agendaCell)
        
        //Direto na View
//        cell.nomeLabelCell.text = agendaCell.nome
//
//        if let imageAgenda = agendaCell.imagem as? UIImage {
//                cell.fotoImageCell.image = imageAgenda
//
//        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 86
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        performSegue(withIdentifier: "segueAgendaID", sender: nil)
//
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let agendaSeleciona = gerenciaSearch?.fetchedObjects![indexPath.row] else { return }
        agendaView?.agenda = agendaSeleciona
        
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            guard let agendaSeleciona = gerenciaSearch?.fetchedObjects![indexPath.row] else { return }
            contexto.delete(agendaSeleciona)
            
            do {
                try
                contexto.save()
                
            }catch{
                print(error.localizedDescription)
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .delete:
            
            break
        default:
            tableView.reloadData()
            
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueAgendaEditar"{
            agendaView = segue.destination as? AgendaViewController
        }
        
    }

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
