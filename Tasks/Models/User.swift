//
//  User.swift
//  Tasks
//
//  Created by Moose on 10/14/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
