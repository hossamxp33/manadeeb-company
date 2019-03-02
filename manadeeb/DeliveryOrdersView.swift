//
//  DeliveryOrdersView.swift
//  manadeeb
//
//  Created by hossam ahmed on 11/26/18.
//  Copyright © 2018 hossam ahmed. All rights reserved.
//




import UIKit


class DeliveryOrdersView: BaseCell  {
    
    var controller : DeliveryOrdersController?
    
    var data : DeliveryOrdersViewModel? {
        
        didSet {
            
            logoImage.loadImageUsingUrlString((data?.client.logo)!)
             namelabel.text = data!.client.name
            PriceLbel.text = "ثمن الطلبية : \(data!.totalResult)"
            waitedMoney.text = "مستحقات سابقة : \(data!.waitedMony)"
            dateLabel.text =  "تاريخ الاستلام : \(data!.orderDate)"
        }
    }
    
    
    var Prsenter  : ManadeebListPrsenterProtocol?
    
    override func setupViews() {
        backgroundColor = UIColor.clear
        addSubview(mainView)
        mainView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mainView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        mainView.widthAnchor.constraint(equalTo: widthAnchor,multiplier : 0.95).isActive = true
        mainView.heightAnchor.constraint(equalTo: heightAnchor,multiplier : 0.9).isActive = true
        
        mainView.addSubview(logoView)
        logoView.topAnchor.constraint(equalTo: mainView.topAnchor,constant : 10).isActive = true
        logoView.rightAnchor.constraint(equalTo: mainView.rightAnchor,constant : -10 ).isActive = true
        logoView.widthAnchor.constraint(equalTo: mainView.widthAnchor,multiplier : 0.23).isActive = true
        logoView.heightAnchor.constraint(equalTo: mainView.heightAnchor,multiplier : 0.6).isActive = true
        
        logoView.addSubview(logoImage)
        logoImage.centerYAnchor.constraint(equalTo: logoView.centerYAnchor).isActive = true
        logoImage.centerXAnchor.constraint(equalTo: logoView.centerXAnchor).isActive = true
        logoImage.widthAnchor.constraint(equalTo: logoView.widthAnchor,multiplier : 0.99).isActive = true
        logoImage.heightAnchor.constraint(equalTo:logoView.heightAnchor,multiplier : 0.99).isActive = true
        
        
        
        mainView.addSubview(dateLabel)
        dateLabel.topAnchor.constraint(equalTo: logoView.bottomAnchor,constant : 10).isActive = true
        dateLabel.rightAnchor.constraint(equalTo: logoView.rightAnchor).isActive = true
        
        mainView.addSubview(namelabel)
        namelabel.topAnchor.constraint(equalTo: mainView.topAnchor,constant : 10).isActive = true
        namelabel.rightAnchor.constraint(equalTo: logoView.leftAnchor,constant : -20).isActive = true
        
        
        mainView.addSubview(mapImage)
        mapImage.topAnchor.constraint(equalTo: mainView.topAnchor,constant : 10).isActive = true
        mapImage.leftAnchor.constraint(equalTo: leftAnchor,constant : 20 ).isActive = true
        mapImage.widthAnchor.constraint(equalTo: mainView.widthAnchor,multiplier : 0.06).isActive = true
        mapImage.heightAnchor.constraint(equalTo: mapImage.widthAnchor  ).isActive = true
        
        mainView.addSubview(callImage)
        callImage.topAnchor.constraint(equalTo: mainView.topAnchor,constant : 10).isActive = true
        callImage.leftAnchor.constraint(equalTo: mapImage.rightAnchor,constant : 10 ).isActive = true
        callImage.widthAnchor.constraint(equalTo: mainView.widthAnchor,multiplier : 0.06).isActive = true
        callImage.heightAnchor.constraint(equalTo: callImage.widthAnchor  ).isActive = true
        
        mainView.addSubview(PriceLbel)
        PriceLbel.topAnchor.constraint(equalTo: namelabel.bottomAnchor,constant : 10).isActive = true
        PriceLbel.rightAnchor.constraint(equalTo: logoView.leftAnchor,constant : -19 ).isActive = true
        
        mainView.addSubview(waitedMoney)
        waitedMoney.topAnchor.constraint(equalTo: namelabel.bottomAnchor,constant : 10).isActive = true
        waitedMoney.rightAnchor.constraint(equalTo: PriceLbel.leftAnchor,constant : -20 ).isActive = true

        mainView.addSubview(ProductBtn)
        ProductBtn.topAnchor.constraint(equalTo: waitedMoney.bottomAnchor,constant : 10).isActive = true
        ProductBtn.leftAnchor.constraint(equalTo: leftAnchor,constant : 20 ).isActive = true
        ProductBtn.widthAnchor.constraint(equalTo: mainView.widthAnchor,multiplier : 0.22).isActive = true
        ProductBtn.heightAnchor.constraint(equalTo: heightAnchor ,multiplier : 0.2).isActive = true
        ProductBtn.isUserInteractionEnabled = false
        
        
        mapImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToDeliveryLocation)))
        mapImage.isUserInteractionEnabled = true
        
        callImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dialNumber)))
        callImage.isUserInteractionEnabled = true
    
    }
    
    
    
    @objc func goToDeliveryLocation()  {
        
      Prsenter?.goToDelivryLocation(lat: data!.client.clientLat, long: data!.client.clientLong)
    }
    
    
    @objc func dialNumber()  {
     controller?.dialNumber(number: data!.client.phone)
    }

    let  mainView :UIView = {
        let ci = UIView()
        ci.backgroundColor = UIColor.white
        ci.translatesAutoresizingMaskIntoConstraints = false
        ci.layer.cornerRadius = 3
        ci.layer.shadowColor = UIColor.black.cgColor
        ci.layer.shadowOffset = CGSize(width: -0.5, height: 1)
        ci.layer.shadowOpacity = 0.1
        ci.layer.shadowRadius = 10
        ci.layer.masksToBounds = false
        ci.clipsToBounds = false
        return ci
        
    }()
    
    
    
    lazy var logoImage:CustomImageView = {
        let ci = CustomImageView(image:#imageLiteral(resourceName: "5dd34a71-bd53-4534-b589-62b8df1eef8a"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
        
    }()
    
    
    
    let  logoView :UIView = {
        let ci = UIView()
        ci.backgroundColor = UIColor.white
        ci.translatesAutoresizingMaskIntoConstraints = false
        ci.layer.cornerRadius = 3
        ci.layer.shadowColor = UIColor.black.cgColor
        ci.layer.shadowOffset = CGSize(width: -0.5, height: 1)
        ci.layer.shadowOpacity = 0.1
        ci.layer.shadowRadius = 10
        ci.layer.masksToBounds = false
        ci.clipsToBounds = false
        return ci
        
    }()
    
    
    
    
    
    let namelabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.black
        var font = UIFont(name: "DroidArabicKufi", size: 13)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("شركة البشري للخدمات البيطرية", comment: "this is name")
        return pl
        
    }()
    
    lazy var mapImage:CustomImageView = {
        let ci = CustomImageView(image:#imageLiteral(resourceName: "location"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
        
    }()
    lazy var callImage:CustomImageView = {
        let ci = CustomImageView(image:#imageLiteral(resourceName: "call"))
        ci.translatesAutoresizingMaskIntoConstraints = false
        return ci
        
    }()
    

 
    
    
    
    let PriceLbel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(111, green: 152, blue: 60)
        var font = UIFont(name: "DroidArabicKufi", size: 11)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("ثمن الطلبية : ٤٠٠", comment: "this is name")
        return pl
        
    }()
    
    
    let waitedMoney :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(111, green: 152, blue: 60)
       var font = UIFont(name: "DroidArabicKufi", size: 11)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("مستحقات سابقة : ٢٣٤ ", comment: "this is name")
        return pl
        
    }()
    
    
    
    let dateLabel :UILabel = {
        let pl = UILabel()
        pl.textColor = UIColor.rgb(220, green: 56, blue: 74)
        var font = UIFont(name: "DroidArabicKufi", size: 12)
        pl.font = font
        pl.translatesAutoresizingMaskIntoConstraints = false
        pl.text = NSLocalizedString("تاريخ التسليم : ١٢/١٢/٢٠١٢ ", comment: "this is name")
        return pl
        
    }()

        var  ProductBtn : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.rgb(104, green: 31, blue: 109)
        button.setTitle(NSLocalizedString("المنتجات", comment: "this is name"),for: .normal)
        button.addTarget(self, action: #selector(goToPtoductPage), for: .touchUpInside)
        button.setTitleColor(UIColor.white, for: UIControlState.normal)  ///// how to give it black color and font
        button.layer.cornerRadius = 7
        var font = UIFont(name: "URWGeometricArabic-Black", size: 14)
        button.titleLabel?.font  = font!
        return button
        
    }()
    
    @objc func goToPtoductPage (){
        
    }
    
    
}

