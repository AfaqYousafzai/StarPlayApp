//
//  SeasonCollectionViewCell.swift
//  StarzPlayTask
//
//  Created by Afaq Ahmad on 4/6/22.
//

import UIKit

class SeasonCollectionViewCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet{
            seasonLabel.textColor = isSelected ? .white : UIColor("646986")
            separatorView.isHidden = isSelected ? false : true
            
        }
    }
    
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var separatorView: UIView!
    
}

extension UIColor {
  
  convenience init(_ hex: String, alpha: CGFloat = 1.0) {
    var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if cString.hasPrefix("#") { cString.removeFirst() }
    
    if cString.count != 6 {
      self.init("ff0000") // return red color for wrong hex input
      return
    }
    
    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: alpha)
  }

}
