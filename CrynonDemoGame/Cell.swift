//
//  Cell.swift
//  CrynonDemoGame
//
//  Created by Kuutti Taavitsainen on 14.11.2023.
//

import Foundation
import Crynon

class Cell: RigidBody {
    
    init() {
        super.init("Cell")
        self.gravityScalar = 0.0
        self.addCollider("Cube")
    }
    
    override func onBeginCollide(collidingObject: RigidBody)-> Bool {
        if collidingObject is Bacteria {
            let bacteria = collidingObject as! Bacteria
            switch bacteria.bacteriaType {
            case .Debug:
                self.material.shaderMaterial.emission = Float.random(in: 0.0...0.5)
            }
            bacteria.removeSelf()
            return false
        }
        return true
    }
}
