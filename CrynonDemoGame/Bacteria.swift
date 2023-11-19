//
//  Bacteria.swift
//  CrynonDemoGame
//
//  Created by Kuutti Taavitsainen on 14.11.2023.
//

import Foundation
import Crynon
import MetalKit

enum BacteriaType {
    case Debug
    case Ribosome
    case Nucleus
    case Lysosome
    case Mitochondrion
}

class Bacteria: RigidBody {
    
    var bacteriaType: BacteriaType
    var time: Float = 0.0
    
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
        case .Ribosome:
            self.mesh = "Sphere"
            self.addCollider("Sphere")
            self.material.shaderMaterial.color = simd_float4(0, 1, 0, 1)
        case .Nucleus:
            self.mesh = "Nucleus"
            self.addCollider("Nucleus")
            self.material.textureColor = "NucleusColor"
        case .Lysosome:
            self.mesh = "Sphere"
            self.addCollider("Sphere")
            self.material.shaderMaterial.color = simd_float4(0, 1, 0, 1)
        case .Mitochondrion:
            self.mesh = "Sphere"
            self.addCollider("Sphere")
            self.material.shaderMaterial.color = simd_float4(0, 1, 0, 1)
        }
    }
    
    override func tickCustom(_ deltaTime: Float) {
        self.time += deltaTime
        if time >= 5.0 {
            self.removeSelf()
        }
    }
}
