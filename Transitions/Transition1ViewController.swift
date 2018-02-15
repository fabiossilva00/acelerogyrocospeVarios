//
//  Transition1ViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 14/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class Transition1ViewController: UIViewController {
    
    let transition = PopAnimator()
    
    @IBOutlet weak var imageTap: UIImageView!
    @IBOutlet weak var viewTap: UIView!
    
    @objc func didTapImage() {
        let transition2ID = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "transition2ID")
        transition2ID.transitioningDelegate  = self
        self.present(transition2ID, animated: true, completion: nil)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapImage))
        self.viewTap.addGestureRecognizer(tap)
        
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

extension Transition1ViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
        return transition
    }
    
}
