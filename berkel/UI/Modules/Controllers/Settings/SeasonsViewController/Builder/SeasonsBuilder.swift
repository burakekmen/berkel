//
//  SeasonsBuilder.swift
//  berkel
//
//  Created by Onur Yilmaz on 25.09.2023.
//  Copyright (c) 2023 Emlakjet IOS Development Team. All rights reserved.[EC-2021]
//

import UIKit

enum SeasonsBuilder {

    static func generate(with data: SeasonsPassData,
                         coordinator: ISeasonsCoordinator,
                         seasonDismissCallback: ((_ isSelected: Bool) -> Void)? = nil) -> SeasonsViewController {

        let repository = SeasonsRepository()
        let uiModel = SeasonsUIModel(data: data)
        let viewModel = SeasonsViewModel(repository: repository,
                                         coordinator: coordinator,
                                         uiModel: uiModel)

        return SeasonsViewController(viewModel: viewModel,
                                     seasonDismissCallback: seasonDismissCallback)
    }
}
