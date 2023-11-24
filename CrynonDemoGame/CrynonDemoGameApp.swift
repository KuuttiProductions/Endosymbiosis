
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
        AssetLibrary.textures.addTexture(textureName: "EnvironmentTexture", mipMaps: false, origin: .topLeft)
        AssetLibrary.textures.addTexture(textureName: "CellMembraneColor")
        AssetLibrary.textures.addTexture(textureName: "NucleusColor")
        AssetLibrary.textures.addTexture(textureName: "EndoplasmicReticulumColor")
        AssetLibrary.textures.addTexture(textureName: "ChloroplastColor")
        AssetLibrary.textures.addTexture(textureName: "MitochondrionColor")
        AssetLibrary.meshes.addMesh(meshName: "CellMembrane")
        AssetLibrary.meshes.addMesh(meshName: "Nucleus")
        AssetLibrary.meshes.addMesh(meshName: "EndoplasmicReticulum")
        AssetLibrary.meshes.addMesh(meshName: "Chloroplast")
        AssetLibrary.meshes.addMesh(meshName: "Vacuole")
        AssetLibrary.meshes.addMesh(meshName: "Mitochondrion")
        AssetLibrary.meshes.addMesh(meshName: "CellWall")
    }
    
    var body: some SwiftUI.Scene {
        WindowGroup {
            CanvasView()
        }
    }
}
