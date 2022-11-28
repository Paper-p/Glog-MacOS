
import Cocoa
import Then
import SnapKit
import Alamofire

final class SignInVC: NSViewController {
    
    private let mainLogoImageView = NSImageView(image: NSImage(named: "Paper_MainLogo")!).then{
        $0.wantsLayer = true
        $0.layer?.contentsGravity = .resizeAspect
    }
    
    private let welcomeTextView = NSTextView().then{
        $0.string = "다시 온걸 환영해요!"
        $0.font = NSFont(name: "Helvetica-Bold", size: 14)
        $0.textColor = NSColor.white
        $0.backgroundColor = PaperPAsset.Colors.paperBackgroundColor.color
        $0.isEditable = false
        $0.isSelectable = false
    }
    
    private let backButton = NSButton().then{
        $0.image = NSImage(systemSymbolName: "chevron.backward", accessibilityDescription: "back")
        $0.bezelStyle = .recessed
        $0.action = Selector(("backButtonDidTap"))
        $0.layer?.backgroundColor = NSColor.white.cgColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayout()
        view.layer?.backgroundColor = PaperPAsset.Colors.paperBackgroundColor.color.cgColor
        view.window?.title = "Asdf"
    }
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 800, height: 610))
        view.wantsLayer = true
    }
    
    func addView(){
        [mainLogoImageView,
         welcomeTextView,
         backButton
        ]
            .forEach {
            view.addSubview($0)
        }
    }
    
    func setLayout(){
        mainLogoImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(30)
            make.width.equalTo(170)
            make.height.equalTo(100)
        }
        welcomeTextView.snp.makeConstraints { make in
            make.centerX.equalToSuperview().offset(25)
            make.top.equalTo(mainLogoImageView.snp.bottom).offset(10)
            make.width.equalTo(154)
            make.height.equalTo(24)
        }
        backButton.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.size.equalTo(20)
        }
    }
    @objc func backButtonDidTap(){
        let vc = IntroVC()
        self.view.window?.contentViewController = vc
    }
}
