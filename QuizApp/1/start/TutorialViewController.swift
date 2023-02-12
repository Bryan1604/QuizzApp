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
    let nextButton = UIButton()
    let initialPage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
    }
}

extension TutorialViewController{
    func setup(){
        dataSource = self
        delegate = self
        
        pageControl.addTarget(self,
                              action: #selector(pageControlTapped(_:)),
                              for: .valueChanged)
        
        // create an array of view controler
        //page 1
        let storyboard1 = UIStoryboard(name: "Introduce1ViewController", bundle: nil)
        let page1 = storyboard1.instantiateViewController(withIdentifier: "Introduce1ViewController") as! Introduce1ViewController
        
        //page 2
        let storyboard2 = UIStoryboard(name: "Introduce2ViewController", bundle: nil)
        let page2 = storyboard2.instantiateViewController(withIdentifier: "Introduce2ViewController") as! Introduce2ViewController
        
        //page 3
        let storyboard3 = UIStoryboard(name: "Introduce3ViewController", bundle: nil)
        let page3 = storyboard3.instantiateViewController(withIdentifier: "Introduce3ViewController") as! Introduce3ViewController
        
        subViewController.append(page1)
        subViewController.append(page2)
        subViewController.append(page3)
        
        setViewControllers([subViewController[initialPage]],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }
    
    // setup for page controller
    func style(){
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.numberOfPages = subViewController.count
        pageControl.currentPage = initialPage
        
        // next button
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setImage(UIImage(named: "Button"), for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .primaryActionTriggered)
    }
    
    // layout the view
    func layout(){
        view.addSubview(pageControl)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 48),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            
//            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 1),
            
            //nextButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.heightAnchor.constraint(equalToConstant: 48),
            nextButton.widthAnchor.constraint(equalToConstant: 48),
            nextButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor,constant: 32),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: nextButton.bottomAnchor, multiplier: 2.5),
        ])
        
        
    }
}

// MARK: -Actions
extension TutorialViewController{
    // change page when pageControl tapped
    @objc func pageControlTapped(_ sender: UIPageControl){
        setViewControllers([subViewController[sender.currentPage]],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }
    
    // change page when nextButton tapped
    @objc func nextButtonTapped(_ sender: UIButton){
        pageControl.currentPage += 1
        if pageControl.currentPage >= subViewController.count-1 {
            moveToLoginPage()
        }else{
            goToNextPage()
        }
    }
}

extension TutorialViewController{
    func goToNextPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil){
        guard let currentPage = viewControllers?[0] else { return }
        guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }
        setViewControllers([nextPage],
                           direction: .forward,
                           animated: animated,
                           completion: completion)
    }
    func moveToLoginPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil){
        print("check")
        let storyboard = UIStoryboard(name: "Introduce4ViewController", bundle: nil)
        let login = storyboard.instantiateViewController(withIdentifier: "Introduce4ViewController") as! Introduce4ViewController
        let rootView = UINavigationController(rootViewController: login)
        SceneDelegate.shared?.changeRootController(rootView)
    }
}

// MARK: - DataSoures
extension TutorialViewController: UIPageViewControllerDataSource{
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController)
                            -> UIViewController? {
        let currentIndex:Int = subViewController.firstIndex(of: viewController) ?? 0
        if(currentIndex <= 0){
            return nil
        }
        return subViewController[currentIndex-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController)
                            -> UIViewController? {
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
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = subViewController.firstIndex(of: viewControllers[0]) else { return }
        pageControl.currentPage = currentIndex
    }
}
