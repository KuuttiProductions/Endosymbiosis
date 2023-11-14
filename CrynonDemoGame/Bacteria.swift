//
//  Bacteria.swift
//  CrynonDemoGame
//
//  Created by Kuutti Taavitsainen on 14.11.2023.
//

import Foundation
import Crynon
import simd

enum BacteriaType {
    case Debug
}

class Bacteria: RigidBody {
    
    var bacteriaType: BacteriaType
    
    init(type: BacteriaType, direction: simd_float3, position: simd_float3) {
        bacteriaType = type
        super.init("Bacteria")
        self.setScale(0.1)
        self.setPos(position, teleport: true)
        self.linearVelocity = normalize(direction) * 5
        switch type {
        case .Debug:
            self.mesh = "Sphere"
            self.addCollider("Sphere")
            self.material.shaderMaterial.color = simd_float4(0, 1, 0, 1)
        }
    }
}
