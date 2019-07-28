//
//  DressResultCell.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/28/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

protocol DressResultCellInterface: class {
    func setDress(_ dress: Dress?)
}

final class DressResultCell: UICollectionViewCell, DressResultCellInterface {
    
    // MARK: - Properties
    
    private var dress: Dress?
    
    // MARK: - Views
    
    private lazy var availabilityTextView: UITextView = {
        let textView = UITextView()
        textView.isScrollEnabled = false
        textView.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        textView.backgroundColor = .white
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.layer.cornerRadius = 5
        textView.layer.masksToBounds = true
        textView.textAlignment = .center
        
        return textView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 16)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .black
        
        return label
    }()
    
    private lazy var cartButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "cart"), for: .normal)
        
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.93, green: 0.93, blue: 0.93, alpha: 1).cgColor
        
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        return button
    }()
    
    private lazy var containerView: UIView = {
        return UIView()
    }()
    
    private lazy var dressColorsView: ColorsView = {
        let view = ColorsView()
        
        return view
    }()
    
    // MARK: - View Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureCell()
    }
    
    // MARK: - Methods
    
    func setDress(_ dress: Dress?) {
        self.dress = dress
        imageView.image = dress?.image
        priceLabel.text = "$\(dress?.price ?? 0.0)"
        dressColorsView.setColors(dress?.allColors ?? [])
        descriptionLabel.text = dress?.description
        configureAvailabilityLabel(dress?.availability)
    }
    
    private func configureCell() {
        setupViews()
        configureAppearance()
        backgroundColor = .white
    }
    
    private func setupViews() {
        addImageView()
        addAvailabiityLabel()
        addDescriptionLabel()
        addContainerView()
    }
    
    private func configureAppearance() {
        layer.cornerRadius = 5.0
        layer.masksToBounds = true
    }
    
    private func configureAvailabilityLabel(_ availability: Availability?) {
        availabilityTextView.text = availability?.description
        availabilityTextView.textColor = availability?.textColor
        availabilityTextView.backgroundColor = availability?.backgroundColor
    }
}

// MARK: - Layout
extension DressResultCell {
    private func addAvailabiityLabel() {
        contentView.addSubview(availabilityTextView)
        
        availabilityTextView.layout {
            $0.constraint(to: contentView, by: .leading(33), .top(33))
        }
    }
    
    private func addImageView() {
        contentView.addSubview(imageView)
        
        imageView.layout {
            $0.constraint(to: contentView, by: .leading(0), .trailing(0), .top(0))
            $0.size(.height(frame.height * 0.7))
        }
    }
    
    private func addDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        
        descriptionLabel.layout {
            $0.top.constraint(to: imageView, by: .bottom(20))
            $0.centerX.constraint(to: contentView, by: .centerX(0))
        }
    }
    
    private func addContainerView() {
        contentView.addSubview(containerView)
        
        containerView.layout {
            $0.constraint(to: contentView, by: .leading(0), .trailing(0), .bottom(0))
            $0.top.constraint(to: descriptionLabel, lessThan: .bottom(0))
            $0.size(.height(60))
        }
        
        addCartButton()
        addDressColorsView()
        addPriceLabel()
    }
    
    private func addCartButton() {
        containerView.addSubview(cartButton)
        
        cartButton.layout {
            $0.constraint(to: contentView, by: .trailing(-10))
            $0.size(.width(frame.width * 0.18), .height(frame.height * 0.07))
            $0.centerY.constraint(to: containerView, by: .centerY(0))
        }
    }
    
    private func addDressColorsView() {
        containerView.addSubview(dressColorsView)
        
        dressColorsView.layout {
            $0.constraint(to: contentView, by: .leading(10))
            $0.size(.height(20))
            $0.centerY.constraint(to: containerView, by: .centerY(0))
        }
    }
    
    private func addPriceLabel() {
        containerView.addSubview(priceLabel)
        
        priceLabel.layout {
            $0.centerX.constraint(to: containerView, by: .centerX(0))
            $0.centerY.constraint(to: containerView, by: .centerY(0))
        }
    }
}

