//
//  SkipStackView.swift
//  SkipStack
//
//  Created by TAAT on 2023/02/11.
//

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

struct SkipStackView_Previews: PreviewProvider {
    static var previews: some View {
        SkipStackView(icons: Array(1...20).map { String($0) }, size: 60, spacing: 4)
    }
}
