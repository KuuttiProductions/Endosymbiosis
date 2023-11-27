//
//  Enemy.swift
//  Endosymbiosis
//
//  Created by Kuutti Taavitsainen on 25.11.2023.
//

import Foundation
import Crynon

class Enemy: RigidBody {
    
    init(type: Int) {
        super.init("Enemy")
        
        self.gravityScalar = 0.0
        
        switch type {
        case 0:
            self.mesh = "Sphere"
        default:
            self.mesh = "Sphere"
            self.addCollider("Sphere")
        }
    }
    
    override func onBeginCollide(collidingObject: RigidBody) -> Bool {
        return false
    }
}
