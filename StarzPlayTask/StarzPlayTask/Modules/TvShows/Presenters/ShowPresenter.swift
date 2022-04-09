//
//  ShowPresenter.swift
//  StarzPlayTask
//
//  Created by Afaq Ahmad on 4/6/22.
//

import Foundation
import NetworkKit

class ShowPresenter: ViewToPresenterShowProtocol {
    
    // MARK: Properties
    weak var view: PresenterToViewTVShowProtocol?
    var interactor: PresenterToInteractorShowProtocol?
    var router: PresenterToRouterShowProtocol?
    
    var counter : Int?
    
    // MARK: Inputs from view
    func viewDidLoad(url: makeURL) {
        print("Presenter is being notified that the View was loaded.")
        view?.showHUD()
        interactor?.loadShow(url: url)
    }
    
    func viewDidLoadSeason(url: makeURL) {
        print("Presenter is being notified that the View was loaded.")
        view?.showHUD()
        interactor?.loadSeason(url: url)
    }
    
    func refresh() {
        print("Presenter is being notified that the View was refreshed.")
        //interactor?.loadShow()
    }
    
    func numberOfRowsInSection() -> Int {
        guard let countItems = self.counter else {
            return 0
        }
        
        return countItems
    }
    
}

// MARK: - Outputs to view
extension ShowPresenter: InteractorToPresenterShowProtocol {
    
    func fetchShowSuccess(items: ShowDetails) {
        print("Presenter receives the result from Interactor after it's done its job.")
        counter = items.seasons?.count
        view?.hideHUD()
        view?.onFetchShowSuccess(items: items)
    }
    
    func fetchSeasonSuccess(items: SeasonDetails) {
        print("Presenter receives the result from Interactor after it's done its job.")
        view?.hideHUD()
        view?.onFetchSeasonSuccess(items: items)
    }
    
    func fetchShowFailure(errorCode: Int) {
        print("Presenter receives the result from Interactor after it's done its job.")
        view?.hideHUD()
        view?.onFetchShowFailure(error: "Couldn't fetch quotes: \(errorCode)")
    }
    
    
}
