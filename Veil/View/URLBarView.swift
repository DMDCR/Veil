import SwiftUI

struct URLBarView: View {
    @ObservedObject var viewModel: WebViewModel
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var isShowingBookmarks = false
    var body: some View {
        VStack {
            HStack{
                HStack{
                    Image(systemName: "globe")
                        .padding(.horizontal, 1)
                        .foregroundColor(Color.accentColor)
                    
                    TextField("Enter URL...",text: $viewModel.url, onCommit: {commitURL()})
                        .foregroundColor(Color("TextColor"))
                        .padding(2)
                        .font(.footnote)
                        .font(.system(size:40, weight: .bold))
                        .keyboardType(.webSearch)
                    
                    Spacer()
                    Button(action:{
                        viewModel.webViewNavigationPublisher.send(.reload)
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .font(.system(size:16))
                            .foregroundColor(Color.accentColor)
                            .padding(.horizontal, 4)
                        HStack {
                            Button(action:{
                                viewModel.webViewNavigationPublisher.send(.backward)
                            }) {
                                Image(systemName: "arrow.backward")
                                    .font(.system(size:16))
                                    .foregroundColor(Color.accentColor)
                                
                            }
                            
                            Button(action:{
                                viewModel.webViewNavigationPublisher.send(.forward)
                            }) {
                                Image(systemName: "arrow.forward")
                                    .font(.system(size:15))
                                    .foregroundColor(Color.accentColor)
                            }
                            }
                        }
                    }
                }
                .padding(.horizontal, 2)
                .padding(.vertical, 5)
                .cornerRadius(10.0)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(UIColor.systemGray5)))
                }
            .padding(.horizontal, 15)
            .padding(.bottom, 5)
        }
    func commitURL(){
        viewModel.webViewNavigationPublisher.send(WebViewNavigation.load)
    }
    
}
