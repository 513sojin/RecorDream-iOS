//
//  SearchView.swift
//  RecorDream-iOS
//
//  Created by 정은희 on 2022/07/18.
//

import UIKit

import SnapKit
import Then

final class SearchView: BaseView {
    // MARK: - Properties
    let navigationBarView = RecordHeaderView().then {
        $0.setHeaderView(HiddenMoreBtn: true, headerLabelText: "검색하기")
    }
    private lazy var searchInputLabel = UILabel().then {
        $0.font = TypoStyle.title2.font
        $0.text = "검색어 입력"
        $0.textColor = ColorType.white01.color
    }
    let searchTextField = UITextField().then {
        $0.addLeftPadding(width: 46)
        $0.attributedPlaceholder = NSAttributedString(string: "어떤 기록을 찾고 있나요?", attributes: [NSAttributedString.Key.foregroundColor : ColorType.white02.color])
        $0.backgroundColor = ColorType.lightBlue02.color
        $0.font = TypoStyle.title2.font
        $0.keyboardAppearance = .dark
        $0.returnKeyType = .done    // TODO: - 뷰컨에서 완료버튼 누르면 키보드 내려가고, 검색 결과에 해당하는 셀 보여줌
        $0.makeRoundedWithBorder(radius: 8, borderColor: ColorType.white04.color.cgColor)
        $0.textColor = ColorType.white01.color
    }
    private lazy var searchImage = UIImageView().then {
        $0.image = ImageList.icnSearch.image
        $0.contentMode = .scaleAspectFit
        $0.tintColor = ColorType.white01.color
    }
    let searchResultTableView = UITableView().then {
        $0.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.reuseIdentifier)
        $0.register(SearchHeaderTableViewCell.self, forHeaderFooterViewReuseIdentifier: SearchHeaderTableViewCell.reuseIdentifier)
        $0.register(SearchFooterTableViewCell.self, forHeaderFooterViewReuseIdentifier: SearchFooterTableViewCell.reuseIdentifier)
        $0.estimatedRowHeight = UITableView.automaticDimension
        $0.sectionFooterHeight = 114.adjustedHeight
        $0.sectionHeaderHeight = 49.adjustedHeight
        $0.rowHeight = UITableView.automaticDimension
        $0.separatorStyle = .none
        $0.separatorInset = UIEdgeInsets(
            top: 12, left: 16, bottom: 0, right: 16
        )
        $0.scrollsToTop = true
        $0.showsVerticalScrollIndicator = false
    }
    
    // MARK: - Functions
    override func setupView() {
        self.addSubviews(navigationBarView, searchInputLabel, searchTextField, searchImage, searchResultTableView)
    }
    override func setupConstraint() {
        self.navigationBarView.snp.makeConstraints { make in
            make.height.equalTo(67.adjustedHeight)
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
        self.searchInputLabel.snp.makeConstraints { make in
            make.top.equalTo(navigationBarView.snp.bottom).offset(31)
            make.leading.equalToSuperview().offset(24)
        }
        self.searchTextField.snp.makeConstraints { make in
            make.width.equalTo(343.adjustedWidth)
            make.height.equalTo(50.adjustedHeight)
            make.centerX.equalToSuperview()
            make.top.equalTo(searchInputLabel.snp.bottom).offset(8)
        }
        self.searchImage.snp.makeConstraints { make in
            make.width.equalTo(24.adjustedWidth)
            make.height.equalTo(24.adjustedHeight)
            make.centerY.equalTo(searchTextField)
            make.leading.equalToSuperview().offset(30)
        }
        self.searchResultTableView.snp.makeConstraints { make in
            make.width.equalTo(375.adjustedWidth)
            make.height.equalTo(588.adjustedHeight)
            make.top.equalTo(searchTextField.snp.bottom)
            make.leading.bottom.equalToSuperview()
        }
    }
}