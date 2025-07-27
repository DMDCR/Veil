
import SwiftUI
import WebKit

struct BrowserPage: View{
    @ObservedObject var viewModel = WebViewModel()
    
    var body: some View {
        VStack{
            URLBarView(viewModel: viewModel)
            
            HStack{
                WebView(viewModel: viewModel)
                    .clipShape(trc(radius: 16))
                    .ignoresSafeArea(edges: [.horizontal, .bottom])

            }


        }
    }
}
struct trc: Shape {
    var radius: CGFloat = 16
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRoundedRect(in: rect, cornerSize: CGSize(width: radius, height: radius), style: .continuous)
        
        // Clip only the top corners by manipulating the path
        return path
    }
}

struct BrowserPage_Previews: PreviewProvider {
    static var previews: some View {
        BrowserPage()
        BrowserPage()
            .preferredColorScheme(.dark)
    }
}
