import SwiftUI

struct ContentView: View {
    // Use @State for selected to allow SwiftUI to observe changes
    @State private var selected = "Squash"
    
    let activities = ["Archery", "Baseball", "Basketball", "Bowling", "Boxing", "Cricket", "Curling", "Fencing", "Golf", "Hiking", "Lacrosse", "Rugby", "Squash"]

    var body: some View {
        VStack {
            Text("WHY NOT TRY!!")
                .font(.largeTitle.bold())
            
            Circle()
                .fill(.green)
                .padding()
                .overlay(
                    Image(systemName: "figure.\(selected.lowercased())")
                        .font(.system(size: 144))
                        .foregroundColor(.white)
                )
            
            Text("\(selected)!!!")
                .font(.title)
        }
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onEnded { value in
                // Handle swipe gestures
                if value.translation.width > 0 {
                    // Swipe right (forward)
                    if let currentIndex = activities.firstIndex(of: selected) {
                        let nextIndex = (currentIndex + 1) % activities.count
                        selected = activities[nextIndex]
                    }
                } else if value.translation.width < 0 {
                    // Swipe left (backward)
                    if let currentIndex = activities.firstIndex(of: selected) {
                        let previousIndex = (currentIndex - 1 + activities.count) % activities.count
                        selected = activities[previousIndex]
                    }
                }
                // You can handle up and down swipes if needed
            }
        )
    }
}

#Preview {
    ContentView()
}

