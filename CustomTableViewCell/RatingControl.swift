//
//  RatingControl.swift
//  CustomTableViewCell
//
//  Created by NTQ on 6/14/19.
//  Copyright © 2019 NTQ. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class RatingControl: UIStackView {
    //MARK: Properties
    private var ratingButtons = [UIButton]()
    @IBInspectable var startSize: CGSize = CGSize(width: 44.4, height: 44.4) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var startCount: Int = 5
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    
    //MARK: Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK: Private method
    private func setupButtons() {
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "star_fill", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "star_empty", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "star_highlighted", in: bundle, compatibleWith: self.traitCollection)
        for _ in 0..<startCount {
            let buttonRed = UIButton()
            buttonRed.translatesAutoresizingMaskIntoConstraints = false
            buttonRed.heightAnchor.constraint(equalToConstant: startSize.height).isActive = true
            buttonRed.widthAnchor.constraint(equalToConstant: startSize.width).isActive = true
            buttonRed.backgroundColor = UIColor.clear
            buttonRed.setImage(emptyStar, for: .normal)
            buttonRed.setImage(filledStar, for: .selected)
            buttonRed.setImage(highlightedStar, for: .highlighted)
            buttonRed.setImage(highlightedStar, for: [.highlighted, .selected])
            buttonRed.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            addArrangedSubview(buttonRed)
            ratingButtons.append(buttonRed)
        }
        updateButtonSelectionStates()
    }
    
    @objc func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        // Calculate the rating of the selected button
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the rating to 0.
            rating = 0
        } else {
            // Otherwise set the rating to the selected star
            rating = selectedRating
        }
    }
    
    private func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            // If the index of a button is less than the rating, that button should be selected.
            button.isSelected = index < rating
        }
    }
    
}
