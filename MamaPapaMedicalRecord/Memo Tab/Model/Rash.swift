//
//  Rash.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/10/13.
//

/// 発疹のデータモデル
struct Rash {
    /// 記録日時
    var recordDate: String
    /// 体温
    var temperature: String
    /// 場所
    var site: Site
    /// 場所「その他記入欄」
    var other: String
    /// メモ
    var memo: String
    /// 画像
    var imageURL: String
}

///  発疹の場所
enum Site: String {
    case head = "頭"
    case face = "顔"
    case neck = "首"
    case stomach = "お腹"
    case back = "背中"
    case crotch = "股"
    case hip = "お尻"
    case leg = "足"
    case other = "その他"
}
