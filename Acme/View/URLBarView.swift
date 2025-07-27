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
                        .keyboardType(.webSearch)
                    
                    Spacer()
                    //Add current text val to bookmarks
                    Button(action:{
                        viewModel.webViewNavigationPublisher.send(.reload)
                    }) {
                        Image(systemName: "arrow.clockwise")
                            .font(.system(size:16))
                            .foregroundColor(Color.accentColor)
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

                            
                            
                            
                            .sheet(isPresented: $isShowingBookmarks, content: {
                                BookmarksView(isShowing: $isShowingBookmarks, viewModel: viewModel)
                                    .environment(\.managedObjectContext, self.managedObjectContext)
                            })
                        }
                    }
                }
                .padding(5)
                .cornerRadius(4.0)
                .background(Capsule().strokeBorder(Color("TextColor"), lineWidth: 1.25 ))
                Button(action:{
                    let bookmark = Bookmark(context: managedObjectContext)
                    bookmark.name = viewModel.showWebTitle
                    bookmark.url = viewModel.url
                    PersistenceController.shared.saveContext()
                    
                }) {
 
                }
                
                
                
            }
            

            .padding(.horizontal, 20)
        }
        
        
        
    }
    
    func commitURL(){
        viewModel.webViewNavigationPublisher.send(WebViewNavigation.load)
    }
    
}
