
import SwiftUI
import WebKit

struct BrowserPage: View{
    @ObservedObject var viewModel = WebViewModel()
    
    var body: some View {
        VStack{
            URLBarView(viewModel: viewModel)
            
            HStack{
                WebView(viewModel: viewModel)
            }
            

        }
    }
}


struct BrowserPage_Previews: PreviewProvider {
    static var previews: some View {
        BrowserPage()
        BrowserPage()
            .preferredColorScheme(.dark)
    }
}
