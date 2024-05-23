//
//  DiscoverViewController.swift
//  Pollexa
//
//  Created by Emirhan Erdogan on 13/05/2024.
//

import UIKit
import SnapKit

class DiscoverViewController: UIViewController {
    
    // MARK: - Properties
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var activePollView: ActivePollsCustomView = {
            let view = ActivePollsCustomView()
//            view.delegate = self
            return view
        }()
    
    lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [discoverContainerView,
                                                       activePollView,
                                                       tableView,
                                                      ])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var tableView: UITableView = {
            let tableView = UITableView()
            tableView.delegate = self.viewModel.dataSource
            tableView.dataSource = self.viewModel.dataSource
            tableView.separatorStyle = .none
//            let activePollsIdentifier = String(describing: ActivePollsCell.self)
//            tableView.register(ActivePollsCell.self, forCellReuseIdentifier: activePollsIdentifier)
            let voteCellIdentifier = String(describing: VoteCell.self)
            tableView.register(VoteCell.self, forCellReuseIdentifier: voteCellIdentifier)
            
            return tableView
        }()
    
    lazy var discoverContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var discoverLabel: UILabel = {
        let title = UILabel()
        title.text = "Discover"
        title.font = UIFont.boldSystemFont(ofSize: 28)
        title.textColor = .black
        return title
    }()
    
    let postProvider = PostProvider.shared
    var viewModel = DiscoverVM()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
        setupLayout()
        observeDataSource()
        observeViewModel()
        viewModel.fetchData()
        
        view.backgroundColor = #colorLiteral(red: 1, green: 0.9999999404, blue: 1, alpha: 1)
    }
    
    // MARK: - Setup Navigation Bar
    private func setupNavigationBar() {
        let profileImageView: UIImageView = {
            let profileImage = UIImage(named: "avatar_1")
            let imageView = UIImageView(image: profileImage)
            imageView.layer.cornerRadius = 20
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            imageView.snp.makeConstraints { make in
                make.width.height.equalTo(40)
            }
            return imageView
        }()
        
        let profileButtonItem = UIBarButtonItem(customView: profileImageView)
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        
        navigationItem.leftBarButtonItem = profileButtonItem
        navigationItem.rightBarButtonItem = addButtonItem
    }

    @objc private func addButtonTapped() {
        print("Add button tıklandı.")
    }
    
    // MARK: - Setup
    func setupViews() {
        view.addSubview(containerView)
        containerView.addSubview(containerStackView)
        discoverContainerView.addSubview(discoverLabel)
    }
    
    func setupLayout() {
        setupContainerView()
        setupDiscover()
//        setupTableView()
        
    }
    
    // MARK: - Observe Methods
    func observeDataSource() {
        viewModel.dataSource.subscribe { [weak self] (state) in
            guard let self = self else { return }
            switch state {
            case .gotoPost(let postID):
                print("Navigate")
            }
        }
    }
    
    func observeViewModel() {
        viewModel.subscribe { [weak self] (state) in
            guard let self = self else { return }
            switch state {
            case .getListSuccess(let posts):
                self.viewModel.dataSource.posts = posts
                self.tableView.reloadData()
            case .getListError(let error):
                // Show error message
                print("Error: xx")
            }
        }
    }
}

// MARK: - Constraints
extension DiscoverViewController {
    fileprivate func setupContainerView() {
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        containerStackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(10)
            make.bottom.equalToSuperview()
        }
    }
    
    fileprivate func setupDiscover() {
        discoverLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(6)
        }
    }
    
}
