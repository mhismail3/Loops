//
//  Extensions.swift
//  Tasks
//
//  Created by Moose on 10/18/23.
//

import Foundation
import SwiftUI

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}

extension AnyTransition {
    static func moveAndFade(direction: MoveDirection) -> AnyTransition {
        switch direction {
        case .left:
            let insertion = AnyTransition.move(edge: .leading)
                .combined(with: .opacity)
            let removal = AnyTransition.move(edge: .trailing)
                .combined(with: .opacity)
            return .asymmetric(insertion: insertion, removal: removal)
        case .right:
            let insertion = AnyTransition.move(edge: .trailing)
                .combined(with: .opacity)
            let removal = AnyTransition.move(edge: .leading)
                .combined(with: .opacity)
            return .asymmetric(insertion: insertion, removal: removal)
        }
    }
}
