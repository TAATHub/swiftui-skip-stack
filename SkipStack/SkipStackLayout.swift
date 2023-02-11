import SwiftUI

struct SkipStackLayout: Layout {
    var spacing: CGFloat? = 0
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let sizes = size(subviews: subviews)
        var nextX = bounds.minX

        for (index, subview) in subviews.enumerated() {
            print(nextX + sizes[index].width)
            if nextX + sizes[index].width > bounds.width {
                // subviewの配置をスキップできない？
                continue
            }
            nextX += sizes[index].width/2

            let point = CGPoint(x: nextX, y: bounds.midY)
            subview.place(at: point, anchor: .center, proposal: .unspecified)

            nextX += sizes[index].width/2 + spacing!
        }
    }
    
    func explicitAlignment(of guide: HorizontalAlignment, in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGFloat? {
        return nil
    }
    
    /// サブビュー内のサイズの配列を取得する
    private func size(subviews: Subviews) -> [CGSize] {
        let subviewSizes = subviews.map { $0.sizeThatFits(.unspecified) }
        return subviewSizes
    }
    
    /// サブビュー間のスペースの配列を取得する
    private func spacing(subviews: Subviews) -> [CGFloat] {
        subviews.indices.map { index in
            guard index < subviews.count - 1 else { return 0 }
            return subviews[index].spacing.distance(to: subviews[index + 1].spacing, along: .horizontal)
        }
    }
}
