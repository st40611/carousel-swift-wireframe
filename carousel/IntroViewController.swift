//
//  IntroViewController.swift
//  carousel
//
//  Created by Ben Lin on 2/5/15.
//  Copyright (c) 2015 Ben Lin. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    //x = -30, y = 474
    //x = 45, y = 753
    @IBOutlet weak var introTile1ImageView: UIImageView!
    //x = 259, y = 586
    //x = 200, y = 753
    @IBOutlet weak var introTile2ImageView: UIImageView!
    //x = 213, y = 432
    //x = 200, y = 830
    @IBOutlet weak var introTile3ImageView: UIImageView!
    //x = 137, y = 525
    //x = 46, y = 908
    @IBOutlet weak var introTile4ImageView: UIImageView!
    //x = 8, y = 432
    //x = 123, y = 908
    @IBOutlet weak var introTile5ImageView: UIImageView!
    //x = 109, y = 442
    //x = 200, y = 908
    @IBOutlet weak var introTile6ImageView: UIImageView!
    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var lastContentOffset = CGFloat(0.0)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        scrollView.contentSize = introImageView.image!.size
        scrollView.delegate = self
        // Tile 1 transformation
        introTile1ImageView.transform = CGAffineTransformMakeRotation(CGFloat(-10 * M_PI / 180))
        
        // Tile 2 transformation
        introTile2ImageView.transform = CGAffineTransformMakeScale(2, 2)
        introTile2ImageView.transform = CGAffineTransformRotate(introTile2ImageView.transform, CGFloat(-10 * M_PI / 180))
        
        // Tile 3 transformation
        introTile3ImageView.transform = CGAffineTransformMakeScale(2, 2)
        introTile3ImageView.transform = CGAffineTransformRotate(introTile3ImageView.transform, CGFloat(10 * M_PI / 180))
        
        // Tile 4 transformation
        introTile4ImageView.transform = CGAffineTransformMakeScale(2, 2)
        introTile4ImageView.transform = CGAffineTransformRotate(introTile4ImageView.transform, CGFloat(8 * M_PI / 180))
        
        // Tile 5 transformation
        introTile5ImageView.transform = CGAffineTransformMakeScale(2, 2)
        introTile5ImageView.transform = CGAffineTransformRotate(introTile5ImageView.transform, CGFloat(-8 * M_PI / 180))

        // Tile 6 transformation
        introTile6ImageView.transform = CGAffineTransformMakeScale(2, 2)
        introTile6ImageView.transform = CGAffineTransformRotate(introTile6ImageView.transform, CGFloat(-8 * M_PI / 180))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // This method is called as the user scrolls
        // 0 - 568
        
        var percentage:Double  = Double((scrollView.contentOffset.y) / 568)
        
        introTile1ImageView.transform = CGAffineTransformMakeRotation(10 * CGFloat(scrollView.contentOffset.y - 568.0) * CGFloat(M_PI) / CGFloat(180.0 * 568.0))
        introTile1ImageView.transform = CGAffineTransformTranslate(introTile1ImageView.transform, CGFloat(75.0 * percentage), CGFloat(279.0 * percentage))
        
        introTile2ImageView.transform = CGAffineTransformMakeRotation(10 * CGFloat(scrollView.contentOffset.y - 568.0) * CGFloat(M_PI) / CGFloat(180.0 * 568.0))
        introTile2ImageView.transform = CGAffineTransformScale(introTile2ImageView.transform, CGFloat(2.0 - percentage), CGFloat(2.0 - percentage))
        introTile2ImageView.transform = CGAffineTransformTranslate(introTile2ImageView.transform, CGFloat(-59.0 * percentage), CGFloat(227.0 * percentage))
        
        introTile3ImageView.transform = CGAffineTransformMakeRotation(-10 * CGFloat(scrollView.contentOffset.y - 568.0) * CGFloat(M_PI) / CGFloat(180.0 * 568.0))
        introTile3ImageView.transform = CGAffineTransformScale(introTile3ImageView.transform, CGFloat(2.0 - percentage), CGFloat(2.0 - percentage))
        introTile3ImageView.transform = CGAffineTransformTranslate(introTile3ImageView.transform, CGFloat(-13.0 * percentage), CGFloat(398.0 * percentage))
        
        introTile4ImageView.transform = CGAffineTransformMakeRotation(-8 * CGFloat(scrollView.contentOffset.y - 568.0) * CGFloat(M_PI) / CGFloat(180.0 * 568.0))
        introTile4ImageView.transform = CGAffineTransformScale(introTile4ImageView.transform, CGFloat(2.0 - percentage), CGFloat(2.0 - percentage))
        introTile4ImageView.transform = CGAffineTransformTranslate(introTile4ImageView.transform, CGFloat(-91.0 * percentage), CGFloat(383.0 * percentage))
        
        introTile5ImageView.transform = CGAffineTransformMakeRotation(8 * CGFloat(scrollView.contentOffset.y - 568.0) * CGFloat(M_PI) / CGFloat(180.0 * 568.0))
        introTile5ImageView.transform = CGAffineTransformScale(introTile5ImageView.transform, CGFloat(2.0 - percentage), CGFloat(2.0 - percentage))
        introTile5ImageView.transform = CGAffineTransformTranslate(introTile5ImageView.transform, CGFloat(115.0 * percentage), CGFloat(476.0 * percentage))

        introTile6ImageView.transform = CGAffineTransformMakeRotation(8 * CGFloat(scrollView.contentOffset.y - 568.0) * CGFloat(M_PI) / CGFloat(180.0 * 568.0))
        introTile6ImageView.transform = CGAffineTransformScale(introTile6ImageView.transform, CGFloat(2.0 - percentage), CGFloat(2.0 - percentage))
        introTile6ImageView.transform = CGAffineTransformTranslate(introTile6ImageView.transform, CGFloat(91.0 * percentage), CGFloat(466.0 * percentage))
        
        self.lastContentOffset = scrollView.contentOffset.y

    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // This method is called when the scrollview finally stops scrolling.
    }
}
