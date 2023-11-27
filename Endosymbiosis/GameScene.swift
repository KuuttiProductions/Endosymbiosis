
import Crynon
import simd

class GameScene: Crynon.Scene {

    var cell = Cell(missing: 1)
    var enemy = Enemy(type: 1)
    var player = Player()
    var light = DirectionalLight()
    var skySphere = EnvironmentSphere("Sky")
    
    init() {
        super.init("GameScene")
        addChild(skySphere)
        newCell()
        skySphere.texture = "EnvironmentTexture"
        addCamera(player)
        addLight(light)
        light.direction = simd_float3(-1, -1, -1)
    }
    
    func newCell() {
        player.updateScore()
        removeChild(cell.uuid)
        let type = Int.random(in: 1...7)
        cell = Cell(missing: type)
        let loc = simd_float3(Float.random(in: -7...7),
                              Float.random(in: -7...7),
                              Float.random(in: -7...7))
        cell.setPos(loc, teleport: true)
        addPhysicsObject(cell)
        
        enemy = Enemy(type: type)
        let enemyLoc = simd_float3(Float.random(in: -7...7),
                                   Float.random(in: -7...7),
                                   Float.random(in: -7...7))
        enemy.setPos(enemyLoc, teleport: true)
        enemy.linearVelocity = normalize(loc - enemyLoc) * Float(min(player.score, 1)) * 0.1
        addPhysicsObject(enemy)
    }
    
    func lose() {
        player.score = 0
        ViewCenter.shared.score = 0
    }
}
