
import Cocoa
import Then
import SnapKit
import Alamofire

final class MainVC: NSViewController {
    
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
        $0.font = NSFont(name: "Helvetica-Bold", size: 14)
        $0.alignment = .center
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setLayout()
    }
    
    override func loadView() {
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 800, height: 610))
        view.wantsLayer = true
    }
    
    func addView(){
        view.addSubview(backGroundImageView)
        view.addSubview(blurMainView)
        view.addSubview(mainLogoImageView)
        view.addSubview(mainLabel)
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
    }
}
