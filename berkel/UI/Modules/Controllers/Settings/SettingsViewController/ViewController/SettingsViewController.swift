//
//  SettingsViewController.swift
//  berkel
//
//  Created by Onur Yilmaz on 2.09.2023.
//

import UIKit
import FirebaseAuth

final class SettingsViewController: MainBaseViewController {

    // MARK: Constants

    // MARK: Inject
    private let viewModel: ISettingsViewModel

    // MARK: IBOutlets

    // MARK: Constraints Outlets

    // MARK: Initializer
    init(viewModel: ISettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "SettingsViewController", bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    override func initialComponents() {
        self.observeReactiveDatas()

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

       /* do {
            try Auth.auth().signOut()
            
        } catch let error as NSError {
            
        }*/
    }

    override func registerEvents() {

    }

    private func observeReactiveDatas() {
        observeViewState()
        observeActionState()
        listenErrorState()
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
        let errorHandle = FirestoreErrorHandle(
            viewController: self,
            callbackOverrideAlert: nil,
            callbackAlertButtonAction: { [unowned self] in
                self.viewModel.getDocuments()
            }
        )
        observeErrorState(errorState: viewModel.errorState,
                          errorHandle: errorHandle)
    }

    // MARK: Define Components
}

// MARK: Props
private extension SettingsViewController {

}
