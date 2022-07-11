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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }
    
    override func setHierarchy() {
        view.addSubview(headerView)
    }
    
    private func setupConstraints() {
        headerView.snp.makeConstraints { make in
            make.height.equalTo(68)
            make.leading.trailing.top.equalTo(view.safeAreaLayoutGuide)
        }

    }

}
