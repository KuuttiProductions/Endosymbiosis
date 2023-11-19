//
//  Cell.swift
//  CrynonDemoGame
//
//  Created by Kuutti Taavitsainen on 14.11.2023.
//

import Foundation
import Crynon
import simd

class Cell: RigidBody {
    
    var debug: Bool = false
    var nucleus: Bool = false
    var mitochondrio: Bool = false
    var ribosomes: Bool = false
    
    init() {
        super.init("Cell")
        self.gravityScalar = 0.0
        self.addCollider("CellMembrane")
        self.material.textureColor = "CellMembraneColor"
    }
    
    override func onBeginCollide(collidingObject: RigidBody)-> Bool {
        if collidingObject is Bacteria {
            let bacteria = collidingObject as! Bacteria
            switch bacteria.bacteriaType {
            case .Debug:
                debug = true
                if self.material.shaderMaterial.color.x < 1 {
                    self.material.shaderMaterial.color.x += 0.1
                } else if self.material.shaderMaterial.color.y < 1 {
                    self.material.shaderMaterial.color.y += 0.1
                } else if self.material.shaderMaterial.color.z < 1 {
                    self.material.shaderMaterial.color.z += 0.1
                } else {
                    self.material.shaderMaterial.color = simd_float4(0, 0, 0, 1)
                }

            case .Ribosome:
                ()
            case .Nucleus:
                ()
            case .Lysosome:
                ()
            case .Mitochondrion:
                ()
            }
            bacteria.removeSelf()
            return false
        }
        return true
    }
}
