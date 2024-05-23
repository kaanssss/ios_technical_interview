//
//  VoteCell.swift
//  Pollexa
//
//  Created by Kaan Yalçınkaya on 21.05.2024.
//

import Foundation
import UIKit

protocol VoteCellDelegate: AnyObject {
    
}

class VoteCell: UITableViewCell {
    
    var totalVotes: Int = 0
    var hasVoted: Bool = false
    weak var delegate: VoteCellDelegate?
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        return view
    }()
    
    lazy var containerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageLabelStackView,
                                                       indicatorView,
                                                       mainStackView,
                                                       totalLabelContainerView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 14
        return stackView
    }()
    
    lazy var imageLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageContainerView,
                                                       nameLabelContainerView,
                                                       dayContainerView])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 6
        return stackView
    }()
    
    lazy var imageContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var profileImageView: UIImageView = {
        let profileImage = UIImage(named: "avatar_2")
        let imageView = UIImageView(image: profileImage)
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var nameLabelContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let title = UILabel()
        title.text = "Lisa Bryant"
        title.font = UIFont.systemFont(ofSize: 18)
        title.textColor = .black
        return title
    }()
    
    lazy var dayContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var dayLabel: UILabel = {
        let title = UILabel()
        title.text = "2 days ago"
        title.font = UIFont.systemFont(ofSize: 16)
        title.textColor = .lightGray
        title.textAlignment = .right
        return title
    }()
    
    lazy var indicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.05)
        return view
    }()
    
    //MARK: -
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [contentLabelStackView,
                                                       imageStackView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var contentLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [lastVotedContainerView,
                                                       contentLabelContainerView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var lastVotedContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var lastVotedLabel: UILabel = {
        let title = UILabel()
        title.text = "Last Voted 1 Hour Ago"
        title.font = UIFont.systemFont(ofSize: 16)
        title.textColor = .gray
        return title
    }()
    
    lazy var contentLabelContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var contentLabel: UILabel = {
        let title = UILabel()
        title.text = "What theme should we pick for the year-end company party?"
        title.font = UIFont.systemFont(ofSize: 16)
        title.textColor = .black
        title.numberOfLines = .zero
        return title
    }()
    
    lazy var imageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postImageLeftContainerView,
                                                       postImageRightContainerView])
        
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        return stackView
    }()
    
    lazy var postImageLeftContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var postImageLeftView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.corners = [.topLeft, .bottomLeft]
        imageView.image = UIImage(named: "post_7_option_1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    lazy var postImageRightContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var postImageRightView: CustomImageView = {
        let imageView = CustomImageView()
        imageView.corners = [.topRight, .bottomRight]
        imageView.image = UIImage(named: "post_7_option_2")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var totalLabelContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var totalLabel: UILabel = {
        let title = UILabel()
        title.text = "6 Total Votes"
        title.font = UIFont.systemFont(ofSize: 16)
        title.textColor = .lightGray
        title.numberOfLines = .zero
        return title
    }()
    
    lazy var leftLikeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.isUserInteractionEnabled = true
        button.addTarget(self,
                         action: #selector(leftLikeButtonButton),
                         for: .touchUpInside)
        return button
    }()
    
    @objc func leftLikeButtonButton() {
        print("click left")
        
        if !hasVoted {
            hasVoted = true
            
            percentageLeftContainerView.isHidden = false
            percentageRightContainerView.isHidden = false
            
            leftLikeContainerView.isHidden = true
            
            
            rightLikeButton.isEnabled = true
            rightLikeContainerView.isHidden = true
            
            // +1
            totalVotes += 1
            totalLabel.text = "\(totalVotes) Total Votes"
        }
        
    }
    
    lazy var leftLikeContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var leftLikeImageView: UIImageView = {
        let likeImage = UIImage(systemName: "hand.thumbsup.fill")
        let imageView = UIImageView(image: likeImage)
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.contentMode = .center
        imageView.backgroundColor = .white
        return imageView
    }()
    
    lazy var rightLikeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.isUserInteractionEnabled = true
        button.addTarget(self,
                         action: #selector(rightLikeButtonButton),
                         for: .touchUpInside)
        return button
    }()
    
    @objc func rightLikeButtonButton() {
        print("click right")
        
        if !hasVoted {
            hasVoted = true
            
            percentageLeftContainerView.isHidden = false
            percentageRightContainerView.isHidden = false
            
            rightLikeContainerView.isHidden = true
            
            leftLikeButton.isEnabled = true
            leftLikeContainerView.isHidden = true
            
            // +1
            totalVotes += 1
            totalLabel.text = "\(totalVotes) Total Votes"
        }
    }
    
    lazy var rightLikeContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var rightLikeImageView: UIImageView = {
        let likeImage = UIImage(systemName: "hand.thumbsup.fill")
        let imageView = UIImageView(image: likeImage)
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.contentMode = .center
        imageView.backgroundColor = .white
        return imageView
    }()
    
    lazy var percentageLeftContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var percentageLeftLabel: UILabel = {
        let title = UILabel()
        title.text = "52 %"
        title.font = UIFont.systemFont(ofSize: 16)
        title.textColor = .white
        return title
    }()
    
    lazy var percentageRightContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var percentageRightLabel: UILabel = {
        let title = UILabel()
        title.text = "52 %"
        title.font = UIFont.systemFont(ofSize: 16)
        title.textColor = .white
        return title
    }()
    
    
    //MARK: -
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
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
        self.imageContainerView.addSubview(profileImageView)
        self.nameLabelContainerView.addSubview(nameLabel)
        self.dayContainerView.addSubview(dayLabel)
        self.lastVotedContainerView.addSubview(lastVotedLabel)
        self.contentLabelContainerView.addSubview(contentLabel)
        self.postImageLeftContainerView.addSubviews([postImageLeftView, leftLikeContainerView, percentageLeftContainerView])
        self.postImageRightContainerView.addSubviews([postImageRightView, rightLikeContainerView, percentageRightContainerView])
        self.totalLabelContainerView.addSubview(totalLabel)
        self.leftLikeContainerView.addSubviews([leftLikeImageView, leftLikeButton])
        self.rightLikeContainerView.addSubviews([rightLikeImageView, rightLikeButton])
        self.percentageLeftContainerView.addSubview(percentageLeftLabel)
        self.percentageRightContainerView.addSubview(percentageRightLabel)
        
    }
    
    func setupLayout() {
        setupContainerView()
        setupContainerStackView()
        setupImageView()
        setupNameLabel()
        setupDayLabel()
        setupIndicatorView()
        setupLastVoted()
        setupContentLabel()
        setupPostImageViewLeft()
        setupPostImageViewRight()
        setupTotalLabel()
        setupLeftLike()
        setupRightLike()
        setupLeftPercentage()
        setupRightPercentage()
        
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        percentageLeftContainerView.isHidden = true
        percentageRightContainerView.isHidden = true
        leftLikeButton.isHidden = false
        rightLikeButton.isHidden = false
        leftLikeContainerView.isHidden = false
        rightLikeContainerView.isHidden = false
        hasVoted = false
    }
    
    
    func setCell(post: Post) {
        
        nameLabel.text = post.user.username
        profileImageView.image = post.user.image
        contentLabel.text = post.content
        postImageLeftView.image = post.options.first?.image
        postImageRightView.image = post.options.last?.image
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dayLabel.text = dateFormatter.string(from: post.createdAt)
        
        totalVotes = post.votes ?? 0
        hasVoted = post.isLiked ?? false
        
        // random
        let randomVotes = Int.random(in: 1...100)
        totalVotes = randomVotes
        totalLabel.text = "\(totalVotes) Total Votes"
        
        // Sol ve sağ yüzde
        let leftPercentage = Int.random(in: 1...99)
        let rightPercentage = 100 - leftPercentage
        
        percentageLeftLabel.text = "\(leftPercentage) %"
        percentageRightLabel.text = "\(rightPercentage) %"
        
        percentageLeftContainerView.isHidden = true
        percentageRightContainerView.isHidden = true
        
        if hasVoted {
            leftLikeButton.isHidden = false
            rightLikeButton.isHidden = false
            percentageLeftContainerView.isHidden = true
            percentageRightContainerView.isHidden = true
        }
        
    }
    
}

//MARK: - Const Func
extension VoteCell {
    
    fileprivate func setupContainerView() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
            make.leading.trailing.equalToSuperview().inset(10)
        }
    }
    
    fileprivate func setupContainerStackView() {
        containerStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }
    
    fileprivate func setupImageView() {
        imageContainerView.snp.makeConstraints { make in
            make.size.equalTo(34)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func setupNameLabel() {
        nameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func setupDayLabel() {
        dayLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func setupIndicatorView() {
        indicatorView.snp.makeConstraints { make in
            make.height.equalTo(1)
        }
    }
    
    fileprivate func setupLastVoted() {
        lastVotedLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func setupContentLabel() {
        contentLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func setupPostImageViewLeft(){
        postImageLeftContainerView.snp.makeConstraints { make in
            make.height.equalTo(128)
        }
        
        postImageLeftView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func setupPostImageViewRight() {
        postImageRightContainerView.snp.makeConstraints { make in
            make.height.equalTo(128)
        }
        
        postImageRightView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func setupTotalLabel() {
        totalLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func setupLeftLike() {
        leftLikeContainerView.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.bottom.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(10)
        }
        
        leftLikeImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        leftLikeButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    fileprivate func setupRightLike() {
        rightLikeContainerView.snp.makeConstraints { make in
            make.size.equalTo(30)
            make.bottom.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(10)
        }
        
        rightLikeImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        rightLikeButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
    fileprivate func setupLeftPercentage() {
        percentageLeftContainerView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(10)
        }
        
        percentageLeftLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    fileprivate func setupRightPercentage() {
        percentageRightContainerView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(10)
        }
        
        percentageRightLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    
}

//MARK: - Objc Buttons Actions
extension VoteCell {
    
}


