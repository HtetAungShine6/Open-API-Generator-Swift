//
//  Users.swift
//  OpenAIClient
//
//  Created by Akito Daiki on 27/06/2024.
//

import Foundation

public struct User: Codable {
    public let _id: String
    public let fId: String
    public let firstName: String
    public let lastName: String?
    public let email: String
    public let phone: Int
    public let createdAt: Date
    public let updatedAt: Date
    public let __v: Int?
}
