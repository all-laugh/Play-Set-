//
//  PatternAttributes.swift
//  Play Set!
//
//  Created by Xiao Quan on 3/27/21.
//

import SwiftUI

struct PatternAttributes {
    enum CardNumber: Int, Comparable, CaseIterable {
        static func < (lhs: PatternAttributes.CardNumber, rhs: PatternAttributes.CardNumber) -> Bool {
            lhs == rhs
        }
        
        case one = 1, two, three
    }

    enum CardColor: Comparable, CaseIterable {
        case purple, green, pink
    }

    enum CardShape: Comparable, CaseIterable {
        case capsule, triangle, displacedCircle
    }

    enum CardShading: Comparable, CaseIterable {
        case opaque, shaded, transparent
    }
}
