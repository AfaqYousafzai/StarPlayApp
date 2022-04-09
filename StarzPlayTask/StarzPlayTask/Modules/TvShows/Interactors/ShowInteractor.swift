//
//  ShowInteractor.swift
//  StarzPlayTask
//
//  Created by Afaq Ahmad on 4/6/22.
//

import Foundation
import NetworkKit

class ShowInteractor: PresenterToInteractorShowProtocol {
    
    // MARK: Properties
    weak var presenter: InteractorToPresenterShowProtocol?
    var items: ShowDetails?
    var seasonDetails: SeasonDetails?
    
    func loadShow(url: makeURL) {
        print("Interactor receives the request from Presenter to load quotes from the server.")
        
        WebServiceHandler.callWebService(url: url, request: ShowRequest()){ response, error, code in
            
            if let _ = error{
                self.presenter?.fetchShowFailure(errorCode: code)
            }
            
            guard let data = response else{
                return
            }
            do
            {
                
                let responseDetails = try JSONDecoder().decode(ShowDetails.self, from: data)
                self.items = responseDetails
                
                if code == 200 {
                    if let itemsData = self.items {
                        self.presenter?.fetchShowSuccess(items: itemsData)
                    }
                }
                else {
                    self.presenter?.fetchShowFailure(errorCode: code)
                }
            }
            catch let err {
                print(err.localizedDescription)
                self.items = nil
                self.presenter?.fetchShowFailure(errorCode: code)
            }
            
            
        }
        
    }
    
    func loadSeason(url: makeURL) {
        print("Interactor receives the request from Presenter to load quotes from the server.")
        
        WebServiceHandler.callWebService(url: url, request: ShowRequest()){ response, error, code in
            
            if let _ = error{
                self.presenter?.fetchShowFailure(errorCode: code)
            }
            
            guard let data = response else{
                return
            }
            do
            {
                
                let responseDetails = try JSONDecoder().decode(SeasonDetails.self, from: data)
                self.seasonDetails = responseDetails
                
                if code == 200 {
                    if let itemsData = self.seasonDetails {
                        self.presenter?.fetchSeasonSuccess(items: itemsData)
                    }
                }
                else {
                    self.presenter?.fetchShowFailure(errorCode: code)
                }
            }
            catch let err {
                print(err.localizedDescription)
                self.items = nil
                self.presenter?.fetchShowFailure(errorCode: code)
            }
            
            
        }
        
    }
    
}
