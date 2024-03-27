//
//  UserFollowTableViewCell.swift
//  Instagram
//
//  Created by Ray Chang on 2024/3/27.
//

import UIKit

protocol UserFollowTableViewCellDelegate: AnyObject {
    func didTapFollowUnfollowButton(model: String)
}

class UserFollowTableViewCell: UITableViewCell {
    static let identifier = "UserFollowTableViewCell"
    
    weak var delegate: UserFollowTableViewCellDelegate?
    
    private let profileImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private let nameLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    private let usernameLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let followButten: UIButton = {
       let button = UIButton()
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(nameLabel)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(profileImageView)
        contentView.addSubview(followButten)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(with model: String) {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        profileImageView.image = nil
        nameLabel.text = nil
        usernameLabel.text = nil
        followButten.setTitle(nil, for: .normal)
        followButten.layer.borderWidth = 0
        followButten.backgroundColor = nil
    }
 
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.frame = CGRect(x: 3, y: 3, width: contentView.height - 6, height: contentView.height - 6)
        profileImageView.layer.cornerRadius = profileImageView.height / 2
        
        let labelHeight = contentView.height / 2
        nameLabel.frame = CGRect(x: profileImageView.right + 5, y: 0, width: contentView.width - 3 - profileImageView.width, height: labelHeight)
    }
}
