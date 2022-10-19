//
//  UserModel.swift
//  MVVM
//
//  Created by Shahzaib Mumtaz on 19/10/2022.
//

import Foundation
import UIKit

// MARK: - User Model
struct UserModel: Codable {
    let userID: Int?
    let id: Int?
    let title: String?
    let completed: Bool?
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id = "id"
        case title = "title"
        case completed = "completed"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.userID = try container.decodeIfPresent(Int.self, forKey: .userID)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.completed = try container.decodeIfPresent(Bool.self, forKey: .completed)
    }
    
    // MARK: - Getting Status and Color Method.
    func GetStatusColor() -> (String, UIColor) {
        if completed ?? true {
            return ("COMPLETED", UIColor.systemCyan)
        } else {
            return ("NOT COMPLETED", UIColor.systemRed)
        }
    }
}

