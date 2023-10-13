//
//  Diarrhea.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/10/13.
//

/// 下痢のデータモデル
struct Diarrhea {
    /// 記録日時
    var recordDate: String
    /// 体温
    var temperature: String
    /// 便の形状
    var stoolShape: StoolShape
    /// 便の色
    var stoolColor: StoolColor
    /// におい
    var smell: String
    /// メモ
    var memo: String
    /// 画像
    var imageURL: String
}

/// 便の形状
enum StoolShape: String {
    case softStool = "軟便"
    case muddyStool = "泥状便"
    case wateryStool = "水様便"
}

/// 便の色
enum StoolColor: String {
    case yellow = "黄色/茶色"
    case white = "白っぽい"
    case black = "黒い"
    case red = "赤い所がある"
    case other = "その他"
}
