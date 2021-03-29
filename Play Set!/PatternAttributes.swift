//
//  PatternAttributes.swift
//  Play Set!
//
//  Created by Xiao Quan on 3/27/21.
//

import SwiftUI

struct PatternAttributes {
    enum CardNumber: Int, CaseIterable {
        case one = 1, two, three
    }

    enum CardColor: CaseIterable {
        case purple, pink, green
    }

    enum CardShape: CaseIterable {
        case capsule, triangle, displacedCircle
    }

    enum CardShading: CaseIterable {
        case opaque, shaded, transparent
    }
}
