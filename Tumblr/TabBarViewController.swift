//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by James  on 3/6/15.
//  Copyright (c) 2015 James . All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var homeTabButton: UIButton!
    @IBOutlet weak var searchTabButton: UIButton!
    @IBOutlet weak var composeTabButton: UIButton!
    @IBOutlet weak var accountTabButton: UIButton!
    @IBOutlet weak var trendingTabButton: UIButton!
    @IBOutlet weak var explorePopup: UIImageView!
    
    var homeViewController: HomeViewController!
    var searchViewController: SearchViewController!
    var composeViewController: ComposeViewController!
    var accountViewController: AccountViewController!
    var trendingViewController: TrendingViewController!
    
    var currentViewController: UIViewController!
    var selectedViewController: UIViewController!
    var selectedTab: UIButton!
    
    var fadeTransition: FadeTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Setup the views
        homeViewController = storyboard.instantiateViewControllerWithIdentifier ("homeStory") as HomeViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier ("searchStory") as SearchViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier ("composeStory") as ComposeViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier ("accountStory") as AccountViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier ("trendingStory") as TrendingViewController
        
        // Initialise the first state
        currentViewController = homeViewController
        contentView.addSubview(homeViewController.view)
        
        homeButtonPressed(self)
        
    }
    
    override func viewDidAppear (animated: Bool) {
        helpBubble()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func homeButtonPressed(sender: AnyObject) {
        helpBubble()
        hideContentController(currentViewController)
        
        homeTabButton.selected = true
        
        addChildViewController(searchViewController)
        homeViewController.didMoveToParentViewController(self)
        contentView.addSubview(homeViewController.view)
        currentViewController = homeViewController
        
        searchTabButton.selected = false
        composeTabButton.selected = false
        accountTabButton.selected = false
        trendingTabButton.selected = false
    }
    
    @IBAction func didPressTab(sender: AnyObject) {
        hideContentController(currentViewController)
        
        UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseInOut, animations: { () -> Void in
            self.explorePopup.alpha = 0
            self.explorePopup.center.y = 500
        }, completion: nil)
        
        searchTabButton.selected = true
        addChildViewController(searchViewController)
        searchViewController.didMoveToParentViewController(self)
        contentView.addSubview(searchViewController.view)
        currentViewController = searchViewController
        
        homeTabButton.selected = false
        composeTabButton.selected = false
        accountTabButton.selected = false
        trendingTabButton.selected = false
    }
    
    @IBAction func accountButtonPressed(sender: AnyObject) {
        helpBubble()
        
        hideContentController(currentViewController)
        
        accountTabButton.selected = true
        addChildViewController(accountViewController)
        accountViewController.didMoveToParentViewController(self)
        contentView.addSubview(accountViewController.view)
        currentViewController = accountViewController
        
        homeTabButton.selected = false
        composeTabButton.selected = false
        searchTabButton.selected = false
        trendingTabButton.selected = false
    }
    @IBAction func trendingButtonPressed(sender: AnyObject) {
        helpBubble()
        hideContentController(currentViewController)
        
        trendingTabButton.selected = true
        addChildViewController(trendingViewController)
        accountViewController.didMoveToParentViewController(self)
        contentView.addSubview(trendingViewController.view)
        currentViewController = trendingViewController
        
        homeTabButton.selected = false
        composeTabButton.selected = false
        accountTabButton.selected = false
        searchTabButton.selected = false
    }
    
    func hideContentController(content: UIViewController) {
        content.willMoveToParentViewController(nil)
        content.view.removeFromSuperview()
        content.removeFromParentViewController()
    }
    
    func displayContentController(content: UIViewController) {
        addChildViewController(content)
        self.view.addSubview(content.view)
        content.didMoveToParentViewController(self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destinationViewController = segue.destinationViewController as ComposeViewController
        fadeTransition = FadeTransition()
        fadeTransition.duration = 0.5
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = fadeTransition
    }
    
    func helpBubble() {
        explorePopup.alpha = 1
        explorePopup.center.y = 480
        UIView.animateWithDuration(0.3, delay: 0, options: .Autoreverse | .Repeat | .CurveEaseInOut, animations: { () -> Void in
            self.explorePopup.center.y = 487
            }, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
