//
//  AppDelegate.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Properties
    
    let appContainer = GinoAppDependencyContainer()
    var window: UIWindow?
    
    // MARK: - Methods

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let controllers = [appContainer.makeDressFilterViewController(),
                           appContainer.makeCartViewController()]
        window?.rootViewController = self.makeTabBarViewController(controllers)
        window?.makeKeyAndVisible()
        
        return true
    }
    
    private func makeTabBarViewController(_ controllers: [UIViewController]) -> UIViewController {
        let tabBar = UITabBarController()
        let controllers = controllers.map { makeNavigationController($0) }
        tabBar.setViewControllers(controllers, animated: true)
        tabBar.view.tintColor = GinoColor.green
        
        return tabBar
    }

    private func makeNavigationController(_ rootViewController: UIViewController) -> UIViewController {
        let navigation = UINavigationController(rootViewController: rootViewController)
        navigation.navigationBar.prefersLargeTitles = true
        navigation.navigationBar.shadowImage = UIImage()
        navigation.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        return navigation
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

