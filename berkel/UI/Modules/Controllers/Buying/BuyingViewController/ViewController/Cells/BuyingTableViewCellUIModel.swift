//
//  BuyingTableViewCellUIModel.swift
//  berkel
//
//  Created by Onur Yilmaz on 29.09.2023.
//


import UIKit

protocol IBuyingTableViewCellUIModel {

    var id: String { get }
    var isActive: Bool { get }
    var sellerName: String { get }
    var productName: String { get }
    var kg: Double { get } // kgPrice
    var price: String { get }
}

struct BuyingTableViewCellUIModel: IBuyingTableViewCellUIModel {

    let id: String
    let isActive: Bool
    let sellerName: String
    let productName: String
    let kg: Double // kgPrice
    let price: String
}