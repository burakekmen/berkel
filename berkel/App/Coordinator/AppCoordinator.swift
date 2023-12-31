//
//  AppCoordinator.swift
//  berkel
//
//  Created by Onur Yilmaz on 1.09.2023.
//

import UIKit

protocol AppCoordinatorFlow: AnyObject {

    func startFlowMain()
}

class AppCoordinator: RootableCoordinator, AppCoordinatorFlow {
    
    var callbackIsPreparedMainScreen: (() -> Void)?
    
    override func start() {
        let splashCoordinator = SplashCoordinator(window: self.window)
        coordinate(to: splashCoordinator)
    }
    
    func startFlowMain() {
        let tabbarCoordinator = MainTabbarCoordinator(window: self.window)
        tabbarCoordinator.callbackIsPreparedMainScreen = callbackIsPreparedMainScreen
        coordinate(to: tabbarCoordinator)
    }
}
