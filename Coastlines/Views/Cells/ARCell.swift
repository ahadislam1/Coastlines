//
//  ARCell.swift
//  Coastlines
//
//  Created by Kelby Mittan on 6/7/20.
//  Copyright © 2020 Ahad Islam. All rights reserved.
//

import UIKit

class ARCell: UICollectionViewCell {
    var index: IndexPath?
    var cellDelegate: PrevNextButton?
    
    public lazy var prevButton: UIButton = {
        let button = UIButton()
        return button.previousButton()
    }()
    
    public lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Experience AR"
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .title1)
        label.numberOfLines = 1
        label.alpha = 1
        return label
    }()
    
    public lazy var arIconImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "ar5")
        return iv
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = PaletteColour.lightBlue.colour
        
        prevButton.addTarget(self, action: #selector(prevButtonPressed(_:)), for: .touchUpInside)
        setupPrevButton()
        setupHeaderLabel()
        setupARIcon()
//        animateLabel()
        animateARIcon()
    }
    
    private func animateLabel() {
        UIView.animate(withDuration: 2, delay: 0, options: [.transitionCrossDissolve], animations: {
            self.headerLabel.alpha = 1
            
        }, completion: nil)
    }
    
    private func setupPrevButton() {
        addSubview(prevButton)
        prevButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            prevButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            prevButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            prevButton.widthAnchor.constraint(equalToConstant: 44),
            prevButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    
    private func setupHeaderLabel() {
        addSubview(headerLabel)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerLabel.bottomAnchor.constraint(equalTo: prevButton.topAnchor, constant: -10),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    private func setupARIcon() {
        addSubview(arIconImage)
        arIconImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            arIconImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -20),
            arIconImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            arIconImage.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.45),
            arIconImage.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.35)
        ])
    }
    
    
    @objc func prevButtonPressed(_ sender: UIButton) {
        
        print("Prev Button Pressed")
        cellDelegate?.clickedOnPrev(index: (index?.row)!, cell: self)
        
    }
    
    private func animateARIcon(){
        UIView.animate(withDuration: 0.75, delay: 0.0, options: [.repeat, .autoreverse, .allowUserInteraction], animations: {
            self.arIconImage.transform = CGAffineTransform(scaleX: 1.75, y: 1.75)
            self.arIconImage.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        }, completion: nil)
    }
}
