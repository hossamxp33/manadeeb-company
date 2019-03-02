//
//  DeliveryOrdersController.swift
//  manadeeb
//
//  Created by hossam ahmed on 11/26/18.
//  Copyright © 2018 hossam ahmed. All rights reserved.
//


import UIKit


class ChooseClientController : ClientController {
    

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cell, for: indexPath) as! ChooseClientView
        cell.data = data[indexPath.item]
        cell.prsenter = prsenter
        cell.controller = self
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        prsenter?.goToChooseDelivetyPage(clientid: data[indexPath.item].id!)
        
    }
    
    
    
    override func viewDidLoad() {
       super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = UIColor.rgb(48, green: 39, blue: 133)
        collectionView?.register(ChooseClientView.self, forCellWithReuseIdentifier: cell)
        
        collectionView?.isScrollEnabled = true
        var titleLabel = UILabel()
        titleLabel = UILabel(frame: CGRect(x:view.frame.width/2, y: 20, width:0, height: view.frame.height))
        titleLabel.text = NSLocalizedString("اختر العميل", comment: "this is name")
        titleLabel.textColor = UIColor.white
        var font = UIFont(name: "DroidArabicKufi", size: 16)
        titleLabel.font = font
        titleLabel.textAlignment = .left
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.barTintColor = UIColor.rgb(104, green: 31, blue: 109)
        
    }
    
    
}



