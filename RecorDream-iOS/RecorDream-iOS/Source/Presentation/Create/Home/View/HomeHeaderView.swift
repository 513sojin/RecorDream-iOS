//
//  HomeHeaderView.swift
//  RecorDream-iOS
//
//  Created by Sojin Lee on 2022/07/11.
//

import UIKit
import Then
import SnapKit

class HomeHeaderView: BaseView {
    // MARK: - Properties
    let logo = UIImageView().then {
        $0.image = Constant.Image.icnRDSmallLogo
    }
    
    let searchButton = UIButton().then {
        $0.setImage(Constant.Image.icnSearch, for: .normal)
    }
    
    let profileButton = UIButton().then {
        $0.setImage(Constant.Image.icnProfile, for: .normal)
    }
    
    lazy var iconStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 4
        $0.addArrangedSubviews(searchButton, profileButton)
    }
    
    // MARK: - Functions
    override func setupView() {
        addSubviews(logo,iconStackView)
    }
    
    override func setupConstraint() {
        logo.snp.makeConstraints { make in
            make.width.equalTo(140)
            make.height.equalTo(24)
            make.leading.equalToSuperview().offset(11)
            make.centerY.equalToSuperview()
        }
        
        [searchButton,profileButton].forEach {
            $0.snp.makeConstraints { make in
                make.height.width.equalTo(24)
            }
        }
        
        iconStackView.snp.makeConstraints { make in
            make.width.equalTo(52)
            make.height.equalTo(24)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
        }
    
    }
}
