
import SwiftUI
import Crynon

@main
struct CrynonDemoGameApp: App {
    
    private var core: Core = Core()
    
    init() {
        core = Core()
        loadContent()
        Crynon.Preferences.preferredFPS = 60
        Crynon.Preferences.useSkySphere = true
        Crynon.SceneManager.changeScene(GameScene())
    }
    
    func loadContent() {
        AssetLibrary.textures.addTexture(textureName: "hdr")
        AssetLibrary.textures.addTexture(textureName: "CellMembraneColor")
        AssetLibrary.textures.addTexture(textureName: "NucleusColor")
        AssetLibrary.meshes.addMesh(meshName: "CellMembrane")
        AssetLibrary.meshes.addMesh(meshName: "Nucleus")
    }
    
    var body: some SwiftUI.Scene {
        WindowGroup {
            ContentView()
                .environmentObject(core)
        }
    }
}
