//
//  ClientOredersController.swift
//  manadeeb
//
//  Created by hossam ahmed on 11/28/18.
//  Copyright © 2018 hossam ahmed. All rights reserved.
//


import UIKit
class ClientOredersController : UICollectionViewController , UICollectionViewDelegateFlowLayout {
    
    var cell = "cell"
    var prsenter : ClientPrsenterProtocol?
    var clientId : Int?
    
    var data = [ClientOrderViewModel]()
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
     
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cell, for: indexPath) as! ClientOredersView
       
        cell.data = data [indexPath.item]
        cell.controller = self
        cell.prsenter = prsenter
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if data[indexPath.item].orderDetails.count > 0 {
            prsenter?.showProductPage(viewModel: data[indexPath.item])
        } else{
            prsenter?.showNotExist()

        }
    }

    //////// give to colletionview how many image  in every cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:collectionView.frame.width , height: collectionView.frame.height * 0.18)
    }
    
    
    
    func goToDeliveryLocation(){
        let hospitalControll = DeliveryLocation()
        self.navigationController?.pushViewController(hospitalControll, animated: true)
    
    }
    
    
    
    
    func dialNumber(number : String) {
        
        if let url = URL(string: "tel://\(number)"),
            UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler:nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        } else {
            // add error message here
        }
    }
    
    override func viewDidLoad() {
        prsenter?.getClientOrders(clientid: clientId! , completion: { (vieModel) in
            if vieModel.count > 0 {
            self.data = vieModel
            self.collectionView?.reloadData()
            let orderNumber = UIBarButtonItem(title: "\(self.data.count) طلبات", style: .plain, target: self, action: nil)
            self.navigationItem.rightBarButtonItem = orderNumber
            var titleLabel = UILabel()
            titleLabel = UILabel(frame: CGRect(x:self.view.frame.width/2, y: 20, width:0, height: self.view.frame.height))
            titleLabel.text = NSLocalizedString("\(self.data[0].name!)", comment: "this is name")
            titleLabel.textColor = UIColor.white
            var font = UIFont(name: "DroidArabicKufi", size: 14)
            titleLabel.font = font
            titleLabel.textAlignment = .left
            self.navigationItem.titleView = titleLabel
            }else{
            self.mainView.isHidden = false
            }
        
        })
        
        collectionView?.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        collectionView?.backgroundColor = UIColor.rgb(230, green: 234, blue: 237)
        collectionView?.register(ClientOredersView.self, forCellWithReuseIdentifier: cell)
        
        collectionView?.isScrollEnabled = true
        navigationController?.navigationBar.barTintColor = UIColor.rgb(104, green: 31, blue: 109)
        view.addSubview(mainView)
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mainView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        mainView.isHidden = true
        
        mainView.addSubview(firstImage)
        firstImage.centerYAnchor.constraint(equalTo: mainView.centerYAnchor,constant : -50).isActive = true
        firstImage.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        firstImage.widthAnchor.constraint(equalTo: mainView.widthAnchor,multiplier : 0.35).isActive = true
        firstImage.heightAnchor.constraint(equalTo: mainView.heightAnchor ,multiplier : 0.2).isActive = true
        
        mainView.addSubview(firstlabel)
        firstlabel.topAnchor.constraint(equalTo: firstImage.bottomAnchor,constant : 20).isActive = true
        firstlabel.centerXAnchor.constraint(equalTo: firstImage.centerXAnchor).isActive = true
        
        
        
    }
    
    let mainView :UIView = {
        let ci = UIView()
        ci.backgroundColor = UIColor.rgb(230, green: 234, blue: 237)
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
    }()
    
    let firstImage:CustomImageView = {
        let ci = CustomImageView(image:#imageLiteral(resourceName: "Bitmap"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
    }()
    let firstlabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.black
        var font = UIFont(name: "DroidArabicKufi", size: 14)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("عفوا لا يوجد", comment: "this is name")
        return pl
        
    }()
    

}



