//
//  SearchTableViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 21/12/2017.
//  Copyright © 2017 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import MapKit

class SearchTableViewController: UITableViewController {
    
    var matchItens: [MKMapItem] = []
    
    var mapView : MKMapView? = nil
    
    var handleMapSearchDelegate: HandlerMapSearch? = nil
    
    func parseAddress(selectedItem:MKPlacemark) -> String {
        
        let firstSpace = (selectedItem.subThoroughfare != nil && selectedItem.thoroughfare != nil) ? "" : ""
        let comma = (selectedItem.subThoroughfare != nil || selectedItem.thoroughfare != nil) && (selectedItem.subAdministrativeArea != nil || selectedItem.administrativeArea != nil) ? "" : ""
        let secondSpace = (selectedItem.subAdministrativeArea != nil && selectedItem.administrativeArea != nil) ? "" : ""
        
        let addressLine =  String (
            format: "%@%@%@%@%@%@%@",
            selectedItem.subThoroughfare ?? "",
            firstSpace,
            selectedItem.thoroughfare ?? "",
            comma,
            selectedItem.locality ?? "",
            secondSpace,
            selectedItem.administrativeArea ?? ""
        )
        return addressLine
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

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
        return matchItens.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        let selecteditem = matchItens[indexPath.row].placemark
        cell.textLabel?.text = selecteditem.name
        cell.detailTextLabel?.text = parseAddress(selectedItem: selecteditem)
        // Configure the cell...

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selecteditem = matchItens[indexPath.row].placemark
        handleMapSearchDelegate?.dropPinZoomIn(placemark: selecteditem)
        dismiss(animated: true, completion: nil)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

extension SearchTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let mapView = mapView, let searchBarText = searchController.searchBar.text else {return}
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = searchBarText
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { response, error in
                guard let response = response else {return}
                print(response)
            self.matchItens = response.mapItems
            self.tableView.reloadData()
        }
    }
}
