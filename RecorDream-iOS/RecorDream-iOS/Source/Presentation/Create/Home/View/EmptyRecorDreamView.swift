//
//  EmptyRecorDreamView.swift
//  RecorDream-iOS
//
//  Created by Sojin Lee on 2022/07/11.
//

import UIKit
import SnapKit
import Then

class EmptyRecorDreamView: BaseView {
    var userName: String? {
        didSet {
            setLabel()
        }
    }
    
    lazy var welcomeLabel = UILabel().then {
        $0.text = "반가워요, \(userName ?? "")님!\n꿈의 기록을 채워주세요."
        $0.font = .systemFont(ofSize: 24, weight: .ultraLight)
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLabel()
    }
    
    override func setupView() {
        addSubview(welcomeLabel)
    }
    
    override func setupConstraint() {
        welcomeLabel.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }
    
    func setLabel() {
        guard let label = welcomeLabel.text else { return }
        var userNameCount: Int
        if let count = userName?.count {
            userNameCount = 8 + count
        } else {
            userNameCount = 8
        }
        let attributedStr = NSMutableAttributedString(string: label)
        attributedStr.addAttribute(.font, value: UIFont.systemFont(ofSize: 24, weight: .heavy), range: NSRange.init(location: 0, length: userNameCount))
        welcomeLabel.numberOfLines = 0
        welcomeLabel.attributedText = attributedStr
    }
    
    func setUserName(_ name: String ) {
        welcomeLabel.text = "반가워요, \(name)님!\n꿈의 기록을 채워주세요."
        userName = name
    }
}
