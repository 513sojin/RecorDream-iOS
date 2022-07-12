//
//  HomeViewController.swift
//  RecorDream-iOS
//
//  Created by Sojin Lee on 2022/07/11.
//

import UIKit
import SnapKit
import Then

class HomeViewController: BaseViewController {

    let headerView = HomeHeaderView()
    let emptyRecorDreamView = EmptyRecorDreamView()
    let recorDreamView = RecorDreamView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        emptyRecorDreamView.setUserName("소진") // TODO: - user name 넣기
    }
    
    override func setHierarchy() {
        view.addSubviews(headerView, emptyRecorDreamView)
    }
    
    private func setupConstraints() {
        headerView.snp.makeConstraints { make in
            make.height.equalTo(68)
            make.leading.trailing.top.equalTo(view.safeAreaLayoutGuide)
        }
        
        emptyRecorDreamView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }

}
