//
//  ShowVCExtensions.swift
//  StarzPlayTask
//
//  Created by Afaq Ahmad on 4/9/22.
//

import UIKit

// MARK: - UITableView Delegate & Data Source

extension ShowVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tvShowData?.seasons?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: SeasonCollectionViewCell.self), for: indexPath) as? SeasonCollectionViewCell else {
            preconditionFailure()
        }
        cell.seasonLabel.text = "Season \(indexPath.item + 1)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.viewDidLoadSeason(url: .showSeason(seasonNumber: indexPath.item))
    }
}

extension ShowVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 100, height: 40)
    }
}

extension ShowVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        seasonData?.episodes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EpisodeTableViewCell.self), for: indexPath) as? EpisodeTableViewCell else {
            preconditionFailure()
        }
        if let episode = seasonData?.episodes?[indexPath.item] {
            cell.set(content: episode)
        }
        return cell
    }
}

extension ShowVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}


// MARK: - UI Setup
extension ShowVC {
    func setupUI() {
        tableView.addSubview(refreshControl)
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor.clear.cgColor
        let colorBottom = UIColor.black.cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.gredientView.bounds
        
        self.gredientView.layer.insertSublayer(gradientLayer, at:0)
    }
    
    func setupController() {
        
        let presenter: ViewToPresenterShowProtocol & InteractorToPresenterShowProtocol = ShowPresenter()
        
        self.presenter = presenter
        self.presenter?.router = ShowsRouter()
        self.presenter?.view = self
        self.presenter?.interactor = ShowInteractor()
        self.presenter?.interactor?.presenter = presenter
    }
}
