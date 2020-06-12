//
//  LocationIntroCell.swift
//  Coastlines
//
//  Created by Ahad Islam on 6/1/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class LocationIntroCell: UICollectionViewCell {
    private lazy var label: UILabel = {
        let l = UILabel()
        l.text = "Swipe left\n to view locations"
        l.textAlignment = .right
        l.font = .preferredFont(forTextStyle: .largeTitle)
        l.numberOfLines = 2
        l.alpha = 0
        return l
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = PaletteColour.offWhite.colour
        setupLabel()
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2.0
        layer.cornerRadius = 8
        animateLabel()
    }
    
    private func animateLabel() {
        UIView.animate(withDuration: 2, delay: 0, options: [.transitionCrossDissolve], animations: {
            self.label.alpha = 1
        }, completion: nil)
    }
    
    private func setupLabel() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            label.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -8)])
    }
}
