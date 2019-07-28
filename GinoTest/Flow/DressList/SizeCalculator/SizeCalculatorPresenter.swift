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
    func saveSize(_ size: Any)
}

protocol SizeCalculatorView: class {
    func updateResult(_ result: SizeResul)
}

final class GinoSizeCalculatorPresenter: SizeCalculatorPresenter {
    
    // MARK: - Properties
    
    weak var view: SizeCalculatorView?
    
    // MARK: - Methods
    
    func processNewSize(bust: Int, waist: Int, hips: Int) {
        view?.updateResult(SizeResul(description: "Your size: S\nYour UK size: 10\nYour EU size: 36",
                                     value: 12))
    }
    
    func saveSize(_ size: Any) {
        print("Saved")
    }
}
