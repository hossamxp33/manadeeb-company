//
//  d.swift
//  manadeeb
//
//  Created by hossam ahmed on 12/30/18.
//  Copyright © 2018 hossam ahmed. All rights reserved.
//

import Foundation
import UIKit

protocol ChatIntractorProtocol {
    func getchatList (completion : @escaping(ObjectChatList) -> Void)
    func getChatBetween(paramater : [String:String],pageid : Int,completion:@escaping(ObjectChatBetween) -> Void)
    func sendMassage(arr:[String:Any], completion: @escaping([String:AnyObject]) -> Void)

}


class ChatIntractor: ChatIntractorProtocol {
    func getChatBetween(paramater : [String:String],pageid : Int,completion:@escaping(ObjectChatBetween) -> Void ) {
        ApiService.SharedInstance.LoginWithSwift(URL: "chats/chatBTWusers/\(pageid).json", dataarr: paramater) { (data : Data) in
            do {
                var myOrder = try JSONDecoder().decode(ObjectChatBetween.self, from: data)
                DispatchQueue.main.async (execute: {
                    completion(myOrder)
                    print(myOrder)
                })
            }     catch let jsonErr {
                print(jsonErr)
            }
        }
    }

    let defualts = UserDefaults.standard
    func getchatList(completion: @escaping (ObjectChatList) -> Void) {
        ApiService.SharedInstance.fetchFeedForUrl(URL: "messages/mychat/\(defualts.value(forKey: "user_id")!).json") { (data : Data) in

            do {
                var myOrder = try JSONDecoder().decode(ObjectChatList.self, from: data)
                DispatchQueue.main.async (execute: {
                    completion(myOrder)
                })
            }     catch let jsonErr {
                print(jsonErr)
            }
        }
    }
    func sendMassage(arr: [String : Any], completion: @escaping ([String : AnyObject]) -> Void) {
        ApiService.SharedInstance.Login(URL: "chats/add.json", dataarr: arr) { (Data:[String:AnyObject]) in
            DispatchQueue.main.async (execute: {
                completion(Data)

            })
        }
    }

    init() { }
}



