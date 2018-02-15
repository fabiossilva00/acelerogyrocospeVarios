//
//  BananaViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 14/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit
import AVFoundation

class BananaViewController: UIViewController {
    
//    var chompAudio: AVAudioPlayer? = nil
    
    @IBOutlet weak var macacoImage: UIImageView!
    @IBOutlet weak var bananaImage: UIImageView!
    
//    func loadSound(filename: String) -> AVAudioPlayer {
//
//        let fileEx = Bundle.main.url(forResource: filename, withExtension: "caf")
//        print(fileEx)
//        var player = AVAudioPlayer()
//        do {
//            try player = AVAudioPlayer(contentsOf: fileEx!)
//            player.prepareToPlay()
//        } catch {
//            print("Error loading \(fileEx!): \(error.localizedDescription)")
//        }
//        return player
//
//    }
    
    @IBAction func handlerPan(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        
        if recognizer.state == UIGestureRecognizerState.ended {
            
            let velocity = recognizer.velocity(in: self.view)
            let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
            let slideMultiplier = magnitude/200
            print("magnitude: \(magnitude), slideMultiplier: \(slideMultiplier)")
            
            let slideFactor = 0.1 * slideMultiplier
            print("slideFactor: \(slideFactor)")
            
            var finalPoint = CGPoint(x: recognizer.view!.center.x + (velocity.x * slideFactor), y: recognizer.view!.center.y + (velocity.y * slideFactor))
            print("finalPoint: \(finalPoint)")
            
            finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
            finalPoint.y = min(max(finalPoint.y, 0), self.view.bounds.size.height)
            
            UIView.animate(withDuration: Double(slideFactor * 2), delay: 0, options: UIViewAnimationOptions.curveEaseOut, animations: { recognizer.view!.center = finalPoint }, completion: nil)
        }
        
    }
    
    @IBAction func handlerPinch(recognizer: UIPinchGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.scaledBy(x: recognizer.scale, y: recognizer.scale)
            recognizer.scale = 1
        }
        
    }
    
    @IBAction func handlerRotate(recognizer: UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = view.transform.rotated(by: recognizer.rotation)
         recognizer.rotation = 0
        }
        
    }
    
    @IBAction func voltaButton(_ sender: Any) {
        let buttonTelasID = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "buttonTelasID")
        self.present(buttonTelasID, animated: true, completion: nil)
        
    }
    
//    @objc func handlerTap(recognizer: UITapGestureRecognizer) {
//        self.chompAudio?.play()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        macacoImage.image = UIImage(named: "monkey.png")
        macacoImage.isUserInteractionEnabled = true
        bananaImage.image = UIImage(named: "banana.png")
        bananaImage.isUserInteractionEnabled = true
        
//        let filteredSubViews = self.view.subviews.filter({
//            $0 is UIImageView
//        })
//        for view in filteredSubViews {
//
//            let recognizer = UITapGestureRecognizer(target: self, action: #selector(handlerTap(recognizer:)))
//            recognizer.delegate = self
//            view.addGestureRecognizer(recognizer)
//
//        }
//
//        self.chompAudio = self.loadSound(filename: "chomp")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension BananaViewController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}
