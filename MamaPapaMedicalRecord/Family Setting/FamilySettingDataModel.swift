//
//  FamilySettingDataModel.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/20.
//

import Firebase

struct FamilySettingDataModel {
    var childName: String
    var detail: String
    var family: String
    var familyLineage: FamilyLineage
    
    init(childName: String, detail: String, family: String, familyLineage: FamilyLineage) {
        self.childName = childName
        self.detail = detail
        self.family = family
        self.familyLineage = familyLineage
    }
}

enum FamilyLineage: String {
    case mama = "ママ"
    case papa = "パパ"
    case grandma = "おばあちゃん"
    case grandpa = "おじいちゃん"
    case other = "その他"
}
