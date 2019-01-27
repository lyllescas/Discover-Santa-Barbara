//
//  HomeViewController.swift
//  DSB
//
//  Created by Larissa Yllescas on 1/26/19.
//  Copyright © 2019 Larissa Yllescas. All rights reserved.
//

import UIKit

class HomeViewController: UIPageViewController, UIPageViewControllerDataSource {
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        return nil
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//
//        return nil
//    }
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newColoredViewController("Green"),
                self.newColoredViewController("Red"),
                self.newColoredViewController("Blue")]
    }()
    
    private func newColoredViewController(_ color: String) -> UIViewController {
        return  UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "\(color)ViewController")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
    
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
    }
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
        return nil
            
        }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
            
        }
        guard orderedViewControllers.count > previousIndex else {
            return nil
            
        }
        return orderedViewControllers[previousIndex]
        
    }

    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
}


