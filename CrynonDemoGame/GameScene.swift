
import Crynon
import simd

class GameScene: Crynon.Scene {
    
    var object = Cell()
    var player = Player()
    var light = PointLight()
    var skySphere = EnvironmentSphere("Sky")
    
    init() {
        super.init("GameScene")
        addChild(skySphere)
        addPhysicsObject(object)
        skySphere.texture = "hdr"
        object.mesh = "CellMembrane"
        addCamera(player)
        player.setPos(simd_float3(0, 0, 5))
        addLight(light)
        light.setPos(simd_float3(3, 4, 2))
    }
}
