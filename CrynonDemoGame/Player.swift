//
//  Player.swift
//  CrynonDemoGame
//
//  Created by Kuutti Taavitsainen on 14.11.2023.
//

import Foundation
import Crynon
import GameController
import simd

class Player: Camera {
    
    let moveSpeed: Float = 4
    let playerMove: Bool = false
    var cooldown: Float = 0.0
    
    init() {
        super.init("Player")
        InputManager.subscribe(client: self)
    }
    
    func shoot(_ type: BacteriaType) {
        if cooldown < 0.2 {
            return
        }
        cooldown = 0.0
        let Bacteria = Bacteria(type: type, direction: self.forwardVector, position: self.position)
        Bacteria.gravityScalar = 0.0
        
        getScene().addPhysicsObject(Bacteria)
    }
    
    override func tickCustom(_ deltaTime: Float) {
        cooldown += deltaTime
        
        self.addRotY(InputManager.getMouseDeltaX() * deltaTime * 0.2)
        self.addRotY(InputManager.controllerRX * deltaTime * moveSpeed)
        
        let newRotMouse: Float = (-InputManager.getMouseDeltaY() * deltaTime * 0.2)
        let newRotController: Float = -InputManager.controllerRY * deltaTime * moveSpeed
        self.setRotX(simd_clamp(self.rotation.x + newRotMouse, -Float.pi/2, Float.pi/2))
        if abs(newRotMouse) < 0.1 {
            self.setRotX(simd_clamp(self.rotation.x + newRotController, -Float.pi/2, Float.pi/2))
        }
        
        if playerMove {
            if InputManager.pressedKeys.contains(.keyW) {
                self.addPos(forwardVector * deltaTime * moveSpeed)
            }
            if InputManager.pressedKeys.contains(.keyS) {
                self.addPos(-forwardVector * deltaTime * moveSpeed)
            }
            if InputManager.pressedKeys.contains(.keyA) {
                self.addPos(-rightVector * deltaTime * moveSpeed)
            }
            if InputManager.pressedKeys.contains(.keyD) {
                self.addPos(rightVector * deltaTime * moveSpeed)
            }
            if InputManager.pressedKeys.contains(.spacebar) {
                self.addPosY(deltaTime * moveSpeed)
            }
            if InputManager.pressedKeys.contains(.leftShift) {
                self.addPosY(-deltaTime * moveSpeed)
            }
        }
    }
}

extension Player: EventInput {
    func drawKeyInput(key: GCKeyCode, down: Bool) {
        if down {
            if key == .one {
                shoot(.Nucleus)
            }
            if key == .two {
                shoot(.Mitochondrion)
            }
            if key == .three {
                shoot(.CellWall)
            }
            if key == .four {
                shoot(.Chloroplast)
            }
            if key == .five {
                shoot(.Vacuole)
            }
            if key == .six {
                shoot(.EndoplasmicReticulum)
            }
            if key == .seven {
                shoot(.Lysosome)
            }
        }
    }
    
    func drawControllerInput(button: GCButtonElementName, down: Bool) {}
    
    func drawMouseInput(button: Crynon.MouseButton, down: Bool) {}
}
