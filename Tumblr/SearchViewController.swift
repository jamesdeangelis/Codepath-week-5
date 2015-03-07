//
//  SearchViewController.swift
//  Tumblr
//
//  Created by James  on 3/6/15.
//  Copyright (c) 2015 James . All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollFeed: UIImageView!
    @IBOutlet weak var loading1: UIImageView!
    @IBOutlet weak var loading2: UIImageView!
    @IBOutlet weak var loading3: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = CGSize(width: 320, height: 1217)
        
    }
    
    override func viewWillAppear (animated: Bool) {
        //
    }
    
    override func viewDidAppear (animated: Bool) {
        
        scrollView.alpha = 0
        loading1.alpha = 1
        loading2.alpha = 0
        loading2.alpha = 0
        
//         Play loading animation
            UIView.animateWithDuration(0.2, delay: 0.2, options: .Repeat | .CurveLinear, animations: { () -> Void in
                self.loading1.alpha = 1
                }, completion: { (Bool) -> Void in
                    UIView.animateWithDuration(0.2, delay: 0.2, options: .CurveLinear, animations: { () -> Void in
                        self.loading2.alpha = 1
                        }, completion: { (Bool) -> Void in
                            UIView.animateWithDuration(0.2, delay: 0.2, options: .CurveLinear, animations: { () -> Void in
                                self.loading3.alpha = 1
                                }, completion: { (Bool) -> Void in
                                    UIView.animateWithDuration(0.2, delay: 0.2, options: .CurveLinear, animations: { () -> Void in
                                        self.loading3.alpha = 0
                                        self.loading2.alpha = 0
                                        self.loading1.alpha = 1
                                        }, completion: { (Bool) -> Void in
                                            UIView.animateWithDuration(0.2, delay: 0.2, options: .CurveLinear, animations: { () -> Void in
                                                self.loading2.alpha = 1
                                                }, completion: { (Bool) -> Void in
                                                    UIView.animateWithDuration(0.2, delay: 0.2, options: .CurveLinear, animations: { () -> Void in
                                                        self.loading3.alpha = 1
                                                        }, completion: { (Bool) -> Void in
                                                            UIView.animateWithDuration(0.5, delay: 0.2, options: .CurveLinear, animations: { () -> Void in
                                                                self.scrollView.alpha = 1
                                                            }, completion: nil)
                                                    })
                                            })
                                    })
                            })
                    })
            })
        
        // Fade In view
    }
    
    override func viewWillDisappear (animated: Bool) {
        //
    }
    
    override func viewDidDisappear (animated: Bool) {
        //
        UIView.animateWithDuration(3, animations: { () -> Void in
            //
        }, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
