//
//  TutorialViewController.swift
//  QuizApp
//
//  Created by ZYYX Intern on 08/02/2023.
//

import UIKit

class TutorialViewController: UIPageViewController{
   
    lazy var subViewController = [UIViewController]()
    let pageControl = UIPageControl()
    let initialPage = 0
    
//    lazy var subViewControllers:[UIViewController] = {
//        return [
//            UIStoryboard(name: "Introduce1ViewController", bundle: nil).instantiateViewController(withIdentifier: "Introduce1ViewController") as! Introduce1ViewController,
//            UIStoryboard(name: "Introduce2ViewController", bundle: nil).instantiateViewController(withIdentifier: "Introduce2ViewController") as! Introduce2ViewController,
//            UIStoryboard(name: "Introduce3ViewController", bundle: nil).instantiateViewController(withIdentifier: "Introduce3ViewController") as! Introduce3ViewController
//        ]
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        
        setViewControllers([subViewController[0]], direction:.forward, animated: false, completion: nil)
    }

}

extension TutorialViewController{
    func setup(){
        dataSource = self
        delegate = self
        
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
        
        // create an array of view controler
        let page1 = Introduce1ViewController()
        let page2 = Introduce2ViewController()
        let page3 = Introduce3ViewController()
        
        subViewController.append(page1)
        subViewController.append(page2)
        subViewController.append(page3)
        
        setViewControllers([subViewController[initialPage]], direction: .forward, animated: true, completion: nil)
    }
    
    func style(){
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.numberOfPages = subViewController.count
        pageControl.currentPage = initialPage
    }
    
    func layout(){
        view.addSubview(pageControl)
        
        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 67),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 1),
        ])
    }
}

// MARK: -Actions
extension TutorialViewController{
    // change page when pageControl tapped
    @objc func pageControlTapped(_ sender: UIPageControl){
        setViewControllers([subViewController[sender.currentPage]], direction: .forward, animated: true, completion: nil)
    }
}

// MARK: - DataSoures
extension TutorialViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewController.firstIndex(of: viewController) ?? 0
        if(currentIndex <= 0){
            return nil
        }
        return subViewController[currentIndex-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewController.firstIndex(of: viewController) ?? 0
        if(currentIndex >= subViewController.count-1){
            return nil
        }
         return subViewController[currentIndex+1]
    }
}

// MARK: - Delegate
extension TutorialViewController: UIPageViewControllerDelegate{
    // keep page controler in sync with view Controller
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = subViewController.firstIndex(of: viewControllers[0]) else { return }
        pageControl.currentPage = currentIndex
    }
}
