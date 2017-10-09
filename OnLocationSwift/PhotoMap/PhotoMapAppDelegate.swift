//
//  PhotoMapAppDelegate.swift
//  PhotoMap
//
//  Translated by OOPer in cooperation with shlab.jp, on 2014/12/11.
//
//
/*
 Copyright (C) 2017 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information

 Abstract:
 A basic UIApplication delegate which sets up the application.
 */

import UIKit
import AWSCore
import AWSCognito
import AWSS3
import AWSAuthCore

@UIApplicationMain
@objc(PhotoMapAppDelegate)
class PhotoMapAppDelegate : UIResponder, UIApplicationDelegate {

    // The app delegate must implement the window @property
    // from UIApplicationDelegate @protocol to use a main storyboard file.
    //
    var window: UIWindow?
    
    var isInitialized = false
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        
        let didFinishLaunching = AWSSignInManager.sharedInstance().interceptApplication(
            application, didFinishLaunchingWithOptions: launchOptions)
        
        if (!isInitialized) {
            AWSSignInManager.sharedInstance().resumeSession(completionHandler: {
                (result: Any?, error: Error?) in
                print("Result: \(String(describing: result)) \n Error:\(String(describing: error))")
            })
            
            isInitialized = true
            
        }
     

        return didFinishLaunching
        
    }
    

}
