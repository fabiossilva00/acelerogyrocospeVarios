//
//  TodayViewController.swift
//  acce Widget
//
//  Created by Fabio Sousa da Silva on 15/05/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBAction func buttonWidget(_ sender: Any) {
        if buttonWidget.isHighlighted{
            buttonWidget.backgroundColor = UIColor.red
            print("Teste!")
        }else{
            buttonWidget.backgroundColor = UIColor.yellow
        }
    }
    
    @IBOutlet weak var buttonWidget: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
