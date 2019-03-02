//
//  ClientOrderViewModel.swift
//  manadeeb
//
//  Created by hossam ahmed on 12/8/18.
//  Copyright © 2018 hossam ahmed. All rights reserved.
//

import Foundation

struct ClientOrderViewModel {
    let id: Int?
    let orderDate: String
    let clientID, deliveryID: Int
    let total: String

    let orderDetails: [OrderDetail]
    let delivry: Delivry
   let name : String?
    init(ClientOrders : ClientOrdersModel) {
        self.id = ClientOrders.id
        if ClientOrders.orderDate != "" {
        self.orderDate = ClientOrders.orderDate!
        }else {
       self.orderDate =  "لم يحدد"
        }
        self.clientID = ClientOrders.clientID!
        self.deliveryID = ClientOrders.deliveryID!
        if  ClientOrders.total != ""{
        self.total = ClientOrders.total!
        }else {
        self.total = "0"
         }
        self.orderDetails = ClientOrders.orderDetails
        self.delivry = ClientOrders.delivry
        self.name = ClientOrders.client.name
    }
}



