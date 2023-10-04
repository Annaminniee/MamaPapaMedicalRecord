//
//  Vomiting.swift
//  MamaPapaMedicalRecord
//
//  Created by 高橋智一 on 2023/10/05.
//

/// 嘔吐のデータモデル
struct Vomiting {
    /// 記録日時
    var recordDate: String
    /// 下痢の有無
    var isVomiting: Bool
    /// 体温
    var temperature: String
    /// 頭を打ったかどうか
    var isHitHead: Bool
    /// 喘息の有無
    var isAsthma: Bool
    /// メモ
    var memo: String
    /// 画像
    var imageURL: String
}
