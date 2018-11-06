//
//  ProfileViewController.swift
//  Developer
//
//  Created by Risya Maulana on 06/11/18.
//  Copyright © 2018 Fleava. All rights reserved.
//

import UIKit

class ProfileViewController: ViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func logoutButtonTapped(_ sender: UIButton) {
        UserDefaults.standard.removeObject(forKey: "user_id")
        UserDefaults.standard.removeObject(forKey: "user_name")
        UserDefaults.standard.synchronize()
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let goToLandingPage = storyBoard.instantiateViewController(withIdentifier: "landingViewController") as! LandingViewController;
        
        self.transitionBack(to: goToLandingPage, duration: 0.3)
    }
    
}
