//
//  ShoppingCartCell.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/28/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

protocol ShoppingCartCellInterface: class {
    var dress: Dress? { get }
    var delegate: ShoppingCartDelegate? { get set }
    
    func setDress(_ dress: Dress?)
}

protocol ShoppingCartDelegate: class {
    func shoppingCart(_ shoppingCart: ShoppingCartCellInterface, didChangeCount order: Int)
    func didRemoveCartEntity(_ shoppingCart: ShoppingCartCellInterface)
}

final class ShoppingCartCell: UICollectionViewCell, ShoppingCartCellInterface {
    
    // MARK: - Properties
    
    weak var delegate: ShoppingCartDelegate?
    
    private (set) var dress: Dress? {
        didSet {
            dressImageView.image = UIImage(data: dress?.dress.image)
            descriptionLabel.text = dress?.dress.name
            priceLabel.text = "$\(dress?.dress.price ?? 0.0)"
            stepperView.setStep(dress?.orderCount ?? 1)
            stepperView.setMax(dress?.maxOrder() ?? 1)
        }
    }
    
    // MARK: - Views
    
    private lazy var dressImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 16)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .gray
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 18)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .black
        
        return label
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setImage(GinoIcon.delete.image, for: .normal)
        button.addTarget(self, action: #selector(removeDress(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var stepperView: StepperView = {
        let view = StepperView()
        view.delegate = self
        
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    // MARK: - Constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureView()
        setupViews()
    }
    
    // MARK: - Actions
    
    @objc private func removeDress(_ sender: UIButton) {
        delegate?.didRemoveCartEntity(self)
    }
    
    // MARK: - Methods
    
    func setDress(_ dress: Dress?) {
        self.dress = dress
    }
    
    private func configureView() {
        backgroundColor = .white
        layer.cornerRadius = 5
    }
    
    private func setupViews() {
        addContainerView()
        addStepperView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        stepperView.setStep(dress?.orderCount ?? 1)
    }
}

// MARK: - StepperViewDelegate
extension ShoppingCartCell: StepperViewDelegate {
    func didChangeValue(_ value: Int) {
        delegate?.shoppingCart(self, didChangeCount: value)
    }
}

// MARK: - Layout
extension ShoppingCartCell {
    private func addContainerView() {
        contentView.addSubview(containerView)
        
        containerView.layout {
            $0.constraint(to: contentView, by: .leading(25), .top(25), .trailing(-20))
            $0.size(.height(frame.height * 0.55))
        }
        
        addDressImageView()
        addDescriptionLabel()
        addPriceLabel()
        addDeleteButton()
    }
    
    private func addDressImageView() {
        containerView.addSubview(dressImageView)
        
        dressImageView.layout {
            $0.constraint(to: containerView, by: .leading(0), .top(0), .bottom(0))
            dressImageView.widthAnchor.constraint(equalTo: dressImageView.heightAnchor, multiplier: 1).activate()
        }
    }
    
    private func addDescriptionLabel() {
        containerView.addSubview(descriptionLabel)
        
        descriptionLabel.layout {
            $0.constraint(to: containerView, by: .top(10))
            $0.leading.constraint(to: dressImageView, by: .trailing(10))
        }
    }
    
    private func addPriceLabel() {
        containerView.addSubview(priceLabel)
        
        priceLabel.layout {
            $0.leading.constraint(to: descriptionLabel, by: .leading(0))
            $0.bottom.constraint(to: containerView, by: .bottom(-10))
        }
    }
    
    private func addDeleteButton() {
        containerView.addSubview(deleteButton)
        
        deleteButton.layout {
            $0.size(.width(24), .height(24))
            $0.constraint(to: containerView, by: .trailing(-10), .bottom(-10))
        }
    }
    
    private func addStepperView() {
        contentView.addSubview(stepperView)
        
        stepperView.layout {
            $0.trailing.constraint(to: deleteButton, by: .trailing(0))
            $0.leading.constraint(to: priceLabel, by: .leading(0))
            $0.bottom.constraint(to: contentView, by: .bottom(-20))
            $0.top.constraint(to: containerView, by: .bottom(5))
        }
    }
}

