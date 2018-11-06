//
//  LoginViewController.swift
//  Developer
//
//  Created by Risya Maulana on 05/11/18.
//  Copyright © 2018 Fleava. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class LoginViewController: ViewController, UITextFieldDelegate {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    let loginModel = LoginModel()
    
    var userId = String()
    var userName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        delegateTextField()
    }
    
//    delegate text field for placeholder
    func delegateTextField(){
        emailField.attributedPlaceholder =
            NSAttributedString(string: "EMAIL ADDRESS", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        emailField.delegate = self
        passwordField.attributedPlaceholder =
            NSAttributedString(string: "PASSWORD", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        passwordField.delegate = self
    }
    
//    Return Key Pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField{
        case emailField:
            passwordField.becomeFirstResponder()
        default:
            self.dismissKeyboard()
        }
        
        return true
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let backPage = storyBoard.instantiateViewController(withIdentifier: "landingViewController") as! LandingViewController;
        
        self.transitionBack(to: backPage, duration: 0.3)
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        SVProgressHUD.show()
        
        loginProcess()
    }
    
//    Login prosess request using Alamofire
    func loginProcess(){
        let headers = loginModel.headersForLogin()
        
        let parameters = loginModel.getLoginParameter(email: emailField.text!, password: passwordField.text!)
        
//        Alamofire HTTP Request
        Alamofire.request("http://128.199.83.121:5021/sign-in", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON(){
            response in
            
            self.authLoginProcess(response: response.data!)
            
        }
    }
//    Auth process from HTTP response data
    func authLoginProcess(response:Data){
        do {
            let data = try JSON(data: response)
            if data["message"].string == nil {
                if (data["is_active"].boolValue){
//                    Secret process
                    userId = data["id"].stringValue
                    userId = data["name"].stringValue
                    secretLoginProcess(token: data["token"].stringValue)
                } else {
                    SVProgressHUD.dismiss()
                    SVProgressHUD.showInfo(withStatus: "User is not active")
                }
            } else {
                SVProgressHUD.dismiss()
                SVProgressHUD.showInfo(withStatus: data["message"].stringValue)
            }
        } catch {
            print(error)
            SVProgressHUD.dismiss()
            SVProgressHUD.showError(withStatus: "Login is problem, please contact Customer Service")
        }
    }
    
//    Secret process request using Alamofire
    func secretLoginProcess(token:String){
//        header of secret
        let secretHeader = loginModel.headerForSecretLogin(token: token)
//      Alamofire HTTP request for secret
        Alamofire.request("http://128.199.83.121:5021/secret", method: .get, headers: secretHeader).responseJSON(){ response in
            do {
               let data = try JSON(data: response.data!)
                if (data["message"].stringValue == "secret"){
                    UserDefaults.standard.set(self.userId, forKey: "user_id")
                    UserDefaults.standard.set(self.userName, forKey: "user_name")
                    UserDefaults.standard.synchronize()
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let goToMainPage = storyBoard.instantiateViewController(withIdentifier: "mainTabBarViewController") as! MainTabBarViewController;
                    
                    self.transitionNext(to: goToMainPage, duration: 0.3)
                    SVProgressHUD.dismiss()
                } else {
                    SVProgressHUD.dismiss()
                    SVProgressHUD.showInfo(withStatus: data["message"].stringValue)
                }
            } catch {
                print(error)
                SVProgressHUD.dismiss()
                SVProgressHUD.showError(withStatus: "Login is problem, please contact Customer Service")
            }
        }
    }
}
