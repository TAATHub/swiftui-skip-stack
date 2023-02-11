import SwiftUI

struct ContentView: View {
    let icons = Array(1...20).map { String($0) }
    
    var body: some View {
        HStack {
            SkipStackView(icons: icons, size: 60, spacing: 4)
            Color.red.frame(width: 80, height: 60)
        }
        .padding()
    }
}
