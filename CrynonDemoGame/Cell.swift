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
    
    var nucleus: GameObject!
    var mitochondrion: GameObject!
    var chloroplast: GameObject!
    var vacuole: GameObject!
    var endoplasmicReticulum: GameObject!
    var cellWall: GameObject!
    var lysosome: GameObject!
    
    init() {
        super.init("Cell")
        self.gravityScalar = 0.0
        self.addCollider("CellMembrane")
        self.mesh = "CellMembrane"
        self.material.textureColor = "CellMembraneColor"
        self.material.blendMode = .Alpha
        self.material.shader = .Transparent
    }
    
    func checkForAll() {
        if nucleus != nil && mitochondrion != nil && chloroplast != nil && vacuole != nil && endoplasmicReticulum != nil && cellWall != nil && lysosome != nil {
            (getScene() as! GameScene).newCell()
        }
    }
    
    override func onBeginCollide(collidingObject: RigidBody)-> Bool {
        if collidingObject is Bacteria {
            let bacteria = collidingObject as! Bacteria
            switch bacteria.bacteriaType {
            case .Nucleus:
                if nucleus == nil {
                    nucleus = GameObject("Nucleus")
                    self.addChild(nucleus)
                    nucleus.mesh = "Nucleus"
                    nucleus.material.textureColor = "NucleusColor"
                    nucleus.setPos(-0.15819, 0.3837, 0.090875)
                }
            case .Lysosome:
                if lysosome == nil {
                    lysosome = GameObject("Lysosome")
                    self.addChild(lysosome)
                    lysosome.mesh = "Sphere"
                    lysosome.material.textureColor = "LysosomeColor"
                    lysosome.setPos(0.040092, 0.085891, 0.7598)
                    lysosome.setScale(0.2)
                    lysosome.material.shaderMaterial.color = simd_float4(1, 0, 0.3, 1)
                }
            case .Mitochondrion:
                if mitochondrion == nil {
                    mitochondrion = GameObject("Mitochondrion")
                    self.addChild(mitochondrion)
                    mitochondrion.mesh = "Mitochondrion"
                    mitochondrion.material.textureColor = "MitochondrionColor"
                    mitochondrion.setPos(-0.55328, -0.45049, -0.056247)
                }
            case .Vacuole:
                if vacuole == nil {
                    vacuole = GameObject("Vacuole")
                    self.addChild(vacuole)
                    vacuole.mesh = "Vacuole"
                    vacuole.material.textureColor = "VacuoleColor"
                    vacuole.setPos(0.25331, -0.27229, -0.19558)
                    vacuole.material.shaderMaterial.color = simd_float4(0.2, 0.5, 1, 1)
                }
            case .CellWall:
                if cellWall == nil {
                    cellWall = GameObject("CellWall")
                    self.addChild(cellWall)
                    cellWall.mesh = "CellWall"
                    cellWall.material.textureColor = "CellWallColor"
                    cellWall.material.shaderMaterial.color = simd_float4(0.8, 0.5, 0.1, 1)
                }
            case .Chloroplast:
                if chloroplast == nil {
                    chloroplast = GameObject("Chloroplast")
                    self.addChild(chloroplast)
                    chloroplast.mesh = "Chloroplast"
                    chloroplast.material.textureColor = "ChloroplastColor"
                    chloroplast.setPos(0.60176, 0.276, 0.022367)
                }
            case .EndoplasmicReticulum:
                if endoplasmicReticulum == nil {
                    endoplasmicReticulum = GameObject("EndoplasmicReticulum")
                    self.addChild(endoplasmicReticulum)
                    endoplasmicReticulum.mesh = "EndoplasmicReticulum"
                    endoplasmicReticulum.material.textureColor = "EndoplasmicReticulumColor"
                    endoplasmicReticulum.setPos(-0.23226, 0.54715, 0.41553)
                }
            }
            bacteria.removeSelf()
            checkForAll()
            return false
        }
        return true
    }
}
