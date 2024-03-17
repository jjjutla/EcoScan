import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arView.environment.background = .color(.black)

        let url = URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/drummertoy/toy_drummer.usdz")
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destination = documents.appendingPathComponent(url!.lastPathComponent)
        let session = URLSession(configuration: .default,
                                      delegate: nil,
                                 delegateQueue: nil)
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let downloadTask = session.downloadTask(with: request, completionHandler: { (location: URL?,
                                  response: URLResponse?,
                                     error: Error?) -> Void in
            
            let fileManager = FileManager.default
                
            if fileManager.fileExists(atPath: destination.path) {
                try! fileManager.removeItem(atPath: destination.path)
            }
            try! fileManager.moveItem(atPath: location!.path,
                                      toPath: destination.path)
                
            DispatchQueue.main.async {
                do {
                    let model = try Entity.load(contentsOf: destination)
                    let anchor = AnchorEntity(world: [0,-0.2,0])
                        anchor.addChild(model)
                    anchor.scale = [5,5,5]
                    self.arView.scene.addAnchor(anchor)
                    
                    model.playAnimation(model.availableAnimations.first!.repeat())
                } catch {
                    print("Fail loading entity.")
                }
            }
        })
        downloadTask.resume()
    }
}
