//
//  FamilySettingDataModel.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/20.
//

import Firebase

struct Child {
    let documentID: String
    let childName: String?
    let birthday: String?
}

struct Family {
    let documentID: String
    let family: String?
    let familyLineage: String?
}

enum FamilySettingCollection: String {
    case children = "children"
    case families = "families"
}
