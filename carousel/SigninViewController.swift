//
//  SigninViewController.swift
//  carousel
//
//  Created by Ben Lin on 2/6/15.
//  Copyright (c) 2015 Ben Lin. All rights reserved.
//

import UIKit

class SigninViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var signinButtonsImageView: UIImageView!
    @IBOutlet weak var signinFieldImageView: UIImageView!
    @IBOutlet weak var backButton: UIButton!
    var signinButtonsImageViewOriginalY = 496.0;
    var signinButtonOriginalY = 480.0;
    var signinFieldImageViewOriginalY = 208.5
    var emailTextFieldOriginalY = 186.0;
    var passwordTextFieldOriginalY = 231.0;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        UIView.animateWithDuration(0.4, animations: {
            self.passwordTextField.center.y = CGFloat(self.passwordTextFieldOriginalY - 90.0)
            self.emailTextField.center.y = CGFloat(self.emailTextFieldOriginalY - 90.0)
            self.signinFieldImageView.center.y = CGFloat(self.signinFieldImageViewOriginalY - 90.0)
            self.signinButton.center.y = CGFloat(self.signinButtonOriginalY - 220.0)
            self.signinButtonsImageView.center.y = CGFloat(self.signinButtonsImageViewOriginalY - 220.0)
        })
        
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        UIView.animateWithDuration(0.4, animations: {
            self.passwordTextField.center.y = CGFloat(self.passwordTextFieldOriginalY)
            self.emailTextField.center.y = CGFloat(self.emailTextFieldOriginalY)
            self.signinFieldImageView.center.y = CGFloat(self.signinFieldImageViewOriginalY)
            self.signinButton.center.y = CGFloat(self.signinButtonOriginalY)
            self.signinButtonsImageView.center.y = CGFloat(self.signinButtonsImageViewOriginalY)
        })
    }
    
    @IBAction func backButtonPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func signinButtonPressed(sender: UIButton) {
        if (emailTextField.text.isEmpty) {
            var alertView = UIAlertView(title: "Email required", message: "Please enter your email address", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            return
        }
        if (passwordTextField.text.isEmpty) {
            var alertView = UIAlertView(title: "Password required", message: "Please enter your password", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            return
        }
        
        var alertView = UIAlertView(title: "Signing in ...", message: nil, delegate: self, cancelButtonTitle: nil)
        alertView.show()
        delay(2) {
            alertView.dismissWithClickedButtonIndex(0, animated: true)
            if (self.emailTextField.text == "blin@yahoo-inc.com" && self.passwordTextField.text == "abcd") {
                self.performSegueWithIdentifier("signinSegue", sender: self)
            } else {
                var errorView = UIAlertView(title: "Sign In Failed", message: "Incorrect email or password.", delegate: self, cancelButtonTitle: "OK")
                errorView.show()
            }
        }
        
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
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
