//
//  LoginViewController.swift
//  Instagram
//
//  Created by Xiaofei Long on 3/1/16.
//  Copyright © 2016 dreloong. All rights reserved.
//

import UIKit
import MBProgressHUD
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Actions

    @IBAction func onLoginButtonTouchUp(sender: AnyObject) {
        let progressHud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        progressHud.labelFont = UIFont.systemFontOfSize(14)

        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""

        PFUser.logInWithUsernameInBackground(
            username,
            password: password
        ) { (user: PFUser?, error: NSError?) -> Void in
            if let error = error {
                print(error.localizedDescription)
            } else {
                MBProgressHUD.hideHUDForView(self.view, animated: true)
                self.performSegueWithIdentifier("login", sender: nil)
            }
        }
    }
}
