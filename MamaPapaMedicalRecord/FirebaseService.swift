//
//  FirebaseService.swift
//  MamaPapaMedicalRecord
//
//  Created by 高橋智一 on 2023/10/05.
//

import Firebase
import FirebaseStorage

/// Firebaseの管理クラス
final class FirebaseService {
    
    // MARK: - Properties
    
    /// シングルトンパターン
    static let shared = FirebaseService()
    /// Firestoreのインスタンス
    private let db = Firestore.firestore()
    /// FirebaseStorageのインスタンス
    private let storage = Storage.storage()
    
    // MARK: - Other Methods
    
    /// Firestoreにデータを保存するメソッド
    func saveDataToFirestore(collection: String, data: [String: Any], completion: @escaping (Error?) -> Void) {
        db.collection(collection).addDocument(data: data) { error in
            completion(error)
        }
    }
    
    /// Firestoreにデータを更新するメソッド
    func updateDataToFirestore(collection: String,
                               documentID: String,
                               data: [String: Any],
                               completion: @escaping (Error?) -> Void) {
        db.collection(collection).document(documentID).updateData(data) { error in
            completion(error)
        }
    }
    
    /// Firestoreからデータを取得するメソッド
    func fetchDataFromFirestore(collection: String, completion: @escaping ([DocumentSnapshot]?, Error?) -> Void) {
        db.collection(collection).getDocuments { (querySnapshot, error) in
            completion(querySnapshot?.documents, error)
        }
    }
    
    /// Firestoreからデータを削除するメソッド
    func deleteDataFromFirestore(collection: String, documentID: String, completion: @escaping (Error?) -> Void) {
        db.collection(collection).document(documentID).delete { error in
            completion(error)
        }
    }
    
    /// Firebase Storageに画像をアップロードするメソッド
    func uploadImageToStorage(imageData: Data, path: String, completion: @escaping (URL?, Error?) -> Void) {
        let imageRef = storage.reference().child(path)
        let metadata = StorageMetadata()
        
        imageRef.putData(imageData, metadata: metadata) { (metadata, error) in
            if let error = error {
                completion(nil, error)
            } else {
                imageRef.downloadURL { (url, error) in
                    completion(url, error)
                }
            }
        }
    }
}

