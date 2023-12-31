//
//  NewSellerImageRepository.swift
//  berkel
//
//  Created by Onur Yilmaz on 23.10.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage

protocol INewSellerImageRepository: AnyObject {

    func saveImage(season: String, imagePageType: ImagePageType, imagePathType: ImagePathType, imageData: Data) -> FirestoreResponseType<String>
    func saveSellerImage(sellerId: String, season: String, imagePathType: ImagePathType, data: SellerImageModel) -> FirestoreResponseType<SellerImageModel>
    func saveSellerImage(customerId: String, season: String, imagePathType: ImagePathType, data: CustomerImageModel) -> FirestoreResponseType<CustomerImageModel>
}

final class NewSellerImageRepository: BaseRepository, INewSellerImageRepository {

    func saveImage(season: String, imagePageType: ImagePageType, imagePathType: ImagePathType, imageData: Data) -> FirestoreResponseType<String> {
        // let imageData = image.jpegData(compressionQuality: 0.9)!
        
        switch imagePageType {
        case .buying(let sellerId, _, _):
            let db: StorageReference = SellerImageService.buyingImage(sellerId: sellerId,
                                                                season: season,
                                                                imagePathType: imagePathType).storageReference
            return putData(db, data: imageData)
        case .seller(let customerId, _, _):
            let db: StorageReference = SellerImageService.sellerImage(customerId: customerId,
                                                                season: season,
                                                                imagePathType: imagePathType).storageReference
            return putData(db, data: imageData)
        }
        
    }

    func saveSellerImage(sellerId: String, season: String, imagePathType: ImagePathType, data: SellerImageModel) -> FirestoreResponseType<SellerImageModel> {
        
        let db: DocumentReference = SellerImageService.buyingImage(sellerId: sellerId, season: season, imagePathType: imagePathType).collectionReference.document()

        let key = db.documentID
        var tempData = data
        tempData.id = key

        return self.setData(db, data: tempData)
    }
    
    func saveSellerImage(customerId: String, season: String, imagePathType: ImagePathType, data: CustomerImageModel) -> FirestoreResponseType<CustomerImageModel> {
        
        let db: DocumentReference = SellerImageService.sellerImage(customerId: customerId, season: season, imagePathType: imagePathType).collectionReference.document()

        let key = db.documentID
        var tempData = data
        tempData.id = key

        return self.setData(db, data: tempData)
    }
}
