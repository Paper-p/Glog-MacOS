
import Then
import SnapKit
import Alamofire

final class InsertPwdVC: NSViewController{
    
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
    
    private let pwdTextField = NSSecureTextField().then{
        $0.wantsLayer = true
        $0.placeholderString = "사용할 비밀번호 입력"
        $0.placeholderAttributedString = NSAttributedString(string: "사용할 비밀번호 입력", attributes: [
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
    
    private let rePwdTextField = NSSecureTextField().then{
        $0.wantsLayer = true
        $0.placeholderString = "사용할 비밀번호 한번더 입력"
        $0.placeholderAttributedString = NSAttributedString(string: "사용할 비밀번호 한번더 입력", attributes: [
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
    
    private let nextButton = NSButton().then{
        $0.wantsLayer = true
        $0.layer?.cornerRadius = 10
        $0.attributedTitle = NSAttributedString(string: "다음", attributes:[ NSAttributedString.Key.foregroundColor : NSColor.black.cgColor])
        $0.font = NSFont(name: "Helvetica-Bold", size: 14)
        $0.bezelStyle = .shadowlessSquare
        $0.layer?.backgroundColor = PaperPAsset.Colors.paperBlankColor.color.cgColor
        $0.action = Selector(("nextButtonDidTap"))
    }
    
    private let includeTextView = NSTextView().then{
        $0.string = "비밀번호는 8자리 이상 및 기호를 포함해주세요."
        $0.font = NSFont(name: "Helvetica", size: 14)
        $0.textColor = NSColor.white
        $0.isEditable = false
        $0.isSelectable = false
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
         pwdTextField,
         rePwdTextField,
         nextButton,
         includeTextView
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
        pwdTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(15)
            make.height.equalTo(35)
            make.top.equalTo(mainLogoImageView.snp.bottom).offset(20)
        }
        rePwdTextField.snp.makeConstraints { make in
            make.centerX.equalTo(pwdTextField)
            make.size.equalTo(pwdTextField)
            make.top.equalTo(pwdTextField.snp.bottom).offset(15)
        }
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(rePwdTextField.snp.bottom).offset(30)
            make.width.equalToSuperview().inset(15)
            make.height.equalTo(45)
        }
        includeTextView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(nextButton.snp.bottom).offset(17)
            make.width.equalTo(280)
            make.height.equalTo(17)
        }
    }
    @objc func backButtonDidTap(){
        let vc = InsertIdVC()
        self.view.window?.contentViewController = vc
    }
    
    @objc func nextButtonDidTap(){
        let vc = InsertNickNameVC()
        self.view.window?.contentViewController = vc
    }
}
