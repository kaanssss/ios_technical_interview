//
//  ActivePollsCell.swift
//  Pollexa
//
//  Created by Kaan Yalçınkaya on 19.05.2024.
//

import Foundation
import UIKit

protocol ActivePollsCellDelegate: AnyObject {
    
}

class ActivePollsCell: UITableViewCell {
    
    weak var delegate: ActivePollsCellDelegate?

    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1)
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        return view
    }()
    
    lazy var activePollsLabel: UILabel = {
        let title = UILabel()
        title.text = "2 Active Polls"
        title.font = UIFont.systemFont(ofSize: 18)
        title.textColor = .white
        return title
    }()
    
    lazy var detailLabel: UILabel = {
        let title = UILabel()
        title.text = "See Details"
        title.font = UIFont.systemFont(ofSize: 12)
        title.textColor = .lightGray
        return title
    }()
    
    lazy var goButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "arrow.right") // SF Symbol simgesi
        button.setImage(image, for: .normal)
        button.tintColor = #colorLiteral(red: 0.3450980392, green: 0.337254902, blue: 0.8392156863, alpha: 1)
        button.backgroundColor = .white
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(voteButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Actions
        @objc private func voteButtonTapped() {
            guard let delegate = delegate else { return }
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
                                                      goButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 4
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    func setupViews() {
        self.contentView.addSubview(containerView)
        self.containerView.addSubview(containerStackView)
        
    }
    
    func setupLayout() {
        setupContainerView()
        setupContainerStackView()
        setupGoButton()
        
    }
    
    func setCell() {
        
    }
    
}

//MARK: - Const Func
extension ActivePollsCell {
    
    fileprivate func setupContainerView() {
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
    }
    
    fileprivate func setupContainerStackView() {
        containerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(14)
        }
    }
    
    fileprivate func setupGoButton() {
        goButton.snp.makeConstraints { make in
            make.size.equalTo(32)
        }
    }
    
}

//MARK: - Objc Buttons Actions
extension ActivePollsCell {
}

