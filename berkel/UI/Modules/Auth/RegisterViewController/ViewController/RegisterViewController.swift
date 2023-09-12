//
//  RegisterViewController.swift
//  berkel
//
//  Created by Onur Yilmaz on 12.09.2023.
//  Copyright (c) 2023 Emlakjet IOS Development Team. All rights reserved.[EC-2021]
//

import UIKit

final class RegisterViewController: BerkelBaseViewController {

    // MARK: Constants

    // MARK: Inject
    private let viewModel: IRegisterViewModel

    // MARK: IBOutlets

    // MARK: Constraints Outlets
    
    // MARK: Initializer
    init(viewModel: IRegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "RegisterViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func initialComponents() {
        self.observeReactiveDatas()
    }

    override func registerEvents() {

    }

    private func observeReactiveDatas() {
        observeViewState()
        observeActionState()
        // listenErrorState()
    }

    private func observeViewState() {
         
    }

    private func observeActionState() {
        /* viewModel._actionState.observeNext { [unowned self] state in
             switch state {
            
            } 
        }.dispose(in: disposeBag) */
    }

    private func listenErrorState() {
        // observeErrorState(errorState: viewModel._errorState)
    }

    // MARK: Define Components (if you have or delete this line)
}

// MARK: Props
private extension RegisterViewController {
    
}
