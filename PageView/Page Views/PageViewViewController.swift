//
//  PageViewViewController.swift
//  acelerogyrocospe
//
//  Created by Fabio Sousa da Silva on 14/02/2018.
//  Copyright © 2018 Fabio Sousa da Silva. All rights reserved.
//

import UIKit

class PageViewViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    var pageControl = UIPageControl()
    
    func vcID(viewcontroller: String) -> UIViewController {
        
        return UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewcontroller)
    }
    
    lazy var viewsIDCor: [UIViewController] = {
        
        return [vcID(viewcontroller: "page1ID"), vcID(viewcontroller: "page2ID"), vcID(viewcontroller: "page3ID"), vcID(viewcontroller: "page4ID")]
        
    }()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let viewIndex = viewsIDCor.index(of: viewController) else { return nil }
        let previousIndex = viewIndex - 1
        guard previousIndex >= 0 else { return viewsIDCor.last }
        guard viewsIDCor.count > previousIndex else { return nil }
        
        return viewsIDCor[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewIndex = viewsIDCor.index(of: viewController) else { return nil }
        let nextIndex = viewIndex + 1
        
        let viewIDC = viewsIDCor.count
        
        guard viewIDC != nextIndex else { return viewsIDCor.first}
        
        guard viewIDC > nextIndex else { return nil}
        
        return viewsIDCor[nextIndex]
    }
    
    func configurePageControl() {
        
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 50,width: UIScreen.main.bounds.width,height: 50))
        self.pageControl.currentPage = 0
        self.pageControl.numberOfPages = viewsIDCor.count
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContent = pageViewController.viewControllers![0]
        self.pageControl.currentPage = viewsIDCor.index(of: pageContent)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurePageControl()
        self.delegate = self
        self.dataSource = self
        if let firstVC = viewsIDCor.first {
            setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
            
        }
        
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

