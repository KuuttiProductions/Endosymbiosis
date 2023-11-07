
import SwiftUI
import Crynon

@main
struct CrynonDemoGameApp: App {
    
    @StateObject private var core = Core()
    
    init() {
        Crynon.Preferences.preferredFPS = 60
        Preferences.clearColor = MTLClearColor(red: 0.5, green: 0.7, blue: 1.0, alpha: 1.0)
        Crynon.SceneManager.changeScene(GameScene())
    }
    
    var body: some SwiftUI.Scene {
        WindowGroup {
            ContentView()
                .environmentObject(core)
        }
    }
}
