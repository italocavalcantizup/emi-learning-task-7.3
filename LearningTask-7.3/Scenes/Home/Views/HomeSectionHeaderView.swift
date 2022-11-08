//
//  HomeSectionHeaderView.swift
//  LearningTask-7.3
//
//  Created by Italo cavalcanti on 07/11/22.
//

import UIKit

class HomeSectionHeaderView: UICollectionReusableView {
        
    @IBOutlet weak var tituloLabel: UILabel!
    
    var titulo: String? {
        didSet {
            guard let titulo = titulo else { return }
            tituloLabel.text = titulo
        }
    }
}
