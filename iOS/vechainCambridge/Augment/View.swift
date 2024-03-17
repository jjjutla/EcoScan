import SwiftUI
import RealityKit
import ARKit
import Combine

struct ARViewContainer: UIViewRepresentable {
    @Binding var modelEntity: ModelEntity?
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Configure ARView
        let config = ARWorldTrackingConfiguration()
        arView.session.run(config)
        
        // Download and load the USDZ file
        let url = URL(string: "http://176.58.109.155/model/usdz/018e47fb-b310-774c-84ab-176f1490565f")!
        downloadAndLoadUSDZ(from: url, arView: arView)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func downloadAndLoadUSDZ(from url: URL, arView: ARView) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error downloading USDZ file: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            // Save the downloaded file to a temporary location
            let tempURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(url.lastPathComponent)
            do {
                try data.write(to: tempURL)
                // Load the USDZ file into a RealityKit entity
                Entity.loadModelAsync(named: tempURL.lastPathComponent)
                    .sink(receiveCompletion: { completion in
                        if case .failure(let error) = completion {
                            print("Error loading USDZ file: \(error.localizedDescription)")
                        }
                    }, receiveValue: { entity in
                        if let entity = entity as? ModelEntity {
                            // Add the entity to the scene
                            let anchorEntity = AnchorEntity()
                            anchorEntity.addChild(entity)
                            arView.scene.addAnchor(anchorEntity)
                        }
                    })
            } catch {
                print("Error saving USDZ file: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject {
        var cancellables = Set<AnyCancellable>()
    }
}

struct ContentView2: View {
    @State private var modelEntity: ModelEntity?
    
    var body: some View {
        ARViewContainer(modelEntity: $modelEntity)
            .edgesIgnoringSafeArea(.all)
    }
}
