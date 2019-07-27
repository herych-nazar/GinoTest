//
//  SizeCalculatorViewController.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

final class SizeCalculatorViewController: UIViewController {

    // MARK: Properties
    
    private let presenter: SizeCalculatorPresenter
    
    // MARK: - Constructor
    
    init(presenter: SizeCalculatorPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    

}
