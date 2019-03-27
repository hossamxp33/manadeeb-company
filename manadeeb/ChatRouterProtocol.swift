//
//  LoginRouter.swift
//  Parshot
//
//  Created by hossam ahmed on 10/29/18.
//  Copyright © 2018 hazem. All rights reserved.
//

import UIKit
import Foundation

protocol ChatRouterProtocol {
      func goToDelivryLocation(lat:Double,long : Double )
    func goToChatpage(presentingViewController: UIViewController ,data:Delivry,roomid: String , userid  : Int)

}

class ChatRouter: ChatRouterProtocol {


    let presentingViewController: UIViewController
    var window: UIWindow?

    init(presentingViewController: UIViewController) {
        self.presentingViewController = presentingViewController
    }

    static func createModule() -> ChatPresenterProtocol {

        let featuredAppsController = LoginController()
        let interactor: ChatIntractorProtocol = ChatIntractor()
        let router:ChatRouterProtocol = ChatRouter(presentingViewController: featuredAppsController)
        let presenter: ChatPresenterProtocol  = ChatPresenter(interactor: interactor, router: router)
        return presenter

    }
    func goToChatpage(presentingViewController: UIViewController,data:Delivry,roomid : String , userid  : Int){

        guard let navigationController = presentingViewController.navigationController else {
            return
        }

        let layout = UICollectionViewFlowLayout()
        let featuredAppsController = ChatPageController(collectionViewLayout:layout )
        let interactor: ChatIntractorProtocol = ChatIntractor()
        let router:ChatRouterProtocol = ChatRouter(presentingViewController: featuredAppsController)
        let presenter: ChatPresenterProtocol  = ChatPresenter(interactor: interactor, router: router)
        featuredAppsController.prsenter = presenter
        featuredAppsController.roomid = roomid
        featuredAppsController.userid = userid
        featuredAppsController.data = [data]

        navigationController.pushViewController(featuredAppsController, animated: true)

    }
    func goToDelivryLocation(lat : Double,long : Double ) {
        guard let navigationController = presentingViewController.navigationController else {
            return
        }
        let featuredAppsController = DeliveryLocation( )
        let interactor: ReportsIntractorProtocol = ReportsIntractor()
        let router:ReportsRouterProtocol = ReportsRouter(presentingViewController: featuredAppsController)
        let presenter: ReportsPsrsenterProtocol = ReportsPrsenter(interactor: interactor, router: router)
        featuredAppsController.prsenter = presenter
        featuredAppsController.Delivery_lat = lat
        featuredAppsController.Delivery_long = long
        navigationController.pushViewController(featuredAppsController, animated: true)
    }

}




