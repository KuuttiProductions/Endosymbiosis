//
//  Player.swift
//  CrynonDemoGame
//
//  Created by Kuutti Taavitsainen on 14.11.2023.
//

import Foundation
import Crynon
import GameController

class Player: Camera {
    
    let moveSpeed: Float = 4
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
        self.addRotX(-InputManager.getMouseDeltaY() * deltaTime * 0.2)
        self.addRotY(InputManager.controllerRX * deltaTime * moveSpeed)
        self.addRotX(-InputManager.controllerRY * deltaTime * moveSpeed)
        
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
