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
    var score: Int = 0
    var selected: Int = 0
    
    init() {
        super.init("Player")
        InputManager.subscribe(client: self)
    }
    
    func updateScore() {
        score += 1
        ViewCenter.shared.score = score
    }
    
    func shoot() {
        var type: BacteriaType = .Nucleus
        if selected == 1 {
            type = .Nucleus
        }
        if selected == 2 {
            type = .Mitochondrion
        }
        if selected == 3 {
            type = .CellWall
        }
        if selected == 4 {
            type = .Chloroplast
        }
        if selected == 5 {
            type = .Vacuole
        }
        if selected == 6 {
            type = .EndoplasmicReticulum
        }
        if selected == 7 {
            type = .Lysosome
        }
        if cooldown < 0.2 {
            return
        }
        cooldown = 0.0
        let Bacteria = Bacteria(type: type, direction: self.forwardVector, position: self.position)
        Bacteria.gravityScalar = 0.0
        
        getScene().addPhysicsObject(Bacteria)
        (getScene() as! GameScene).enemy.linearVelocity *= 2
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
    
    func updateSelected() {
        if selected == 1 {
            ViewCenter.shared.selected = "bacteria.nucleus"
        }
        if selected == 2 {
            ViewCenter.shared.selected = "bacteria.mitochondrion"
        }
        if selected == 3 {
            ViewCenter.shared.selected = "bacteria.cellWall"
        }
        if selected == 4 {
            ViewCenter.shared.selected = "bacteria.chloroplast"
        }
        if selected == 5 {
            ViewCenter.shared.selected = "bacteria.vacuole"
        }
        if selected == 6 {
            ViewCenter.shared.selected = "bacteria.endoplasmicReticulum"
        }
        if selected == 7 {
            ViewCenter.shared.selected = "bacteria.lysosome"
        }
    }
}

extension Player: EventInput {
    func drawKeyInput(key: GCKeyCode, down: Bool) {
        if down {
            if key == .keyA || key == .leftArrow {
                if selected == 1 {
                    selected = 7
                } else {
                    selected -= 1
                }
                updateSelected()
            }
            
            if key == .keyD || key == .rightArrow {
                if selected == 7 {
                    selected = 1
                } else {
                    selected += 1
                }
                updateSelected()
            }
        }
    }
    
    func drawControllerInput(button: GCButtonElementName, down: Bool) {
        if down {
            if button == .leftTrigger {
                shoot()
                InputManager.playTransientHaptic(1, .triggers)
            }
            
            if button == .leftShoulder {
                if selected == 1 {
                    selected = 7
                } else {
                    selected -= 1
                }
                updateSelected()
            }
            
            if button == .rightShoulder {
                if selected == 7 {
                    selected = 1
                } else {
                    selected += 1
                }
                updateSelected()
            }
        }
    }
    
    func drawMouseInput(button: Crynon.MouseButton, down: Bool) {
        if down {
            if button == .left {
                shoot()
            }
        }
    }
}
