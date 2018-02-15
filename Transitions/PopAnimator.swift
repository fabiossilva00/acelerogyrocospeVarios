//
//  PopAnimator.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 15/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 4.0
    var presenting = true
    var originFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let toViewC = transitionContext.view(forKey: .to)!
        let ajudaView = presenting ? toViewC : transitionContext.view(forKey: .from)!
        
        let initialFrame = presenting ? originFrame : ajudaView.frame
        let finalFrame = presenting ? ajudaView.frame : originFrame
        
        let xScaleFactor = presenting ? initialFrame.width / finalFrame.width : finalFrame.width / initialFrame.width
        let yScaleFactor = presenting ? initialFrame.height / finalFrame.height : finalFrame.height / initialFrame.height
        
        let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)
        
        if presenting {
            ajudaView.transform = scaleTransform
            ajudaView.center = CGPoint(x: initialFrame.midX, y: initialFrame.midY)
            ajudaView.clipsToBounds = true
        }
        
        containerView.addSubview(toViewC)
        containerView.bringSubview(toFront: ajudaView)
        
        UIView.animate(withDuration: duration, animations: {
            ajudaView.transform = self.presenting ? CGAffineTransform.identity : scaleTransform
            ajudaView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
        }, completion: { _ in
            transitionContext.completeTransition(true)
        })
        
//        //Simples
//        containerView.addSubview(toViewC!)
//        toViewC?.alpha = 0.0
//        UIView.animate(withDuration: duration, animations: {
//            toViewC!.alpha = 0.0
//        }, completion: { _ in
//            transitionContext.completeTransition(true)
//        })
        
    }
    

}
