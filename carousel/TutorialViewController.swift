//
//  TutorialViewController.swift
//  carousel
//
//  Created by Ben Lin on 2/6/15.
//  Copyright (c) 2015 Ben Lin. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var takeForSpinImageView: UIImageView!
    @IBOutlet weak var backupSwitch: UISwitch!
    @IBOutlet weak var takeForSpinButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.delegate = self
        scrollView.contentSize.width = CGFloat(1280.0)
        takeForSpinImageView.alpha = 0.0
        backupSwitch.alpha = 0.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        if (page == 3) {
            UIView.animateWithDuration(0.4, animations: {
                self.pageControl.alpha = 0.0
                self.backupSwitch.alpha = 1.0
                self.takeForSpinImageView.alpha = 1.0
            })
        } else {
            // Set the current page, so the dots will update
            pageControl.currentPage = page
            UIView.animateWithDuration(0.4, animations: {
                self.pageControl.alpha = 1.0
                self.backupSwitch.alpha = 0.0
                self.takeForSpinImageView.alpha = 0.0
            })
        }
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
