import Foundation
import Combine

class WebViewModel: ObservableObject{
    var webViewNavigationPublisher = PassthroughSubject<WebViewNavigation, Never>()
    var showWebTitle: String = "DMD"
    var showLoader = PassthroughSubject<Bool, Never>()
    @Published var url: String = "https://dmdtutorials.com"
}

enum WebViewNavigation {
    case backward, forward, reload, load
}


