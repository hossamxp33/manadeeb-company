//
//  LoginPrsenter.swift
//  Lord
//
//  Created by hossam ahmed on 12/19/18.
//  Copyright © 2018 hazem. All rights reserved.
//




import UIKit
protocol ChatPresenterProtocol {

    func getChatBetween(paramater : [String:String],pageid : Int,completion:@escaping([ChatBetwwenViewModel]) -> Void )
    func sendMassage(arr:[String:Any], completion: @escaping([String:AnyObject]) -> Void)
    func goToDelivryLocation(lat : String,long : String )

}


class ChatPresenter : ChatPresenterProtocol {

    let interactor: ChatIntractorProtocol
    let router: ChatRouterProtocol


    init( interactor: ChatIntractorProtocol, router: ChatRouterProtocol ) {
        self.interactor = interactor
        self.router = router
    }

    func getChatBetween(paramater : [String:String],pageid : Int,completion:@escaping([ChatBetwwenViewModel]) -> Void ){
        interactor.getChatBetween(paramater: paramater, pageid: pageid) { (data) in
            completion(self.creatChatPage(from: data))
        }
    }
    //////
    func goToDelivryLocation(lat : String,long : String ){
        router.goToDelivryLocation(lat : lat,long : long )
    }
    func sendMassage(arr:[String:Any], completion: @escaping([String:AnyObject]) -> Void){

        interactor.sendMassage(arr: arr) { (data) in
            DispatchQueue.main.async (execute: {
                completion(data)

            })
        }
    }

    ///////
    private func creatChatPage(from myOrder :ObjectChatBetween) -> [ChatBetwwenViewModel] {
        return myOrder.data.map({return ChatBetwwenViewModel(chatPAge  : $0)}) ?? []
    }

    private func createManadeebListViewModels(from myOrder :ObjectManadeebList) -> [ManadeebListViewModel] {
        return myOrder.sort.map({return ManadeebListViewModel(ManadeebList : $0)}) ?? []
    }
}



