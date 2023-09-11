//
//  SplashCoordinator.swift
//  berkel
//
//  Created by Onur Yilmaz on 1.09.2023.
//  Copyright (c) 2023 Emlakjet IOS Development Team. All rights reserved.[EC-2021]
//

import UIKit

protocol ISplashCoordinator: AnyObject {
    
    func presentLoginViewController(didDismissCallback: DefaultDismissCallback?)
}

final class SplashCoordinator: RootableCoordinator , ISplashCoordinator {

    private var coordinatorData: SplashPassData { return castPassData(SplashPassData.self) }

     override func start() {
        let controller = SplashBuilder.generate(coordinator: self)
        
         window?.rootViewController = controller
         window?.makeKeyAndVisible()
     }
    
    func presentLoginViewController(didDismissCallback: DefaultDismissCallback?) {
        let coordinator = LoginCoordinator.getInstance(presenterViewController: self.window?.topViewControllerNew())
            .with(passData: LoginPassData())
            .with(didDismissCallback: didDismissCallback)
        coordinate(to: coordinator)
    }
}
