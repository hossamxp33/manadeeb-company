//
//  File.swift
//  manadeeb
//
//  Created by hossam ahmed on 12/4/18.
//  Copyright © 2018 hossam ahmed. All rights reserved.
//


import Foundation

struct ObjectProduct: Codable {
    let sort: [ProductModel]
}

struct ProductModel: Codable {
    let id: Int?
    let name, description, price, amount: String?
    let photo: String?
    let company_id: Int?
    let total_result : String?
    let created: String
    let productamount : String?
    
   
}
