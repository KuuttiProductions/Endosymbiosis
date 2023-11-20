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
        self.mesh = "CellMembrane"
        self.material.textureColor = "CellMembraneColor"
        self.material.blendMode = .Alpha
        self.material.shader = .Transparent
    }
    
    override func onBeginCollide(collidingObject: RigidBody)-> Bool {
        if collidingObject is Bacteria {
            let bacteria = collidingObject as! Bacteria
            switch bacteria.bacteriaType {
            case .Debug:
                ()
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
