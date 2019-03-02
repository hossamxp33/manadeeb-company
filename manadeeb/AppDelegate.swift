//
//  AppDelegate.swift
//  manadeeb
//
//  Created by hossam ahmed on 11/24/18.
//  Copyright © 2018 hossam ahmed. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import SocketIO

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var firstTabNavigationController : UINavigationController!
    var secondTabNavigationControoller : UINavigationController!
    var thirdTabNavigationControoller : UINavigationController!
    
    let defualts = UserDefaults.standard
    var socketid = String()
    
    let manager = SocketManager(socketURL: URL(string: "http://codesroots.com:2400")!, config: [.log(true), .compress])
    
    
    var vc = UIViewController()

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        
        
        let socket =  manager.defaultSocket
        socket.connect()
        socket.on("user_connection", callback:{ data, ack in
            if self.socketid == nil {
                self.socketid = data[0] as! String
            }
        })
        // setup navBar.....
        UINavigationBar.appearance().barTintColor = UIColor.rgb(104, green: 31, blue: 109)
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        UINavigationBar.appearance().isTranslucent = false
        GMSPlacesClient.provideAPIKey("AIzaSyDK2PpcLlIHlgyNCLNH0cIIOxr_o9OIomM")
        ////////// change  font  of  segmented controller
        let attr = NSDictionary(object: UIFont(name: "DroidArabicKufi", size: 15)!, forKey: NSAttributedStringKey.font as NSCopying)
        UISegmentedControl.appearance().setTitleTextAttributes(attr as [NSObject : AnyObject] , for: .normal)
        
        ////////// change  font  of   uibarButton
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [
                NSAttributedStringKey.font : UIFont(name: "DroidArabicKufi", size: 14)!,
                NSAttributedStringKey.foregroundColor : UIColor.white,
                ], for: .normal)
        ////////////
        
        
        /////////////
        let tabBarController = UITabBarController()
        let layout = UICollectionViewFlowLayout()
        firstTabNavigationController = UINavigationController.init(rootViewController: MainPageController(collectionViewLayout:layout ))
        secondTabNavigationControoller = UINavigationController.init(rootViewController: ChatListController(collectionViewLayout:layout ))
        thirdTabNavigationControoller = UINavigationController.init(rootViewController : LoginController())
        tabBarController.viewControllers = [firstTabNavigationController, secondTabNavigationControoller,thirdTabNavigationControoller]
        
        
         vc = MainProductController(collectionViewLayout:layout )
        
        
        let item1 = UITabBarItem(title: "الرئيسية", image: UIImage(named: "house-outline١"), tag: 0)
        let item2 = UITabBarItem(title: "المحادثات", image:  UIImage(named: "thinking١"), tag: 1)
        
        if defualts.value(forKey: "company_id") != nil {
            let item3 = UITabBarItem(title: "تسجيل خروج", image:  UIImage(named: "user (2)"), tag: 2)
            thirdTabNavigationControoller.tabBarItem = item3
        }else{
            let item3 = UITabBarItem(title: "تسجيل دخول", image:  UIImage(named: "user (2)"), tag: 2)
            thirdTabNavigationControoller.tabBarItem = item3
        }
        
        firstTabNavigationController.tabBarItem = item1
        secondTabNavigationControoller.tabBarItem = item2
         if defualts.value(forKey: "company_id") != nil {
         tabBarController.selectedViewController = firstTabNavigationController
         }else{
        tabBarController.selectedViewController = thirdTabNavigationControoller
        }
        
        /////// check if there is Internet Connection Available!
        if Reachability.isConnectedToNetwork(){
        print("Internet Connection Available!")
        }else{
        print("Internet Connection not Available!")
        var alert = UIAlertView(title: "عفوا", message: "لا يوجد اتصال بالانترنت", delegate: nil, cancelButtonTitle: "موافق")
        alert.show()
        }
        
        UITabBar.appearance().tintColor =  UIColor.rgb(104, green: 31, blue: 109)
        self.window?.rootViewController = tabBarController
        return true
    
    
    }
}

