//
//  Router.swift
//  WidgetSample
//
//  Created by SunilMaurya on 03/05/17.
//  Copyright © 2017 SunilMaurya. All rights reserved.
//

import Foundation
import UIKit

class Router {
    class func openPage(type:String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        // Handle Deep Link Data to present the Article passed through
        
        if appDelegate.window?.rootViewController?.isKind(of: UINavigationController.self) ?? false {
            if let navController = appDelegate.window?.rootViewController as? UINavigationController {
                if type == "HOME" {
                    NSLog("HOME...")
                    //check for top view controller if A is not
                    if !(navController.topViewController is ViewController) {
                        print("HOME instantiated...")
                        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
                        if let viewVC = storyBoard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
                            navController.pushViewController(viewVC, animated: true)
                        }
                    } else {
                        print("HOME is already on top...")
                    }
                } else if type == "NEXT" {
                    if !(navController.topViewController is NextViewController) {
                        print("NEXT instantiated...")
                        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
                        if let nextVC = storyBoard.instantiateViewController(withIdentifier: "NextViewController") as? NextViewController {
                            navController.pushViewController(nextVC, animated: true)
                        }
                    } else {
                        print("NEXT is already on top...")
                    }
                }
            }
        }
    }
}
