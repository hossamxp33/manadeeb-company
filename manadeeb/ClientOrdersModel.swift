//
//  ClientOrdersModel.swift
//  manadeeb
//
//  Created by hossam ahmed on 12/8/18.
//  Copyright © 2018 hossam ahmed. All rights reserved.
//

import Foundation

struct OblectClientOrders: Codable {
    let data: [ClientOrdersModel]
}

struct ClientOrdersModel: Codable {
    let id: Int?
    let orderDate: String?
    let clientID, deliveryID: Int?
    let total: String?
    let orderDetails: [OrderDetail]
    let delivry: Delivry
    let client: Client
    
    enum CodingKeys: String, CodingKey {
        case id
        case orderDate = "order_date"
        case clientID = "client_id"
        case deliveryID = "delivery_id"
        case total
        case orderDetails = "order_details"
        case delivry, client
    }
}
