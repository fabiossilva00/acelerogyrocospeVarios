//
//  FormataViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 21/12/2017.
//  Copyright © 2017 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class FormataViewController: UIViewController, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrayTable[indexPath.row]
        return cell
    }
    
    
    @IBOutlet weak var viewBnt1: UIView!
    @IBOutlet weak var viewBnt2: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let arrayTable: Array<String> = ["Teste 1", "teste 2", "teste 3", "Teste 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func voltarButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(vc, animated: true, completion: nil)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
