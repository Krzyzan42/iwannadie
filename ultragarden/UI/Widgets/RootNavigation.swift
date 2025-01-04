import SwiftUI

struct RootNavigation<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        NavigationStack() {
            content
            .navigationDestination(for: Int.self) { id in 
                PlantDetailView(plant: get_plant(id: id))
                    .navigationBarHidden(true)
            }
        }
    }
}