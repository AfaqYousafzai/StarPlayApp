//
//  ShowContract.swift
//  StarzPlayTask
//
//  Created by Afaq Ahmad on 4/6/22.
//

import UIKit
import NetworkKit

// MARK: View Output (Presenter -> View)
protocol PresenterToViewTVShowProtocol: AnyObject {
    func onFetchShowSuccess(items: ShowDetails)
    func onFetchShowFailure(error: String)
    
    func onFetchSeasonSuccess(items: SeasonDetails)
    
    func showHUD()
    func hideHUD()
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterShowProtocol: AnyObject {
    
    var view: PresenterToViewTVShowProtocol? { get set }
    var interactor: PresenterToInteractorShowProtocol? { get set }
    var router: PresenterToRouterShowProtocol? { get set }
    
    func numberOfRowsInSection() -> Int

    func viewDidLoad(url: makeURL)
    
    func viewDidLoadSeason(url: makeURL)
    
    func refresh()
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorShowProtocol: AnyObject {
    
    var presenter: InteractorToPresenterShowProtocol? { get set }
    
    func loadShow(url: makeURL)
    func loadSeason(url: makeURL)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterShowProtocol: AnyObject {
    
    func fetchShowSuccess(items: ShowDetails)
    func fetchShowFailure(errorCode: Int)
    
    func fetchSeasonSuccess(items: SeasonDetails)
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterShowProtocol: AnyObject {
    
    static func createModule() -> UINavigationController
}
