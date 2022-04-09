//
//  ShowsRouter.swift
//  StarzPlayTask
//
//  Created by Afaq Ahmad on 4/6/22.
//

import UIKit

class ShowsRouter: PresenterToRouterShowProtocol {
    
    
    // MARK: Static methods
    static func createModule() -> UINavigationController {
        
        print("BooksRouter creates the Books module.")
        let viewController = ShowVC()
        let navigationController = UINavigationController(rootViewController: viewController)
        return navigationController
    }
    
}
