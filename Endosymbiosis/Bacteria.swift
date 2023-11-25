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
    case Nucleus
    case Lysosome
    case Mitochondrion
    case Vacuole
    case CellWall
    case Chloroplast
    case EndoplasmicReticulum
}

class Bacteria: RigidBody {
    
    var bacteriaType: BacteriaType
    var time: Float = 0.0
    
    init(type: BacteriaType, direction: simd_float3, position: simd_float3) {
        bacteriaType = type
        super.init("Bacteria")
        self.setScale(0.3)
        self.setPos(position, teleport: true)
        self.linearVelocity = normalize(direction) * 5
        switch type {
        case .Nucleus:
            self.mesh = "Nucleus"
            self.addCollider("Nucleus")
            self.material.textureColor = "NucleusColor"
        case .Lysosome:
            self.setScale(0.2)
            self.mesh = "Sphere"
            self.addCollider("Sphere")
            self.material.shaderMaterial.color = simd_float4(1, 0, 0.3, 1)
        case .Mitochondrion:
            self.mesh = "Mitochondrion"
            self.addCollider("Mitochondrion")
            self.material.textureColor = "MitochondrionColor"
        case .Vacuole:
            self.mesh = "Vacuole"
            self.addCollider("Vacuole")
            self.material.shaderMaterial.color = simd_float4(0.2, 0.5, 1, 1)
        case .CellWall:
            self.mesh = "CellWall"
            self.addCollider("CellWall")
            self.material.shaderMaterial.color = simd_float4(0.8, 0.5, 0.1, 1)
        case .Chloroplast:
            self.mesh = "Chloroplast"
            self.addCollider("Chloroplast")
            self.material.textureColor = "ChloroplastColor"
        case .EndoplasmicReticulum:
            self.mesh = "EndoplasmicReticulum"
            self.addCollider("EndoplasmicReticulum")
            self.material.textureColor = "EndoplasmicReticulumColor"
        }
    }
    
    override func tickCustom(_ deltaTime: Float) {
        self.time += deltaTime
        if time >= 5.0 {
            self.removeSelf()
        }
    }
}
