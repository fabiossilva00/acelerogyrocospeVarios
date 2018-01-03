//
//  FormataViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 21/12/2017.
//  Copyright © 2017 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class FormataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let testando = arrayTable[indexPath.row]
        cell.teste1Lbl?.text = testando.testado
        cell.teste2Lbl?.text = testando.testeB
        cell.teste3Lbl?.text = testando.testeC
        cell.testeImageCell.image = UIImage(named: testando.testeImage)
        
        cell.testeImageCell.layer.cornerRadius = 12
        cell.testeImageCell.layer.masksToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad ? 260 : 175
    }
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var viewBnt1: UIView!
    @IBOutlet weak var viewBnt2: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let arrayTable: Array<ItensTable> = Teste().retornaTestes()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewBnt1.layer.cornerRadius = 23
        viewBnt2.layer.cornerRadius = 23
                
        self.tableView.dataSource = self
        self.tableView.delegate = self
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
