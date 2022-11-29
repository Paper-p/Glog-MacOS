
import Cocoa
import Then
import SnapKit
import Alamofire

final class IntroVC: NSViewController {
    
    private let backGroundImageView = NSImageView(image: NSImage(named: "Paper_Background")!).then{
        $0.wantsLayer = true
        $0.layer?.contentsGravity = .resizeAspect
    }
    
    private let blurMainView = NSView().then{
        $0.wantsLayer = true
        $0.layerUsesCoreImageFilters = true
        $0.layer?.backgroundColor = NSColor(red: 0, green: 0, blue: 0, alpha: 0.52).cgColor

        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter?.setDefaults()
        blurFilter?.setValue(5, forKey: kCIInputRadiusKey)
        $0.layer?.backgroundFilters?.append(blurFilter!)
        $0.layer?.cornerRadius = 70
    }
    
    private let mainLogoImageView = NSImageView(image: NSImage(named: "Paper_MainLogo")!).then{
        $0.wantsLayer = true
    }
    
    private let mainLabel = NSTextView().then{
        $0.string = "여기에서 너의 생각을 남들에게 이야기해봐"
        $0.backgroundColor = .clear
        $0.isSelectable = false
        $0.font = NSFont(name: "Helvetica", size: 14)
        $0.alignment = .center
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
    
    private let signUpButton = NSButton().then{
        $0.wantsLayer = true
        $0.attributedTitle = NSAttributedString(string: "회원이 아니시라고요?", attributes:[ NSAttributedString.Key.foregroundColor : PaperPAsset.Colors.paperStartColor.color.cgColor])
        $0.bezelStyle = .texturedSquare
        $0.layer?.backgroundColor = PaperPAsset.Colors.paperBackgroundColor.color.cgColor
        $0.action = Selector(("SignUpButtonDidTap"))
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
        [backGroundImageView,
         blurMainView,
         mainLogoImageView,
         mainLabel,
         signInButton,
         signUpButton
        ]
            .forEach {
            view.addSubview($0)
        }
    }
    
    func setLayout(){
        backGroundImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.size.equalTo(400)
            make.top.equalToSuperview()
        }
        blurMainView.snp.makeConstraints { make in
            make.centerX.equalTo(backGroundImageView)
            make.centerY.equalTo(backGroundImageView)
            make.size.equalTo(200)
        }
        mainLogoImageView.snp.makeConstraints { make in
            make.centerX.equalTo(blurMainView)
            make.top.equalTo(blurMainView).offset(10)
            make.size.equalTo(140)
        }
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalTo(blurMainView)
            make.bottom.equalTo(mainLogoImageView).offset(10)
            make.width.equalTo(128)
            make.height.equalTo(42)
        }
        signInButton.snp.makeConstraints { make in
            make.centerX.equalTo(blurMainView)
            make.top.equalTo(blurMainView.snp.bottom).offset(150)
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
        signUpButton.snp.makeConstraints { make in
            make.centerX.equalTo(signInButton)
            make.top.equalTo(signInButton.snp.bottom).offset(16)
        }
    }
    
    //MARK: Action
    @objc func SignInButtonDidTap(){
        let vc = SignInVC()
        self.view.window?.contentViewController = vc
    }
    
    @objc func SignUpButtonDidTap(){
        let vc = InsertIdVC()
        self.view.window?.contentViewController = vc
    }
}
