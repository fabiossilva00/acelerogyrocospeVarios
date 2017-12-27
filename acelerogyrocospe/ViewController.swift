//
//  ViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 31/10/2017.
//  Copyright © 2017 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import CoreMotion
import SystemConfiguration

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var xAce: UILabel!
    @IBOutlet weak var yAce: UILabel!
    @IBOutlet weak var zAce: UILabel!
    @IBOutlet weak var xRot: UILabel!
    @IBOutlet weak var yRot: UILabel!
    @IBOutlet weak var zRot: UILabel!
    

    @IBOutlet weak var txtfield01: UITextField!
    @IBOutlet weak var txtField02: UITextField!
    
    func startTime(){
        startData = Date() as! NSDate!
    }
    func endTime(){
       let ti: TimeInterval = Date().timeIntervalSince(startData as! Date)
        
        print("Terminei \(ti)")
        
    }
    @IBOutlet weak var horaTeste: UIDatePicker!
    @IBAction func horaTestes(_ sender: Any) {
        
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        startTime()
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        endTime()
    }
    
    @IBAction func testetoque(_ sender: Any, forEvent event: UIEvent) {
        let myButton = sender as! UIButton
        let touches = event.touches(for: myButton)
        let touch = touches?.first
        let touchPoint = touch?.location(in: myButton)
        print("touchPoint\(touchPoint)")
        formatteste()
    }
    
    @IBOutlet weak var segmentest: UISegmentedControl!
    @IBOutlet weak var testeHigh: UIButton!
    @IBAction func testeHigh(_ sender: Any) {
        
        segmentest.selectedSegmentIndex = 1
        
    }
    
    @IBAction func voltarButton(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(vc, animated: true, completion: nil)
    }
    
    var motionManager = CMMotionManager()
    var timer: Timer!
    var startPoint: CGPoint?
    var startData = NSDate()
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
    @IBOutlet var viewteste: UIView!
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates()
        motionManager.startGyroUpdates()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc func update() {
        if let accelerometerData = motionManager.accelerometerData {
            var x = accelerometerData.acceleration.x*10
            var y = accelerometerData.acceleration.y*10
            var z = accelerometerData.acceleration.z*10
            
            var formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 0
            
            let xAc = formatter.string(from: NSNumber(value: x))
            let yAc = formatter.string(from: NSNumber(value: y))
            let zAc = formatter.string(from: NSNumber(value: z))
//            print (xAc)
//            print (yAc)
//            print(zAc)
            self.xAce.text! = xAc!
            self.yAce.text! = yAc!
            self.zAce.text! = zAc!
        }
        if let gyroData = motionManager.gyroData {
//            print(gyroData)
            print(gyroData.rotationRate)
        }
//        if let magnetometerData = motionManager.magnetometerData {
//            print(magnetometerData)
//        }
//        if let deviceMotion = motionManager.deviceMotion {
//            print(deviceMotion)
//        }
    }
    
    func format(){
        let hora = "10:10:10"
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let str = formatter.date(from: hora)
        print(str)
    }
    
    func formatteste(){
        let inFormatter = DateFormatter()
        inFormatter.locale = NSLocale(localeIdentifier: "pt_BR") as Locale!
        inFormatter.dateFormat = "HH:mm"
        
        let outFormatter = DateFormatter()
        outFormatter.locale = NSLocale(localeIdentifier: "pt_BR") as Locale!
        outFormatter.dateFormat = "hh:mm"
        
        let inStr = "16:50"
        let date = inFormatter.date(from: inStr)!
        let outStr = outFormatter.string(from: date)
        print(outStr) // -> outputs 04:50
    
    }
        
}


