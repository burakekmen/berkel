//
//  AddSellerViewModel.swift
//  berkel
//
//  Created by Onur Yilmaz on 15.09.2023.
//

import Combine

protocol IAddSellerViewModel: AnyObject {
    var viewState: ScreenStateSubject<AddSellerViewState> { get }
    var errorState: ErrorStateSubject { get }

    init(repository: IAddSellerRepository,
         coordinator: IAddSellerCoordinator,
         uiModel: IAddSellerUIModel)

    // Setter
    func setName(_ name: String)
    func setTC(_ tc: String)
    func setPhone(_ phone: String)
    func setDesc(_ desc: String)
    
    // Service
    func saveNewSeller()

    // Coordinator
    func dismiss()
}

final class AddSellerViewModel: BaseViewModel, IAddSellerViewModel {

    // MARK: Definitions
    private let repository: IAddSellerRepository
    private let coordinator: IAddSellerCoordinator
    private var uiModel: IAddSellerUIModel

    // MARK: Public Props
    let response = CurrentValueSubject<AddSellerModel?, Never>(nil)
    var errorState = ErrorStateSubject(nil)

    var viewState = ScreenStateSubject<AddSellerViewState>(nil)

    // MARK: Initiliazer
    required init(repository: IAddSellerRepository,
                  coordinator: IAddSellerCoordinator,
                  uiModel: IAddSellerUIModel) {
        self.repository = repository
        self.coordinator = coordinator
        self.uiModel = uiModel
    }

    func setName(_ name: String) {
        self.uiModel.setName(name)
    }

    func setTC(_ tc: String) {
        self.uiModel.setTC(tc)
    }

    func setPhone(_ phone: String) {
        self.uiModel.setPhone(phone)
    }

    func setDesc(_ desc: String) {
        self.uiModel.setDesc(desc)
    }
}


// MARK: Service
internal extension AddSellerViewModel {

    func saveNewSeller() {
        if let errorMessage = self.uiModel.errorMessage {
            errorState.value = .ERROR_MESSAGE(title: "Uyarı", msg: errorMessage)
            return
        }

        handleResourceFirestore(
            request: self.repository.saveNewSeller(data: self.uiModel.data),
            response: self.response,
            errorState: self.errorState,
            callbackLoading: { [weak self] isProgress in
                guard let self = self else { return }
                self.viewStateShowNativeProgress(isProgress: isProgress)
            }, callbackSuccess: { [weak self] in
                guard let self = self else { return }
                self.viewStateShowSavedSeller()
                self.dismiss()
            })
    }
}

// MARK: States
internal extension AddSellerViewModel {

    // MARK: View State
    func viewStateShowNativeProgress(isProgress: Bool) {
        viewState.value = .showNativeProgress(isProgress: isProgress)
    }
    
    func viewStateShowSavedSeller() {
        guard let data = self.response.value else { return }
        viewState.value = .showSavedSeller(data: data)
    }

    // MARK: Action State

}

// MARK: Coordinate
internal extension AddSellerViewModel {

    func dismiss() {
        self.coordinator.dismiss()
    }
}


enum AddSellerViewState {
    case showNativeProgress(isProgress: Bool)
    case showSavedSeller(data: AddSellerModel)
}


