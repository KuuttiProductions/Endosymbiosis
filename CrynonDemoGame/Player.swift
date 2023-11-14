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
    
    init() {
        super.init("Player")
        InputManager.subscribe(client: self)
    }
    
    func shoot() {
        let Bacteria = Bacteria(type: .Debug, direction: self.forwardVector, position: self.position)
        Bacteria.gravityScalar = 0.0
        
        getScene().addPhysicsObject(Bacteria)
    }
    
    override func tickCustom(_ deltaTime: Float) {
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
    func drawKeyInput(key: GCKeyCode, down: Bool) {}
    
    func drawControllerInput(button: GCButtonElementName, down: Bool) {}
    
    func drawMouseInput(button: Crynon.MouseButton, down: Bool) {
        if button == .left && down {
            shoot()
        }
    }
}
