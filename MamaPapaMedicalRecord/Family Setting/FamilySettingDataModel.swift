//
//  FamilySettingDataModel.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/20.
//

import Firebase

struct FamilySettingDataModel {
    var childName: String
    var birthday: String
    var family: String
    var familyLineage: FamilyLineage
    
    init(data: [String: Any]) {
        self.childName = data["childName"] as? String ?? ""
        self.birthday = data["birthday"] as? String ?? ""
        self.family = data["family"] as? String ?? ""
        self.familyLineage = data["lineage"] as? FamilyLineage ?? .mama
    }
}

enum FamilyLineage: String, CaseIterable {
    case mama = "ママ"
    case papa = "パパ"
    case grandma = "おばあちゃん"
    case grandpa = "おじいちゃん"
    case other = "その他"
}
