//
//  SellerCoordinator.swift
//  berkel
//
//  Created by Onur Yilmaz on 2.09.2023.
//

import UIKit

protocol ISellerCoordinator: AnyObject {

}

final class SellerCoordinator: NavigationCoordinator, ISellerCoordinator {

    private var coordinatorData: SellerPassData { return castPassData(SellerPassData.self) }

    override func start() {
        let controller = SellerBuilder.generate(coordinator: self)
        navigationController.viewControllers = [controller]
    }
}
