import SwiftUI

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

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(title: "1", size: 60)
    }
}
