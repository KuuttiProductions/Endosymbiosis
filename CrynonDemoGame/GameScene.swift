
import Crynon
import simd

class GameScene: Crynon.Scene {
    
    var object = Cell()
    var player = Player()
    var light = DirectionalLight()
    var skySphere = EnvironmentSphere("Sky")
    
    init() {
        super.init("GameScene")
        addChild(skySphere)
        addPhysicsObject(object)
        skySphere.texture = "EnvironmentTexture"
        addCamera(player)
        player.setPos(simd_float3(0, 0, 5))
        addLight(light)
        light.direction = simd_float3(-1, -1, -1)
    }
}
