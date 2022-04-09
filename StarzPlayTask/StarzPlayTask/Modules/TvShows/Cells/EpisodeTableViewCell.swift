//
//  EpisodeTableViewCell.swift
//  StarzPlayTask
//
//  Created by Afaq Ahmad on 4/6/22.
//

import UIKit
import NetworkKit

class EpisodeTableViewCell: UITableViewCell {
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var forwardIcon: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func set(content: Episodes) {
        seasonLabel.text = content.name
        if let httpsurlString = content.still_path {
            DispatchQueue.main.async {
                let url = URL(string:  AppConstant.imagePathBasic + httpsurlString)
                self.cover.kf.setImage(with: url)
            }
        }
        
    }
}
