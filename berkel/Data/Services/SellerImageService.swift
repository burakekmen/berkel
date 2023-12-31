//
//  SellerImageService.swift
//  berkel
//
//  Created by Onur Yilmaz on 22.10.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage

enum SellerImageService {

    case buyingImage(sellerId: String, season: String, imagePathType: ImagePathType)
    case sellerImage(customerId: String, season: String, imagePathType: ImagePathType)
}

extension SellerImageService: CollectionServiceType {

    var order: String {
        switch self {
        case .buyingImage(_, _, _), .sellerImage(_, _, _):

            return "date"
        }
    }

    var storageReference: StorageReference {
        switch self {
        case .buyingImage(let sellerId, let season, let imagePathType):

            return Storage
                .storage()
                .reference()
                .child("seller")
                .child(sellerId)
                .child(season)
                .child("\(imagePathType.rawValue)/\(Date().dateFormatterApiResponseType()).jpg")

        case .sellerImage(let customerId, let season, let imagePathType):

            return Storage
                .storage()
                .reference()
                .child("customer")
                .child(customerId)
                .child(season)
                .child("\(imagePathType.rawValue)/\(Date().dateFormatterApiResponseType()).jpg")
        }
    }

    var collectionReference: CollectionReference {
        switch self {
        case .buyingImage(let sellerId, let season, let imagePathType):

            return Firestore
                .firestore()
                .collection("seller")
                .document(sellerId)
                .collection(season)
                .document("images")
                .collection(imagePathType.rawValue)

        case .sellerImage(let customerId, let season, let imagePathType):

            return Firestore
                .firestore()
                .collection("customer")
                .document(customerId)
                .collection(season)
                .document("images")
                .collection(imagePathType.rawValue)
        }
    }
}

enum ImagePathType: String {
    case kantarFisi = "kantarFisi"
    case cek = "cek"
    case dekont = "dekont"
    case diger = "diger"
}
