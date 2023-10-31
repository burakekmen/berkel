//
//  CavusListCoordinator.swift
//  berkel
//
//  Created by Onur Yilmaz on 31.10.2023.
//

import UIKit

protocol ICavusListCoordinator: AnyObject {

    func presentNewCavusViewController(passData: NewCavusPassData)
}

final class CavusListCoordinator: NavigationCoordinator, ICavusListCoordinator {
    
    private var coordinatorData: CavusListPassData { return castPassData(CavusListPassData.self) }
    
    override func start() {
        let controller = CavusListBuilder.generate(with: coordinatorData,
                                                   coordinator: self)
        navigationController.pushViewController(controller, animated: true)
    }
    
    func presentNewCavusViewController(passData: NewCavusPassData) {
        let controller = NewCavusCoordinator.getInstance(presenterViewController: self.navigationController.lastViewController)
            .with(passData: passData)
        coordinate(to: controller)
    }
}
