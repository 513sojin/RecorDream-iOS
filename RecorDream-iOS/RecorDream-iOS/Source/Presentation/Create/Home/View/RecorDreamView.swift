//
//  RecorDreamView.swift
//  RecorDream-iOS
//
//  Created by Sojin Lee on 2022/07/11.
//

import UIKit
import SnapKit
import Then

enum TypeConst {
    static let itemSize = CGSize(width: 300, height: 400)
    static let itemSpacing = 24.0
    
    static var insetX: CGFloat {
        (UIScreen.main.bounds.width - TypeConst.itemSize.width) / 2.0
    }
    
    static var collectionViewContentInset: UIEdgeInsets {
        UIEdgeInsets(top:0, left: TypeConst.insetX, bottom: 0, right: TypeConst.insetX)
    }
}

class RecorDreamView: BaseView {
    
    static let itemSpacing = 24.0
    let homeUserNameView = HomeUserNameView()
    
    let collectionViewFlowLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
        $0.itemSize = TypeConst.itemSize
        $0.minimumLineSpacing = RecorDreamView.itemSpacing
        $0.sectionInset = TypeConst.collectionViewContentInset
    }
    
    lazy var carouselCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout).then {
        $0.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: CardCollectionViewCell.identifier)
        $0.isPagingEnabled = false
        $0.decelerationRate = .fast
        $0.contentInsetAdjustmentBehavior = .never
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        homeUserNameView.setWelcomLabel()
    }
    
    override func setupView() {
        addSubviews(homeUserNameView)
    }
    
    override func setupConstraint() {
        homeUserNameView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(23)
            make.top.equalToSuperview().offset(11)
        }
    }
    
    func setUserName(_ name: String) {
        homeUserNameView.setUserName(name)
    }
}


