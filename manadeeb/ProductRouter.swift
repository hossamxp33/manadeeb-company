//
//  ProductRouter.swift
//  manadeeb
//
//  Created by hossam ahmed on 12/4/18.
//  Copyright © 2018 hossam ahmed. All rights reserved.
//

import UIKit

protocol ProductRouterProtocol {
    
   func confirmOrder(clientid : Int, deliveryid : Int,productData : [ProductViewModel])
    func goToCalender()
     func goToMyOrder()
      func showNotExist()
}

class ProductRouter : ProductRouterProtocol {
    
    let presentingViewController: UIViewController
    var window: UIWindow?
    
    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
 }

    func confirmOrder(clientid : Int, deliveryid : Int,productData : [ProductViewModel]){
        guard let navigationController = presentingViewController.navigationController else {
            return
        }
        let layout = UICollectionViewFlowLayout()
        let featuredAppsController = ConfirmController(collectionViewLayout:layout )
        let interactor: ProductIntractorProtocol = ProductIntractor()
        let router:ProductRouterProtocol = ProductRouter(presentingViewController: featuredAppsController)
        let presenter: ProductPrsenterProtocol  = ProductPrsenter(interactor: interactor, router: router)
        featuredAppsController.prsenter = presenter
        featuredAppsController.clientid  = clientid
        featuredAppsController.deliveryid = deliveryid
        featuredAppsController.productData = productData
        navigationController.pushViewController(featuredAppsController, animated: true)
        
    }


    func goToCalender(){
        
        
        guard let navigationController = presentingViewController.navigationController else {
            return
        }
        
        let featuredAppsController = calendar( )
        let interactor: ManadeebListIntractorProtocol = ManadeebListIntractor()
        let router:ManadeebListRouterProtocol = ManadeebListRouter(presentingViewController: featuredAppsController)
        let presenter: ManadeebListPrsenterProtocol  = ManadeebListPrsenter(interactor: interactor, router: router)
        featuredAppsController.prsenter = presenter
        navigationController.pushViewController(featuredAppsController, animated: true)
        
    }

    func goToMyOrder(){
        guard let navigationController = presentingViewController.navigationController else {
            return
        }
        let layout = UICollectionViewFlowLayout()
        let featuredAppsController = OrdersController(collectionViewLayout:layout )
        let interactor: OrdersIntractorProtocol = OrdersIntractor()
        let router:OrdersRouterProtocol = OrdersRouter(presentingViewController: featuredAppsController)
        let presenter: OrdersPrsenterProtocol  = OrdersPrsenter(interactor: interactor, router: router)
        featuredAppsController.prsenter = presenter
        navigationController.pushViewController(featuredAppsController, animated: true)
        
    }
    
    
    func showNotExist() {
        guard let navigationController = presentingViewController.navigationController else {
            return
        }
        let featuredAppsController = NotExistController( )
        let interactor: ManadeebListIntractorProtocol = ManadeebListIntractor()
        let router:ManadeebListRouterProtocol = ManadeebListRouter(presentingViewController: featuredAppsController)
        let presenter: ManadeebListPrsenterProtocol  = ManadeebListPrsenter(interactor: interactor, router: router)
        featuredAppsController.prsenter = presenter
        navigationController.pushViewController(featuredAppsController, animated: true)
    }
    

}


