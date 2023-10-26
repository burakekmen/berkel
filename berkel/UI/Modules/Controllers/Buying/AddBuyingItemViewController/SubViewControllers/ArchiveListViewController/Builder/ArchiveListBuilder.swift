//
//  ArchiveListBuilder.swift
//  berkel
//
//  Created by Onur Yilmaz on 26.10.2023.
//  Copyright (c) 2023 Emlakjet IOS Development Team. All rights reserved.[EC-2021]
//

import UIKit

enum ArchiveListBuilder {

    static func generate(with data: ArchiveListPassData,
                         coordinator: IArchiveListCoordinator) -> ArchiveListViewController {

        let repository = ArchiveListRepository()
        let uiModel = ArchiveListUIModel(data: data)
        let viewModel = ArchiveListViewModel(repository: repository,
                                             coordinator: coordinator,
                                             uiModel: uiModel)

        return ArchiveListViewController(viewModel: viewModel)
    }
}
