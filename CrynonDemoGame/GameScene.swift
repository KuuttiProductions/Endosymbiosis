
import Crynon
import simd

class GameScene: Crynon.Scene {
    
    var cell = Cell()
    var player = Player()
    var light = DirectionalLight()
    var skySphere = EnvironmentSphere("Sky")
    
    init() {
        super.init("GameScene")
        addChild(skySphere)
        addPhysicsObject(cell)
        skySphere.texture = "EnvironmentTexture"
        addCamera(player)
        cell.setPos(simd_float3(0, 0, -5), teleport: true)
        addLight(light)
        light.direction = simd_float3(-1, -1, -1)
    }
    
    func newCell() {
        player.updateScore(add: 1)
        removeChild(cell.uuid)
        cell = Cell()
        let pos = simd_float3(Bool.random() ? Float.random(in: 2...7) * -1 : Float.random(in: 2...7),
                              Bool.random() ? Float.random(in: 2...7) * -1 : Float.random(in: 2...7),
                              Bool.random() ? Float.random(in: 2...7) * -1 : Float.random(in: 2...7))
        cell.setPos(pos, teleport: true)
        addPhysicsObject(cell)
    }
}
