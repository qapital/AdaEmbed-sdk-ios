//
//  AdaWebHostViewController.swift
//  EmbedFramework
//
//  Created by Aaron Vegh on 2019-05-17.
//  Copyright © 2019 Ada Support. All rights reserved.
//

import UIKit
import WebKit


@objc(AdaWebHostViewController)
class AdaWebHostViewController: UIViewController {
    static func createWebController(with webView: WKWebView) -> AdaWebHostViewController {
        var storyboard:UIStoryboard
        #if SWIFT_PACKAGE
        let bundle = Bundle.module
        storyboard = UIStoryboard(name: "AdaWebHostViewController", bundle: bundle)
      
        #else
        let bundle = Bundle(for: AdaWebHostViewController.self)
        // Loads the resource_bundle if available (Cocoapod)
        if (bundle.path(forResource: "AdaEmbedFramework", ofType: "bundle") != nil){
            let frameworkBundlePath = bundle.path(forResource: "AdaEmbedFramework", ofType: "bundle")!
            let frameworkBundle = Bundle(path: frameworkBundlePath)
            storyboard = UIStoryboard(name: "AdaWebHostViewController", bundle: frameworkBundle)
        } else {
            // Used for if SDK was manually imported
            storyboard = UIStoryboard(name: "AdaWebHostViewController", bundle: bundle)
        }
        #endif

                
        
        guard let viewController = storyboard.instantiateInitialViewController() as? AdaWebHostViewController else { fatalError("This should never, ever happen.") }
        viewController.webView = webView
        return viewController
    }
    
    static func createNavController(with webView: WKWebView) -> UINavigationController {
        let adaWebHostController = createWebController(with: webView)
        let navController = UINavigationController(rootViewController: adaWebHostController)
        
        let doneBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: adaWebHostController, action: #selector(doneButtonTapped(_:)))
        adaWebHostController.navigationItem.setLeftBarButton(doneBarButtonItem, animated: false)
        
        return navController
    }
    
    var webView: WKWebView?
    
    override func loadView() {
        super.loadView()
        view = webView
    }
    
    @objc func doneButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
