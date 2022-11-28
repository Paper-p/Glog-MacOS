
import Cocoa
import Then
import SnapKit
import Alamofire

final class SignInVC: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayout()
        view.layer?.backgroundColor = PaperPAsset.Colors.paperBackgroundColor.color.cgColor
    }
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 800, height: 610))
        view.wantsLayer = true
    }
    
    func addView(){
        [
        ]
            .forEach {
            view.addSubview($0)
        }
    }
    
    func setLayout(){
        
    }
}
