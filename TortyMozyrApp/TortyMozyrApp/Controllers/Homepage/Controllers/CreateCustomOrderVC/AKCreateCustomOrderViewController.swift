//
//  AKCreateCustomOrderViewController.swift
//  TortyMozyrApp
//
//  Created by Саша Капчук on 17.04.21.
//

import UIKit

class AKCreateCustomOrderViewController: AKViewController {

    // MARK: - properties

    private let reasons = ["Birthday".localized,
                               "To a loved one".localized,
                               "For colleagues".localized,
                               "For the anniversary".localized,
                               "Without harm to the figure".localized,
                               "For a child".localized,
                               "For the wedding".localized,
                               "Other. I'll write in a comment.".localized
    ]

    private let productTypes = ["Cake".localized,
                                    "Dessert".localized,
                                    "Pies".localized,
                                    "Nuts with condensed milk".localized,
                                    "Condensed milk rolls".localized,
                                    "Sets".localized,
                                    "Other. I'll write in a comment.".localized
    ]

    // MARK: - gui variables

    private lazy var backgroundImage: AKCorporateBackgroundImageView = {
        let image = AKCorporateBackgroundImageView()
        image.image = UIImage(named: "bakery-wallpaper")
        return image
    }()

    private lazy var blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        view.effect = UIBlurEffect(style: .regular)
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.white.cgColor
        view.clipsToBounds = true
        return view
    }()

    private lazy var headerTitleLabel: AKSubheaderTitleLabel = {
        let title = AKSubheaderTitleLabel()
        title.text = "Custom order".localized
        title.textColor = .white
        return title
    }()

    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Name".localized
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()

    private lazy var reasonTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.inputView = self.reasonsPickerView
        textField.placeholder = "Reason for the order".localized
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var reasonsPickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()

    private lazy var productTypeTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.inputView = self.productTypePickerView
        textField.placeholder = "What type of product are you interested".localized
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var productTypePickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()

    private lazy var telephoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter your phone number".localized
        textField.keyboardType = .numberPad
        textField.textContentType = .telephoneNumber
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.delegate = self
        return textField
    }()

    private lazy var sendOrderButton: AKSystemButton = {
        let button = AKSystemButton()
        button.setTitle("Send an order".localized, for: UIControl.State())
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(sendOrderButtonTapped), for: .touchUpInside)
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.white.cgColor
        return button
    }()

    private lazy var rightBarButtonItem: UIBarButtonItem = {
        let menuImage = UIImage(systemName: "line.horizontal.3.circle")
        let barButton = UIBarButtonItem(image: menuImage,
                                        landscapeImagePhone: nil,
                                        style: .plain,
                                        target: self,
                                        action: #selector(rightBarButtonWasTapped))
        return barButton
    }()

    // MARK: - view life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Сreate an order".localized

        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewWasTapped)))

        self.navigationItem.setRightBarButton(rightBarButtonItem, animated: true)
        self.navigationItem.backButtonTitle = " "

        self.mainView.addSubview([
            self.backgroundImage,
            self.blurView,
            self.nameTextField,
            self.reasonTextField,
            self.productTypeTextField,
            self.telephoneNumberTextField,
            self.sendOrderButton
        ])

        self.blurView.contentView.addSubview([
            self.headerTitleLabel
        ])

        self.setUpConstraints()
    }

    // MARK: - actions

    @objc private func rightBarButtonWasTapped() {
        self.navigationController?.pushViewController(TMMainMenuViewController(), animated: true)
    }

    @objc private func sendOrderButtonTapped() {
        let alertController = UIAlertController(title: "Done".localized,
                                                message: "The order has been sent. We will contact you shortly!".localized,
                                                preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "ОК", style: .default) { _ in
            self.navigationController?.pushViewController(TMHomepageViewController(), animated: true)

        }
        alertController.addAction(okAction)

        self.present(alertController, animated: true, completion: nil)
    }

    @objc private func viewWasTapped() {
        self.view.endEditing(true)
    }

    // MARK: - set up constraints

    private func setUpConstraints() {

        self.backgroundImage.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }

        self.blurView.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).inset(25)
            make.left.right.centerX.equalToSuperview().inset(25)
            make.height.equalTo(40)
        }

        self.headerTitleLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }

        self.nameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.blurView.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(25)
        }

        self.reasonTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.nameTextField.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(25)
        }

        self.productTypeTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.reasonTextField.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(25)
        }

        self.telephoneNumberTextField.snp.makeConstraints { (make) in
            make.top.equalTo(self.productTypeTextField.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(25)
        }

        self.sendOrderButton.snp.makeConstraints { (make) in
            make.top.equalTo(self.telephoneNumberTextField.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(25)
            make.bottom.equalToSuperview()
        }

    }

}

// MARK: - extensions

extension AKCreateCustomOrderViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == reasonsPickerView {
            return self.reasons.count
        } else {
            return self.productTypes.count
        }

    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == reasonsPickerView {
            return reasons[row]
        } else {
            return productTypes[row]
        }

    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == reasonsPickerView {
            self.reasonTextField.text = self.reasons[row]
        } else {
            self.productTypeTextField.text = self.productTypes[row]
        }
        self.reasonTextField.resignFirstResponder()
    }
}

extension AKCreateCustomOrderViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}
