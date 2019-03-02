//
//  ChatRouter.swift
//  manadeeb
//
//  Created by hossam ahmed on 11/28/18.
//  Copyright © 2018 hossam ahmed. All rights reserved.
//


import UIKit

protocol ReportsRouterProtocol {
    
func goToDelivryReports()

}

class ReportsRouter : ReportsRouterProtocol {
  
    
    
    let presentingViewController: UIViewController
    var window: UIWindow?
    
    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
    }
 
    

    func goToDelivryReports() {
        guard let navigationController = presentingViewController.navigationController else {
            return
        }
        let layout = UICollectionViewFlowLayout()
        let featuredAppsController = DeliveryReportControll(collectionViewLayout:layout )
        let interactor: ManadeebListIntractorProtocol = ManadeebListIntractor()
        let router:ManadeebListRouterProtocol = ManadeebListRouter(presentingViewController: featuredAppsController)
        let presenter: ManadeebListPrsenterProtocol = ManadeebListPrsenter(interactor: interactor, router: router)
        featuredAppsController.presenter = presenter
        navigationController.pushViewController(featuredAppsController, animated: true)
    }
    
  
    
    
    
}
