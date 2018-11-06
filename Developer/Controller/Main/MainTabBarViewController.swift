//
//  MainTabBarViewController.swift
//  Developer
//
//  Created by Risya Maulana on 06/11/18.
//  Copyright © 2018 Fleava. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initTabBar()
        
    }
    
    func initTabBar(){
        let selectedColor = UIColor.init(rgb: 0xD9BBfB)
        
        UITabBarItem.appearance().setTitleTextAttributes([NSMutableAttributedString.Key.foregroundColor : selectedColor], for: .selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSMutableAttributedString.Key.foregroundColor : UIColor.darkGray], for: .normal)
        
        
        let bodyImage = UIImage(named: "body_icon")?.withRenderingMode(.alwaysOriginal)
        let bodyActiveImage = UIImage(named: "body_icon_active")?.withRenderingMode(.alwaysOriginal)
        tabBarItem = self.tabBar.items![0]
        tabBarItem.image = bodyImage
        tabBarItem.selectedImage = bodyActiveImage
        tabBarItem.title = "Body"
        
        let mindImage = UIImage(named: "mind_icon")?.withRenderingMode(.alwaysOriginal)
        let mindActiveImage = UIImage(named: "mind_icon_active")?.withRenderingMode(.alwaysOriginal)
        tabBarItem = self.tabBar.items![1]
        tabBarItem.image = mindImage
        tabBarItem.selectedImage = mindActiveImage
        tabBarItem.title = "Mind"
        
        let spiritImage = UIImage(named: "spirit_icon")?.withRenderingMode(.alwaysOriginal)
        let spiritDeactiveImage = UIImage(named: "spirit_icon_deactive")?.withRenderingMode(.alwaysOriginal)
        tabBarItem = self.tabBar.items![2]
        tabBarItem.image = spiritDeactiveImage
        tabBarItem.selectedImage = spiritImage
        tabBarItem.title = "Spirit"
        
        let eventImage = UIImage(named: "event_icon")?.withRenderingMode(.alwaysOriginal)
        let eventActiveImage = UIImage(named: "event_icon_active")?.withRenderingMode(.alwaysOriginal)
        tabBarItem = self.tabBar.items![3]
        tabBarItem.image = eventImage
        tabBarItem.selectedImage = eventActiveImage
        tabBarItem.title = "Event"
        
        let profileImage = getProfile().withRenderingMode(.alwaysOriginal)
        let profileActiveImage = UIImage(named: "event_icon_active")?.withRenderingMode(.alwaysOriginal)
        tabBarItem = self.tabBar.items![4]
        tabBarItem.image = profileImage
        tabBarItem.imageInsets = UIEdgeInsets.init(top: 5, left: 2, bottom: -5, right: -2)
        tabBarItem.badgeValue = " "
        
        self.selectedIndex = 2
    }
    
    func getProfile() -> UIImage{
        let pictureView = RoundUiView()
        pictureView.cornerRadius = 22
        pictureView.backgroundColor = UIColor.blue
        pictureView.frame = CGRect(x: 0, y: 0, width: 44, height: 44)
        
        let imageview = UIImageView()
        imageview.image  = UIImage(named: "profile")
        imageview.contentMode = .scaleAspectFill
        imageview.clipsToBounds = true
        imageview.frame = CGRect(x: 0, y: 0, width: pictureView.frame.width, height: pictureView.frame.height)
        
        pictureView.addSubview(imageview)
        pictureView.clipsToBounds = true
        
        let imageProfileView = image(with: pictureView)
        return imageProfileView!
        
    }
    
    func image(with view: UIView) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        if let context = UIGraphicsGetCurrentContext() {
            view.layer.render(in: context)
            view.backgroundColor = UIColor.clear
            let image = UIGraphicsGetImageFromCurrentImageContext()
            
            return image
        }
        return nil
    }
    
}

extension UIColor{
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
