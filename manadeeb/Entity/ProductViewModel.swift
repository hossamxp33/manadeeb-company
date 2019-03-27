//
//  File.swift
//  manadeeb
//
//  Created by hossam ahmed on 12/4/18.
//  Copyright © 2018 hossam ahmed. All rights reserved.
//

import Foundation
struct ProductViewModel {
    let id: Int?
    let name, description, price, amount: String?
    let photo: String?
    let company_id: Int?
    let created: String?
    let total_result : String
    let productamount : String?
    var insertamount : String?
    
    init(product : ProductModel) {
        
        self.id = product.id
        self.name = product.name
        self.description = product.description
        self.price = product.price
        self.amount = product.amount
        self.company_id = product.company_id
        self.photo = product.photo
        self.created = product.created
        if product.total_result != nil{
        self.total_result = product.total_result!
        }else{
        self.total_result = "0"
        }
        self.productamount = product.productamount
    }
    mutating func inamount(s:String)-> ProductViewModel{
    self.insertamount = s
    return self
    }
}
