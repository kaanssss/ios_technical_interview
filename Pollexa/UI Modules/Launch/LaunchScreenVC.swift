//
//  LauncScreenVC.swift
//  Pollexa
//
//  Created by Kaan Yalçınkaya on 22.05.2024.
//

import UIKit
import SnapKit

class LaunchScreenViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "AppIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Pollexa"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupLayout()
        setupConstraints()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.showDiscoverViewController()
        }
    }
    
    // MARK: - Setup
    func setupViews() {
        view.backgroundColor = .white
        view.addSubviews([logoImageView, titleLabel])
    }
    
    func setupLayout() {
        setupConstraints()
        
    }
    
    private func showDiscoverViewController() {
        let discoverVC = DiscoverViewController()
        let navigationController = UINavigationController(rootViewController: discoverVC)
        navigationController.modalTransitionStyle = .crossDissolve
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
    }
    
    // MARK: - Setup Constraints
    private func setupConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
}

//MARK: - Const Func
extension LaunchScreenViewController {
    
    fileprivate func setupLogoImageView() {
        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
    }
}
