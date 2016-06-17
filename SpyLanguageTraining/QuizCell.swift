//
//  QuizCell.swift
//  SpyLanguageTraining
//
//  Created by yunchiri on 2016. 5. 25..
//  Copyright © 2016년 youngchill. All rights reserved.
//

import UIKit
import TisprCardStack
import ChameleonFramework

class QuizCell: TisprCardStackViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 12
        clipsToBounds = false
        
        self.contentView.backgroundColor = FlatRed()
        
    }
    
    override internal func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes) {
        super.applyLayoutAttributes(layoutAttributes)
//        updateSmileVote()
    }
    
}
