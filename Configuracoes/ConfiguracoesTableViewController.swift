//
//  ConfiguracoesTableViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 19/03/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class ConfiguracoesTableViewController: UITableViewController{
    
    @IBOutlet var configsTableView: UITableView!
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let footer = UIView()
//        footer.backgroundColor = UIColor.red
        let childView = UIView(frame: CGRect(x: tableView.frame.width / 4, y: 0, width: tableView.frame.width / 2, height: 35))
        childView.backgroundColor = UIColor.red
        
//        let version = UILabel(frame: CGRect(x: Double(childView.frame.width / 5), y: Double(childView.frame.height / 2), width: Double(childView.frame.width), height: 30))
        let version = UILabel(frame: CGRect(x: tableView.frame.width / 3, y: 0, width: tableView.frame.width / 3, height: 35))
        version.backgroundColor = UIColor.gray
        version.textAlignment = .center
        version.text = "Versáo 1.0"
        version.font = UIFont.systemFont(ofSize: 17, weight: UIFont.Weight.regular)
        childView.addSubview(version)
        
        
        switch section {
        case 0:
            
            break
        case 1:
                footer.addSubview(version)
            break
        default: break
        }
        
        return footer
    }
  
    /*
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        
        let title = "Teste"
        
        return title
    }
     */
    
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

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
