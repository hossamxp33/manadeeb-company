//
//  aa.swift
//  manadeeb
//
//  Created by hossam ahmed on 1/27/19.
//  Copyright © 2019 hossam ahmed. All rights reserved.
//

import Foundation
import UIKit

class TestController  : UIViewController {
    
    // Gesture recognizer, will be added to image below.
    var swipedOnImage = UIPanGestureRecognizer()
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    // This is the view controller that will be dragged with the image. In my case it's a UITableViewController.
 
  //  var vc = self.delegate.vc
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(MainImage)
        MainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor ).isActive = true
        MainImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        MainImage.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        MainImage.heightAnchor.constraint(equalTo:view.heightAnchor).isActive = true
        
        swipedOnImage = UIPanGestureRecognizer(target: self, action: #selector(self.swipedOnViewAction))
        imageView.addGestureRecognizer(swipedOnImage)
        imageView.isUserInteractionEnabled = true
        
        self.delegate.vc.view.frame = CGRect(x: 0, y: 400, width: self.view.frame.width, height: self.view.frame.height)
        self.addChildViewController(self.delegate.vc)
        self.view.addSubview(self.delegate.vc.view)
        self.delegate.vc.didMove(toParentViewController: self)
    
        view.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: self.delegate.vc.view.centerXAnchor ).isActive = true
        imageView.topAnchor.constraint(equalTo: self.delegate.vc.view.topAnchor,constant : 20).isActive = true
        imageView.widthAnchor.constraint(equalToConstant : 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant :20).isActive = true
    }
    
    @objc func swipedOnViewAction(){
        
        let yLocationTouched = swipedOnImage.location(in: self.view).y
        imageView.frame.origin.y = yLocationTouched
        // These values can be played around with if required.
        self.delegate.vc.view.frame =  CGRect(x: 0, y: yLocationTouched, width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height) - (yLocationTouched))
        self.delegate.vc.view.frame.origin.y = yLocationTouched + 50
    
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.2, animations: {
            self.tabBarController?.tabBar.isHidden = true
        })
    }
    /////////  view for logo image
    let  imageView : UIImageView = {
        let ci = UIImageView(image:#imageLiteral(resourceName: "41393510_381842899017264_6044721716666564608_n"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
    }()
    
    let  MainImage  : UIView = {
        let ci = UIView()
        ci.backgroundColor = UIColor.white
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
    }()
    
}
