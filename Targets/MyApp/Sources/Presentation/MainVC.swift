
import Cocoa
import Then
import SnapKit
import Alamofire

final class MainVC: NSViewController {
    
    private let checkBoxButton = NSButton(checkboxWithTitle: "실행시 자동 로그인", target: nil, action: nil).then{
        $0.contentTintColor = NSColor.clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayout()
    }
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 390, height: 610))
        view.wantsLayer = true
    }
    
    func addView(){
        view.addSubview(checkBoxButton)
    }
    
    func setLayout(){
        checkBoxButton.snp.makeConstraints { make in
            make.left.equalTo(100)
            make.top.equalTo(100)
        }
    }
}
