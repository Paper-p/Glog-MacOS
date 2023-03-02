
import Then
import SnapKit
import Alamofire

final class SignInVC: NSViewController{
    
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
    
    private let idTextField = NSTextField().then{
        $0.wantsLayer = true
        $0.placeholderString = "아이디"
        $0.placeholderAttributedString = NSAttributedString(string: "아이디", attributes: [
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
    
    private let pwdTextField = NSSecureTextField().then{
        $0.wantsLayer = true
        $0.placeholderString = "비밀번호"
        $0.placeholderAttributedString = NSAttributedString(string: "비밀번호", attributes: [
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
    
    private let signInButton = NSButton().then{
        $0.wantsLayer = true
        $0.layer?.cornerRadius = 10
        $0.attributedTitle = NSAttributedString(string: "로그인", attributes:[ NSAttributedString.Key.foregroundColor : NSColor.black.cgColor])
        $0.font = NSFont(name: "Helvetica-Bold", size: 14)
        $0.bezelStyle = .shadowlessSquare
        $0.layer?.backgroundColor = PaperPAsset.Colors.paperStartColor.color.cgColor
        $0.action = Selector(("SignInButtonDidTap"))
    }
    
    private let forgotPwdButton = NSButton().then{
        $0.wantsLayer = true
        $0.attributedTitle = NSAttributedString(string: "비밀번호를 잊어 버리셨나요?", attributes:[ NSAttributedString.Key.foregroundColor : PaperPAsset.Colors.paperStartColor.color.cgColor])
        $0.bezelStyle = .texturedSquare
        $0.layer?.backgroundColor = PaperPAsset.Colors.paperBackgroundColor.color.cgColor
    }
    
    private let viewModel = SignInVM()
    
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
         welcomeTextView,
         backButton,
         idTextField,
         pwdTextField,
         signInButton,
         forgotPwdButton
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
        idTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(15)
            make.height.equalTo(35)
            make.top.equalTo(welcomeTextView.snp.bottom).offset(20)
        }
        pwdTextField.snp.makeConstraints { make in
            make.centerX.equalTo(idTextField)
            make.size.equalTo(idTextField)
            make.top.equalTo(idTextField.snp.bottom).offset(15)
        }
        signInButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(pwdTextField.snp.bottom).offset(30)
            make.width.equalToSuperview().inset(15)
            make.height.equalTo(45)
        }
        forgotPwdButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signInButton.snp.bottom).offset(15)
        }
    }
    
    
}
