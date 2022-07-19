//
//  MyPageViewController.swift
//  RecorDream-iOS
//
//  Created by 임윤휘 on 2022/07/14.
//

import UIKit

class MyPageViewController: BaseViewController {
    @IBOutlet var settingView: [UIView]!
    @IBOutlet weak var dropOutButton: UIButton!
    @IBOutlet weak var dreamAlarmButton: CustomSwitchButton!
    @IBOutlet weak var timeSettingLabel: UILabel!
    @IBOutlet weak var timeSettingButton: UIButton!
    @IBOutlet weak var userNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    private func configureView() {
        settingView.forEach { view in
            view.makeRoundedWithBorder(
                radius: CGFloat(8),
                borderColor: ColorType.lightBlue03.color.cgColor
            )
        }
        dropOutButton.setUnderline(at: dropOutButton, state: .normal)
        
        userNameTextField.delegate = self
        configureDreamAlarmButton()
    }
    
    private func configureDreamAlarmButton(){
        dreamAlarmButton.isOn = false
        if !dreamAlarmButton.isOn {
            self.timeSettingButton.setTitle(nil, for: .normal)
            self.timeSettingLabel.textColor = ColorType.white03.color
        }
        
        dreamAlarmButton.completion = {[weak self] isOn in
            guard let self = self else { return }
            
            if isOn {
                self.presentTimeSettingView()
                return
            }
            self.timeSettingButton.setTitle(nil, for: .normal)
            self.timeSettingLabel.textColor = ColorType.white03.color
        }
    }
    
    private func presentTimeSettingView() {
        let timeSettingViewController = TimeSettingViewController.instanceFromNib()
        timeSettingViewController.modalPresentationStyle = .overFullScreen
        timeSettingViewController.delegate = self
        
        self.present(timeSettingViewController, animated: false){
            timeSettingViewController.showBottomSheet()
        }
    }
    
    @IBAction func didTapTimeSettingButton(_ sender: UIButton) {
        presentTimeSettingView()
    }
    
    @IBAction func didTapNameEditButton(_ sender: UIButton) {
        self.userNameTextField.becomeFirstResponder()
    }
    
}

extension MyPageViewController: TimeSettingViewControllerDelegate {
    func passTime(meridiem: String, hour: String, minute: String) {
        timeSettingButton.setTitle("\(meridiem) \(hour):\(minute)", for: .normal)
        self.timeSettingLabel.textColor = ColorType.white01.color
    }
}

extension MyPageViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let userName = self.userNameTextField.text,
            userName.isEmpty {
            return false
        }
        self.userNameTextField.resignFirstResponder()
        return true
    }
}
