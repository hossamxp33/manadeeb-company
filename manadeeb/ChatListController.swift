//
//  ManadeebList.swift
//  manadeeb
//
//  Created by hossam ahmed on 11/24/18.
//  Copyright © 2018 hossam ahmed. All rights reserved.
//

import UIKit

class ChatListController  : UICollectionViewController , UICollectionViewDelegateFlowLayout {
    
    var cell = "cell"
    var prsenter : ChatPresenterProtocol?
    var data = [ChatViewModel]()
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cell, for: indexPath) as! ChatListView
        if data.count > 0{
            cell.data = data[indexPath.item]
        }
        
        cell.prsenter = prsenter
        cell.controller = self
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if data[indexPath.item].users2 != nil {
            prsenter?.goToChatpage(presentingViewController: self, data: (data[indexPath.item].users2?.delivries![0])!,roomid: (data[indexPath.item].chats2?.roomID)!,userid: (data[indexPath.item].users2?.id)!)
        } else {
            prsenter?.goToChatpage(presentingViewController: self,data:(data[indexPath.item].users1?.delivries![0])!,roomid: (data[indexPath.item].chats2?.roomID)!,userid: (data[indexPath.item].users1!.id)!)

        }
    }
    
    //////// give to colletionview how many image  in every cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width:collectionView.frame.width , height: collectionView.frame.height * 0.15)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.2, animations: {
            self.tabBarController?.tabBar.isHidden = false
        })
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
        self.prsenter  = ChatRouter.createModule()
        
        prsenter?.getchatList(completion: { (data) in
        if data.count > 0 {
        self.data = data
        self.collectionView?.reloadData()

        }else{
            self.mainView.isHidden = false

            }
        })

        collectionView?.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        collectionView?.backgroundColor = UIColor.rgb(230, green: 234, blue: 237)
        navigationController?.navigationBar.barTintColor = UIColor.rgb(48, green: 39, blue: 133)
        collectionView?.register(ChatListView.self, forCellWithReuseIdentifier: cell)
        collectionView?.isScrollEnabled = true
     
        
        var titleLabel = UILabel()
        titleLabel = UILabel(frame: CGRect(x:view.frame.width/2, y: 20, width:0, height: view.frame.height))
        titleLabel.text = NSLocalizedString("المحادثات", comment: "this is name")
        titleLabel.textColor = UIColor.white
        var font = UIFont(name: "DroidArabicKufi", size: 16)
        titleLabel.font = font
        titleLabel.textAlignment = .left
        navigationItem.titleView = titleLabel
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

