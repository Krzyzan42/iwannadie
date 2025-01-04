import SwiftUI

enum NavigationTarget :Hashable {
    case PlantDetail(id: Int)
    case AddPlant(id: Int)
}

struct RootNavigation<Content: View>: View {
    

    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        NavigationStack() {
            content
            .navigationDestination(for: NavigationTarget.self) { target in 
                switch target {
                    case .PlantDetail(let id):
                        PlantDetailView(plant: get_plant(id: id))
                            .navigationBarHidden(true)
                    case .AddPlant(let id):
                        AddPlantView(plant: get_plant(id: id))
                            .navigationBarHidden(true)
                }
            }
        }
    }
}