
import Crynon
import simd

class GameScene: Crynon.Scene {
    
    var cell = Cell(missing: Int.random(in: 1...7))
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
        player.updateScore()
        removeChild(cell.uuid)
        cell = Cell(missing: Int.random(in: 1...7))
        cell.setPos(simd_float3(Float.random(in: -7...7),
                                Float.random(in: -7...7),
                                Float.random(in: -7...7)), teleport: true)
        addPhysicsObject(cell)
    }
    
    func lose() {
        player.score = 0
        ViewCenter.shared.score = 0
    }
}
