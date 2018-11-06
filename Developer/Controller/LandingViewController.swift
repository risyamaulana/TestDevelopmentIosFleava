//
//  LandingViewController.swift
//  Developer
//
//  Created by Risya Maulana on 05/11/18.
//  Copyright © 2018 Fleava. All rights reserved.
//

import UIKit
import SVProgressHUD

class LandingViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let goToLoginPage = storyBoard.instantiateViewController(withIdentifier: "loginViewController") as! LoginViewController;
        
        self.transitionNext(to: goToLoginPage, duration: 0.3)
    }
    @IBAction func connectFacebookButtonTapped(_ sender: UIButton) {
        SVProgressHUD.showInfo(withStatus: "Oops. Can't connect to Facebook now. Try again later")
    }
    
    @IBAction func connectVkButtonTapped(_ sender: UIButton) {
        SVProgressHUD.showInfo(withStatus: "Oops. Can't connect to VK right now. Try again later")
    }
    
    @IBAction func createAccountButtonTapped(_ sender: UIButton) {
        SVProgressHUD.showInfo(withStatus: "Oops. Can't create account now. Try again later")
    }
    
}
