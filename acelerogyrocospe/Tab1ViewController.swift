//
//  Tab1ViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 16/11/2017.
//  Copyright © 2017 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class Tab1ViewController: UIViewController {
    
    var startData = NSDate()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self.view)
        print(location.x)
        print(location.y)
        startData = Date() as NSDate!
        print(startData)
        //        if let theTouch = touches.first {
        //            startPoint = theTouch.location(in: self.view)
        //            let x = startPoint!.x
        //            let y = startPoint!.y
        //            print ("x = \(x)")
        //            print ("y = \(y)")
        //        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let theTouch = touches.first {
            
            let touchLocation = theTouch.location(in: self.view)
            let x = touchLocation.x
            let y = touchLocation.y
            
            //            print ("Mx = \(x)")
            //            print ("My = \(y)")
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let theTouch = touches.first {
            
            let endPoint = theTouch.location(in: self.view)
            let x = endPoint.x
            let y = endPoint.y
            let ti: TimeInterval = Date().timeIntervalSince(startData as! Date)
            print(ti)
            //            print ("Ex = \(x)")
            //            print ("Ey = \(y)")
        }
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
