//
//  MemoDataModel.swift
//  MamaPapaMedicalRecord
//
//  Created by 菊地原杏菜 on 2023/09/14.
//

import UIKit

struct MemoDataModel {
    var id: String
    var recordDate: Date     // 記録日時
    var temperature: String  // 熱
    var appetite:  String   // 食欲
    var hydration: String // 水分補給
    var mood: String           // 機嫌
    var sleepQuantity: String // 睡眠
    var sleepingTime: String // 睡眠時間
    var cough: Bool          // 咳
    var snot: Bool           // 鼻水
    var memo: String         // メモ
}
