//
//  ShowVC.swift
//  StarzPlayTask
//
//  Created by Afaq Ahmad on 4/6/22.
//

import UIKit
import AVKit
import PKHUD
import NetworkKit

class ShowVC: UIViewController {
    
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var showName: UILabel!
    @IBOutlet weak var showPoster: UIImageView!
    @IBOutlet weak var gredientView: UIView!
    @IBOutlet weak var yearLable: UILabel!
    @IBOutlet weak var seasonCountLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    // MARK: - Properties
    var presenter: ViewToPresenterShowProtocol?
    var tvShowData: ShowDetails?
    var seasonData: SeasonDetails?
    var firstSeasonDataCheck: Bool = true
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupController()
        setupUI()
        initialSettings()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    deinit {
        tableView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    // MARK: - Helping Methods
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "contentSize"){
            if let newvalue = change?[.newKey]
            {
                let newsize  = newvalue as! CGSize
                tableViewHeightConstraint.constant = newsize.height
            }
        }
    }
    
    func playVideo() {
        
        let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4")!
        
        let player = AVPlayer(url: url)
        
        let vc = AVPlayerViewController()
        vc.player = player
        
        self.present(vc, animated: true) { vc.player?.play() }
        
    }
    
    func initialSettings() {
        if tvShowData == nil {
            presenter?.viewDidLoad(url: .showTV)
        }
    }
    
    // MARK: - Actions
    @objc func refresh() {
        presenter?.refresh()
    }
    
    @IBAction func playTapped(_ sender: UIButton) {
        playVideo()
    }
    
}

extension ShowVC: PresenterToViewTVShowProtocol{
    
    func onFetchShowSuccess(items: ShowDetails) {
        print("View receives the response from Presenter and updates itself.")
        tvShowData = items
        if let showInfo = tvShowData {
            showName.text = showInfo.name
            yearLable.text = showInfo.firstAirDate
            if let seasons = showInfo.numberOfSeasons {
                seasonCountLabel.text = "\(seasons + 1) Seasons"
            }
            
            if let httpsurlString = tvShowData?.posterPath {
                DispatchQueue.main.async {
                    let url = URL(string:  AppConstant.imagePathBasic + httpsurlString)
                    self.showPoster.kf.setImage(with: url)
                }
            }
            self.collectionView.reloadData()
            if seasonData == nil {
                presenter?.viewDidLoadSeason(url: .showSeason(seasonNumber: 0))
            }
        }
    }
    
    func onFetchSeasonSuccess(items: SeasonDetails) {
        print("View receives the response from Presenter and updates itself.")
        seasonData = items
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
        if firstSeasonDataCheck == true {
            let selectedIndex = collectionView.indexPathsForVisibleItems[0]
            collectionView.selectItem(at: selectedIndex, animated: true, scrollPosition: .left)
            firstSeasonDataCheck = false
        }
    }
    
    func onFetchShowFailure(error: String) {
        print("View receives the response from Presenter with error: \(error)")
        self.refreshControl.endRefreshing()
        StarzPlayGeneralElements.showAlertWithMessage("\(error)", sender: nil)
    }
    
    func showHUD() {
        HUD.show(.progress, onView: self.view)
    }
    
    func hideHUD() {
        HUD.hide()
    }
    
}

