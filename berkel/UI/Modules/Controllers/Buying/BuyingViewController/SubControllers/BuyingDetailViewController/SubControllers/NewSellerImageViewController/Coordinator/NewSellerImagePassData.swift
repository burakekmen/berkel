//
//  NewSellerImagePassData.swift
//  berkel
//
//  Created by Onur Yilmaz on 23.10.2023.
//  Copyright (c) 2023 Emlakjet IOS Development Team. All rights reserved.[EC-2021]
//

import Foundation

struct NewSellerImagePassData: ICoordinatorPassData {

    let imagePathType: ImagePathType
    let sellerId: String
    let buyingId: String
    let buyingProductName: String
}
