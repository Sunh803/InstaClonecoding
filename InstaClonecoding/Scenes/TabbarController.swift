//
//  TabbarController.swift
//  InstaClonecoding
//
//  Created by SunHo Lee on 2023/01/07.
//

import Foundation
import UIKit
final class TabbarController : UITabBarController{
    override func viewDidLoad() {
        super.viewDidLoad()
        let feeedVC = UINavigationController(rootViewController: FeedViewController()) 
        feeedVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill") )
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        profileVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        viewControllers = [feeedVC, profileVC]
    }
}
