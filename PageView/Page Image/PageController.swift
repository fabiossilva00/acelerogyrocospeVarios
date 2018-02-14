//
//  PageController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 14/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class PageController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var arrImages = Array<String>()
        
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let pageView: PageViewController = viewController as! PageViewController
        var index = pageView.pageIndex
        if index == 0 || index == NSNotFound {
            return nil
        }
        index = index - 1
        
        return getViewindex(index: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let pageView: PageViewController = viewController as! PageViewController
        var index = pageView.pageIndex
        if index == NSNotFound{
            return nil
        }
        
        index = index + 1
        
        if index == arrImages.count {
            return nil
        }
        
        return getViewindex(index: index)
    }
    
    func getViewindex(index: NSInteger) -> PageViewController {
        let pageView = self.storyboard?.instantiateViewController(withIdentifier: "pageViewID") as! PageViewController
        pageView.nameImage = "\(arrImages[index])"
        pageView.pageIndex = index
        
        return pageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrImages = ["FRAME_1.png", "FRAME_2.png", "FRAME_3.png", "FRAME_4.png"]
        
        self.dataSource = self
        
        self.setViewControllers([getViewindex(index: 0)] as [UIViewController], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)

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
