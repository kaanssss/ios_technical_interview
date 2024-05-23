//
//  ActivePollsCustomView.swift
//  Pollexa
//
//  Created by Kaan Yalçınkaya on 22.05.2024.
//

import Foundation
import UIKit

protocol ActivePollsCustomViewDelegate: AnyObject {
    
    
}

class ActivePollsCustomView: UIView {
    
    weak var delegate: ActivePollsCustomViewDelegate?
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        return view
    }()
    
    lazy var activePollsLabel: UILabel = {
        let title = UILabel()
        title.text = "2 Active Polls"
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.textColor = .white
        return title
    }()
    
    lazy var detailLabel: UILabel = {
        let title = UILabel()
        title.text = "See Details"
        title.font = UIFont.systemFont(ofSize: 14)
        title.textColor = .lightGray
        return title
    }()
    
    lazy var goButtonConteierView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var goButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "arrow.right")
        button.setImage(image, for: .normal)
        button.tintColor = #colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1)
        button.backgroundColor = .white
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(voteButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Actions
    @objc private func voteButtonTapped() {
        
    }
    
    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [activePollsLabel,
                                                       detailLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        return stackView
    }()
    
    lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [verticalStackView,
                                                       goButtonConteierView])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 4
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    func setupViews() {
        self.addSubview(containerView)
        self.containerView.addSubview(containerStackView)
        self.goButtonConteierView.addSubview(goButton)
    }
    
    func setupLayout() {
        setupContainerView()
        setupContainerStackView()
        setupGoButton()
        
    }
}

//MARK: - Const Func
extension ActivePollsCustomView {
    
    fileprivate func setupContainerView() {
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(14)
            make.leading.trailing.equalToSuperview().inset(10)
        }
    }
    
    fileprivate func setupContainerStackView() {
        containerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(28)
        }
    }
    
    fileprivate func setupGoButton() {
        goButtonConteierView.snp.makeConstraints { make in
            make.size.equalTo(30)
        }
        goButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}


