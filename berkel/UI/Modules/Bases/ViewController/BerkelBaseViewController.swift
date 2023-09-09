//
//  BerkelBaseViewController.swift
//  berkel
//
//  Created by Onur Yilmaz on 1.09.2023.
//

import UIKit
import Combine

class BerkelBaseViewController: UIViewController {

    var cancelBag = Set<AnyCancellable>()

    deinit {
        print("killed: \(type(of: self))")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initDidLoad()

    }

    // just base sub class
    internal func initDidLoad() {
        self.setupView()
        self.initialComponents()
        self.registerEvents()
    }

    // for all sub class
    func setupView() { }

    // for all sub class
    func initialComponents() { }

    // for all sub class
    func registerEvents() { }
}

extension BerkelBaseViewController {

    func observeErrorState(errorState: ErrorStateSubject,
                           errorHandle: FirestoreErrorHandle) {
        errorState.sink(receiveValue: { errorType in
            self.handleApiError(errorType: errorType,
                                errorHandler: errorHandle)
        }).store(in: &cancelBag)
    }

    private func handleApiError(errorType: NetworkingError?,
                                errorHandler: FirestoreErrorHandle) {

        switch errorType {
        case .COMMON_ERROR(_),
             .UNDEFINED_RESPONSE_TYPE:

            errorHandler.handleCommonError(errorMessage: errorType?.description ?? "Beklenmedik bir hata oluştu")
        case .none:
            break
        }
    }
}
