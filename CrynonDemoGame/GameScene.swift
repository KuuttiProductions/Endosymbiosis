
import Crynon
import simd

class GameScene: Crynon.Scene {
    
    var object = GameObject("Cube")
    var player = FPSCamera()
    var light = PointLight()
    var skySphere = EnvironmentSphere("Sky")
    
    init() {
        super.init("GameScene")
        addChild(skySphere)
        addChild(object)
        skySphere.texture = "hdr"
        object.mesh = "Cube"
        object.material.shaderMaterial.color = simd_float4(0, 1, 0, 1)
        addCamera(player)
        player.setPos(simd_float3(0, 0, 4))
        addLight(light)
        light.setPos(simd_float3(3, 4, 2))
    }
    
    var x = false
    override func tickCustom(_ deltaTime: Float) {
        if x == false {
            AssetLibrary.textures.addTexture(textureName: "hdr")
            x = true
            Preferences.useSkySphere = true
        }
    }
}
