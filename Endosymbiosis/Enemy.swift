//
//  Enemy.swift
//  Endosymbiosis
//
//  Created by Kuutti Taavitsainen on 25.11.2023.
//

import Foundation
import Crynon
import simd

class Enemy: RigidBody {
    
    init(type: Int) {
        super.init("Enemy")
        
        self.gravityScalar = 0.0
        self.mesh = "Sphere"
        self.addCollider("Sphere")
        self.material.shaderMaterial.roughness = 0.1
        
        switch type {
        case 1:
            self.material.shaderMaterial.color = simd_float4(0, 0, 0, 1)
        case 2:
            self.material.shaderMaterial.color = simd_float4(1, 0, 0.5, 1)
        case 3:
            self.material.shaderMaterial.color = simd_float4(1, 1, 1, 1)
        case 4:
            self.material.shaderMaterial.color = simd_float4(0, 1, 0, 1)
        case 5:
            self.material.shaderMaterial.color = simd_float4(1, 0, 0, 1)
        case 6:
            self.material.shaderMaterial.color = simd_float4(1, 1, 0, 1)
            self.material.shaderMaterial.emission = 1.0
        case 7:
            self.material.shaderMaterial.color = simd_float4(0, 0, 1, 1)
        default:
            ()
        }
    }
    
    override func onBeginCollide(collidingObject: RigidBody) -> Bool {
        return false
    }
}
