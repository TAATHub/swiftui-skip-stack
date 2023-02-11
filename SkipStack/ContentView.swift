import SwiftUI

struct SkipStackView: View {
    var icons: [String]
    var size: CGFloat
    var spacing: CGFloat

    var body: some View {
        // HStackの横幅を取得したいのでGeometryReaderで囲む
        GeometryReader { geometry in
            HStack(spacing: spacing) {
                ForEach(Array(icons.enumerated()), id: \.element) { offset, icon in
                    // 右端のx座標を計算
                    let rightEdgeX: CGFloat = CGFloat(offset+1) * size + CGFloat(offset) * spacing
                    // 右端がgeometryの幅を超えない場合のみ表示する
                    if rightEdgeX <= geometry.size.width {
                        IconView(title: icon, size: size)
                    }
                }
            }
            .frame(maxHeight: .infinity)
        }
    }
}

struct IconView: View {
    var title: String
    var size: CGFloat
    
    var body: some View {
        Text(title)
            .font(.system(size: 24, weight: .bold))
            .frame(width: size, height: size)
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Circle())
    }
}
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
