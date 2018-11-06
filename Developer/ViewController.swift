//
//  ViewController.swift
//  Developer
//
//  Created by Risya Maulana on 05/11/18.
//  Copyright © 2018 Fleava. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        SVProgressHUDStyle()
        keyboardHideOnTapDelegate()
    }
    
    //Settings SVProgressHUD style
    func SVProgressHUDStyle() {
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setDefaultMaskType(.black)
    }

//  Keyboard Setting
    func keyboardHideOnTapDelegate(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
//  Keyboard hide
    @objc func dismissKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        view.endEditing(true)
    }
//    Keyboard hide controller
    @objc func keyboardWillHide(notification: NSNotification) {
        if ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) != nil {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y = 0
            }
        }
    }
    
    // Transation page
    // Transition next page
    func transitionNext(to toViewController: UIViewController, duration: TimeInterval){
        let transition = CATransition()
        transition.duration = duration
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        view.window!.layer.add(transition, forKey: kCATransition)
        present(toViewController, animated: false, completion: nil)
    }
    
    // Transition previous
    func transitionBack(to toViewController: UIViewController, duration: TimeInterval){
        let transition = CATransition()
        transition.duration = duration
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        view.window!.layer.add(transition, forKey: kCATransition)
        present(toViewController, animated: false, completion: nil)
    }

}

