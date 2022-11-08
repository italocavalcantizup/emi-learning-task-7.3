//
//  LivroHomeViewCellCollectionViewCell.swift
//  LearningTask-7.3
//
//  Created by Italo cavalcanti on 07/11/22.
//

import UIKit

protocol DataLivroViewCell {
    var titulo: String { get }
    var imagem: String { get }
}

class LivroHomeViewCell: UICollectionViewCell {
    
    @IBOutlet weak var livroImageView: UIImageView!
    @IBOutlet weak var tituloLivroLabel: UILabel!
    
    var data: DataLivroViewCell? {
        didSet {
            guard let data = data else { return }
            livroImageView.image = UIImage(named: data.imagem)
            tituloLivroLabel.text = data.titulo
        }
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        layoutAttributes.frame.size.height = size.height

        setNeedsLayout()
        return layoutAttributes
    }
    
}
