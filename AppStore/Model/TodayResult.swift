//
//  TodayResult.swift
//  AppStore
//
//  Created by Olexsii Levchenko on 4/29/22.
//

import UIKit

struct TodayResult {
    
    let categoty: String
    let title: String
    let image: UIImage
    let description: String
    let backgroundColor: UIColor
    
    //enum
    let cellType: CellType
    
    var app: [FeedResult]
    
    enum CellType: String {
        case single, multiple
    }
}
