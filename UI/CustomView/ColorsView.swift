//
//  ColorsView.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/28/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

protocol ColorViewInterface {
    func setColors(_ colors: [UIColor])
}

final class ColorsView: UIView, ColorViewInterface {
    
    // MARK: - Properties
    
    private var offset: CGFloat = 0.0
    private var spacing: CGFloat = 5.0
    
    private var colors: [UIColor]? {
        didSet {
            self.colorViews = colors?.map { makeView(for: $0) }
        }
    }
    
    // MARK: - Views
    
    private var colorViews: [UIView]? {
        didSet {
            oldValue?.forEach { colorStack.removeArrangedSubview($0) }
            colorViews?.forEach {
                colorStack.addArrangedSubview($0)
                $0.layout { $0.size(.height(20), .width(20)) }
            }
        }
    }
    
    private lazy var colorStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .equalCentering
        stackView.spacing = spacing
        
        return stackView
    }()
    
    // MARK: - View Lifecycle
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupViews()
    }
    
    // MARK: - Methods
    func setColors(_ colors: [UIColor]) {
        self.colors = colors
    }
    
    private func setupViews() {
        setupColorStack()
    }
    
    private func makeView(for color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.layer.cornerRadius = 10
        
        return view
    }
}


// MARK: - Layout
extension ColorsView {
    private func setupColorStack() {
        addSubview(colorStack)
        
        colorStack.layout {
            $0.constraint(to: self, offset: offset)
        }
    }
}

