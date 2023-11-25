//
//  ViewCenter.swift
//  CrynonDemoGame
//
//  Created by Kuutti Taavitsainen on 24.11.2023.
//

import Foundation
import Crynon
import SwiftUI

@Observable
class ViewCenter: ViewStateCenter {
    
    static var shared = ViewCenter()

    override init() {}
    
    var score: Int = 0
    var selected: Int = 0
    
}
