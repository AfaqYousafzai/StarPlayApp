//
//  ImageDataService.swift
//  StarzPlayTask
//
//  Created by Afaq Ahmad on 4/6/22.
//

import UIKit

class ImageDataService {
    
    static let shared = { ImageDataService() }()
    
    func convertToUIImage(from data: Data) -> UIImage {
        return UIImage(data: data)!
    }
}
