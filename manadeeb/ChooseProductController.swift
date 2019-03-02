//
//  ChooseProductController.swift
//  manadeeb
//
//  Created by hossam ahmed on 12/3/18.
//  Copyright © 2018 hossam ahmed. All rights reserved.
//

import UIKit


class ChooseProductController : MainProductController {
    
    
   var clientid : Int?
    var deliveryid : Int?
    var productData = [ProductViewModel]()
    
   
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cell, for: indexPath) as! ChooseProductView
        cell.data = data[indexPath.item]
        cell.controller = self
        return cell
     }


    
    
    override func viewWillAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.2, animations: {
            self.tabBarController?.tabBar.isHidden = true
        })
    }
   
    @objc func notExistProduct (){
        
        
        let errorAlert = UIAlertController(title: "عفوا !", message: "المنتج غير متوفر الان ", preferredStyle: .alert)
        let okayBtn = UIAlertAction(title: "Okay", style: .default, handler: { (action) in
            errorAlert.dismiss(animated: true, completion: nil)
        })
        errorAlert.addAction(okayBtn)
        self.present(errorAlert, animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        collectionView?.backgroundColor = UIColor.rgb(230, green: 234, blue: 237)
        navigationController?.navigationBar.barTintColor = UIColor.rgb(48, green: 39, blue: 133)
        collectionView?.register(ChooseProductView.self, forCellWithReuseIdentifier: cell)

        view.addSubview(ProductBtn)
        ProductBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant : -15).isActive = true
        ProductBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ProductBtn.widthAnchor.constraint(equalTo: view.widthAnchor,multiplier : 0.5).isActive = true
        ProductBtn.heightAnchor.constraint(equalTo:view.heightAnchor,multiplier : 0.06).isActive = true
        
        
        collectionView?.isScrollEnabled = true
        var titleLabel = UILabel()
        titleLabel = UILabel(frame: CGRect(x:view.frame.width/2, y: 20, width:0, height: view.frame.height))
        titleLabel.text = NSLocalizedString("اختر المنتجات", comment: "this is name")
        titleLabel.textColor = UIColor.white
        var font = UIFont(name: "DroidArabicKufi", size: 16)
        titleLabel.font = font
        titleLabel.textAlignment = .left
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.barTintColor = UIColor.rgb(104, green: 31, blue: 109)
        
    }
    
    lazy var  ProductBtn : UIButton = {
        let button = UIButton()
       button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.rgb(104, green: 31, blue: 109)
        button.frame = CGRect(x:0,y:view.frame.size.height - (((collectionView?.frame.height)!  * 0.08) * 2),width:view.frame.size.width,height:(collectionView?.frame.height)!  * 0.08)
        button.setTitle(NSLocalizedString(" تاكيد الطلب", comment: "this is name"),for: .normal)
        button.addTarget(self, action: #selector(goToPtoductPage), for: .touchUpInside)
        button.setTitleColor(UIColor.white, for: UIControlState.normal)  ///// how to give it black color and font
        button.layer.cornerRadius = 7
        var font = UIFont(name: "URWGeometricArabic-Black", size: 12)
        button.titleLabel?.font  = font!
        return button
        
    }()
    
    
    
    @objc func goToPtoductPage (){
        if productData.count > 0 {
            prsenter?.confirmOrder(clientid: clientid!, deliveryid: deliveryid!, productData: productData)
        
        }else{
           
            let errorAlert = UIAlertController(title: "عفوا !", message: "اختر منتج اولا", preferredStyle: .alert)
            let okayBtn = UIAlertAction(title: "Okay", style: .default, handler: { (action) in
                errorAlert.dismiss(animated: true, completion: nil)
            })
            errorAlert.addAction(okayBtn)
            self.present(errorAlert, animated: true, completion: nil)
            
        }
        
    }
}
