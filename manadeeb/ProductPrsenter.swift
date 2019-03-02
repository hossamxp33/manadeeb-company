//
//  ProductPrsenter.swift
//  manadeeb
//
//  Created by hossam ahmed on 12/4/18.
//  Copyright © 2018 hossam ahmed. All rights reserved.
//

import UIKit

protocol ProductPrsenterProtocol {
    
 
  func getProductDetails (completion : @escaping([ProductViewModel]) -> Void)
  func confirmOrder(clientid: Int, deliveryid: Int,productData : [ProductViewModel])
   func makeOrder (data : [[String : Any]],completion : @escaping([String:AnyObject]) -> Void)
   func goToCalender()
    func goToMyOrder()
      func showNotExist()
}

class ProductPrsenter: ProductPrsenterProtocol {
  
    
    
    
    let interactor: ProductIntractorProtocol
    let router: ProductRouterProtocol
    
    init(interactor: ProductIntractorProtocol, router: ProductRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

    func getProductDetails(completion: @escaping ([ProductViewModel]) -> Void) {
        interactor.getProductDetails { (product) in
        completion(self.createProductPageViewModels(from: product))
        }
    }
    
    func makeOrder (data : [[String : Any]],completion : @escaping([String:AnyObject]) -> Void){
        
        interactor.makeOrder(data: data) { (data) in
            completion(data)
        }
        
    }
    
    func goToCalender(){
        
        router.goToCalender()
    }
  
    func goToMyOrder(){
        router.goToMyOrder()
    }
    
    func confirmOrder(clientid: Int, deliveryid: Int,productData : [ProductViewModel]){
        router.confirmOrder(clientid: clientid, deliveryid: deliveryid, productData: productData)
    }
    
    private func createProductPageViewModels(from myOrder :ObjectProduct) -> [ProductViewModel] {
        return myOrder.sort.map({return ProductViewModel(product : $0)}) ?? []
        
    }
    func showNotExist(){
        router.showNotExist()
        
    }
    
    
}
