import SwiftUI
import RealityKit
import ARKit
import FocusEntity
import Combine
import AlertToast

struct RestaurantARView: View {
    @State private var modelEntities: [ModelEntity] = []
    @State private var arCoordinator: ARContainerView.Coordinator?
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // Directly using the single item from arItemsHare
    @State private var selectedModelName: String? = arItemsHare.first?.model
    
    var body: some View {
        NavigationView {
            ZStack {
                ARContainerView(selectedModelName: $selectedModelName, modelEntities: $modelEntities)
            }
            .navigationTitle("Golden Hare")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.white)
                Text("Back")
                    .foregroundColor(.white)
            })
            .edgesIgnoringSafeArea([.top, .bottom])
        }
    }
}


struct RestaurantARContainerView: UIViewRepresentable {
    @Binding var selectedModelName: String?
    @Binding var modelEntities: [ModelEntity]

    func makeUIView(context: Context) -> ARView {
        let view = ARView()
        
        let session = view.session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal]
        session.run(config)
        
        let coachingOverlay = ARCoachingOverlayView()
        coachingOverlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coachingOverlay.session = session
        coachingOverlay.goal = .horizontalPlane
        view.addSubview(coachingOverlay)
        
        context.coordinator.view = view
        session.delegate = context.coordinator
        
        view.addGestureRecognizer(
            UITapGestureRecognizer(
                target: context.coordinator,
                action: #selector(Coordinator.handleTap)
            )
        )
        
        return view
    }

    func updateUIView(_ uiView: ARView, context: Context) {

    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(selectedModelName: $selectedModelName)
    }

    class Coordinator: NSObject, ARSessionDelegate {
        weak var view: ARView?
        var selectedModelName: Binding<String?>
        var focusEntity: FocusEntity?
        var addedAnchors: [AnchorEntity] = []
        
        init(selectedModelName: Binding<String?>) {
            self.selectedModelName = selectedModelName
            
            super.init()
        }

        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            guard let view = self.view else { return }

            if self.focusEntity == nil {
                self.focusEntity = FocusEntity(on: view, style: .classic(color: .yellow))
            } else {
            }
        }
        
        @objc func handleTap(gesture: UITapGestureRecognizer) {
            guard let view = self.view, let focusEntity = self.focusEntity else { return }

            if let modelName = selectedModelName.wrappedValue {
                let anchor = AnchorEntity()
                view.scene.anchors.append(anchor)

                let modelEntity = try! ModelEntity.loadModel(named: modelName)
                modelEntity.scale = [0.05, 0.05, 0.05]
                modelEntity.position = focusEntity.position
                modelEntity.generateCollisionShapes(recursive: true)
                view.installGestures([.all], for: modelEntity)

                anchor.addChild(modelEntity)

                addedAnchors.append(anchor)
            }
        }
    }
}

struct BottomSheetRestaurant: View {
    @Binding var selectedModelName: String?
    @State private var showBiddingView: Bool = false
    @State private var showToast: Bool = false

    var body: some View {
        VStack {
            HStack {
                Text("Surprise Box")
                    .font(.system(size: 22, design: .rounded)).bold()
                    .foregroundColor(.white)
                    .padding(.leading, 24)
                    .padding(.top, 12)
                
                Spacer()
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(arItems) { item in
                        VStack {
                            Image(item.imageURL)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .cornerRadius(12)

                                .onTapGesture {
                                    selectedModelName = item.model
                                    showToast.toggle()
                                }
                        }
                        .sheet(isPresented: $showBiddingView) {
                        }
                    }
                }
            }
            .padding()
            .offset(y: -10)
            .padding(.bottom, 14)
        }
        .background(BlurView())
        .cornerRadius(18)
        .toast(isPresenting: $showToast){
            AlertToast(type: .regular, title: "Place object")
        }
    }
}

#Preview {
    ARExperienceView()
}

