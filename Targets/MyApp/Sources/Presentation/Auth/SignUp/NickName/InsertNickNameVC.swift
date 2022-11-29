
import Cocoa
import Then
import SnapKit
import Alamofire

final class InsertNickNameVC: NSViewController{
    
    private let mainLogoImageView = NSImageView(image: NSImage(named: "Paper_Smile")!).then{
        $0.wantsLayer = true
        $0.layer?.contentsGravity = .resizeAspect
    }
    
    private let backButton = NSButton().then{
        $0.image = NSImage(systemSymbolName: "chevron.backward", accessibilityDescription: "back")
        $0.bezelStyle = .recessed
        $0.action = Selector(("backButtonDidTap"))
        $0.layer?.backgroundColor = NSColor.white.cgColor
    }
    
    private let idTextField = NSTextField().then{
        $0.wantsLayer = true
        $0.placeholderString = "사용할 닉네임 입력"
        $0.placeholderAttributedString = NSAttributedString(string: "사용할 닉네임 입력", attributes: [
            NSAttributedString.Key.font: NSFont.systemFont(ofSize: 20.0, weight: .medium), NSAttributedString.Key.foregroundColor : NSColor.gray.cgColor
        ])
        $0.layer?.backgroundColor = PaperPAsset.Colors.paperBlankColor.color.cgColor
    
        $0.isBezeled = true
        $0.bezelStyle = .squareBezel
        $0.isBordered = false
        
        $0.textColor = NSColor.white
        $0.isEditable = true
        $0.isSelectable = true
        
        $0.allowsEditingTextAttributes = true
        $0.lineBreakMode = .byTruncatingTail
        $0.font = NSFont(name: "Helvetica", size: 20)
        $0.focusRingType = .none
        $0.usesSingleLineMode = false
    }
    
    private let doneButton = NSButton().then{
        $0.wantsLayer = true
        $0.layer?.cornerRadius = 10
        $0.attributedTitle = NSAttributedString(string: "완료", attributes:[ NSAttributedString.Key.foregroundColor : NSColor.black.cgColor])
        $0.font = NSFont(name: "Helvetica-Bold", size: 14)
        $0.bezelStyle = .shadowlessSquare
        $0.layer?.backgroundColor = PaperPAsset.Colors.paperBlankColor.color.cgColor
        $0.action = Selector(("NextButtonDidTap"))
    }
    
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
        [mainLogoImageView,
         backButton,
         idTextField,
         doneButton
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
        backButton.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.left.equalTo(10)
            make.size.equalTo(20)
        }
        idTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(15)
            make.height.equalTo(35)
            make.top.equalTo(mainLogoImageView.snp.bottom).offset(20)
        }
        doneButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(idTextField.snp.bottom).offset(30)
            make.width.equalToSuperview().inset(15)
            make.height.equalTo(45)
        }
    }
    @objc func backButtonDidTap(){
        let vc = IntroVC()
        self.view.window?.contentViewController = vc
    }
    
    @objc func NextButtonDidTap(){
        
    }
}
