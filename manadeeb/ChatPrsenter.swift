//
//  ChatPrsenter.swift
//  manadeeb
//
//  Created by hossam ahmed on 11/28/18.
//  Copyright © 2018 hossam ahmed. All rights reserved.
//

import UIKit

protocol ReportsPsrsenterProtocol {
    
   func goToDelivryReports()
    
    
}

class ReportsPrsenter: ReportsPsrsenterProtocol {
    
    
    
    let interactor: ReportsIntractorProtocol
    let router: ReportsRouterProtocol
    
    init(interactor: ReportsIntractorProtocol, router: ReportsRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    func goToDelivryReports(){
        router.goToDelivryReports()
        
    }

}
