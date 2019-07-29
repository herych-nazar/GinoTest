//
//  SizeCalculatorPresenter.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import Foundation

protocol SizeCalculatorPresenter: class {
    var view: SizeCalculatorView? { get set }
    
    func processNewSize(bust: Int, waist: Int, hips: Int)
    func saveSize(_ size: DressSize)
}

protocol SizeCalculatorDelegate: class {
    func userDidSetSize(_ size: DressSize)
}

protocol SizeCalculatorView: class {
    func updateResult(_ result: SizeResul)
    func shouldInvalidate()
}

final class GinoSizeCalculatorPresenter: SizeCalculatorPresenter {
    
    // MARK: - Properties
    
    weak var view: SizeCalculatorView?
    weak var delegate: SizeCalculatorDelegate?
    private var shopSizes: ShopSizes
    
    // MARK: - Constructor
    
    init(shopSizes: ShopSizes, delegate: SizeCalculatorDelegate? = nil) {
        self.shopSizes = shopSizes
        self.delegate = delegate
    }
    
    // MARK: - Methods
    
    func processNewSize(bust: Int, waist: Int, hips: Int) {
        let sizes = optimalSizes(bust: bust, waist: waist, hips: hips)
        if let userSize = userSize(optimalSizes: sizes) {
            let sizeCode = DressSize(rawValue: userSize.name)
            let sizeResult = SizeResul(description: userSize.description(), value: sizeCode)
            view?.updateResult(sizeResult)
        }
    }
    
    private func optimalSizes(bust: Int, waist: Int, hips: Int) -> [SizeObject] {
        let sizes = shopSizes.loadSizes()
        
        let optimalForBust = sizes.sizeForBust(bust)
        let optimalForWaist = sizes.sizeForWais(waist)
        let optimalForHips = sizes.sizeForHips(hips)
        
        return [optimalForBust, optimalForWaist, optimalForHips].compactMap { $0 }
    }
    
    private func userSize(optimalSizes: [SizeObject]) -> SizeObject? {
        return optimalSizes.max { $0.bust < $1.bust }
    }
    
    func saveSize(_ size: DressSize) {
        delegate?.userDidSetSize(size)
        view?.shouldInvalidate()
    }
    
}
