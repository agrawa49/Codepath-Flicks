//
//  AppDelegate.swift
//  flicks
//
//  Created by Akhil Agrawal on 2/6/17.
//  Copyright © 2017 Akhil Agrawal. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let nowPlayingNavigationController = createNavigationController(storyboard: storyboard, endpoint: "now_playing", title: "Now Playing", iconName: "now_playing")
        
        let topRatedNavigationController = createNavigationController(storyboard: storyboard, endpoint: "top_rated", title: "Top Rated", iconName: "top_rated")
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.barTintColor = UIColor.black
        tabBarController.tabBar.backgroundColor = UIColor.black
        tabBarController.tabBar.tintColor = UIColor(red: 255/255, green: 204/255, blue: 102/255, alpha:1)

        tabBarController.viewControllers = [nowPlayingNavigationController, topRatedNavigationController]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func createNavigationController(storyboard: UIStoryboard, endpoint: String, title: String, iconName: String) -> UINavigationController {
        let navigationController = storyboard.instantiateViewController(withIdentifier: "MoviesNavigationController") as! UINavigationController
        navigationController.navigationBar.barTintColor = UIColor.black
        let viewController = navigationController.topViewController as! MoviesViewController
        viewController.endpoint = endpoint
        navigationController.tabBarItem.image = UIImage(named: iconName)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor(red: 255/255, green: 204/255, blue: 102/255, alpha:1)], for: .selected)
        return navigationController
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

