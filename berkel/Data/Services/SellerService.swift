//
//  SellerService.swift
//  berkel
//
//  Created by Onur Yilmaz on 15.09.2023.
//

import FirebaseFirestore

enum SellerService {

    case save
}

extension SellerService: CollectionServiceType {
    
    var collectionReference: CollectionReference {
        switch self {
        case .save:

            return Firestore
                .firestore()
                .collection("seller")
        }
    }
}
