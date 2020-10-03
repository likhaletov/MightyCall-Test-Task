//
//  CallerTableViewCell.swift
//  MightyCall Test Task
//
//  Created by Dmitry Likhaletov on 02.10.2020.
//

import UIKit

class CallerTableViewCell: UITableViewCell {
    
    static let reusableCell = "cell id"
    
    lazy var userpicImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var callerNameLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font = label.font.withSize(17)
        label.font = label.font.bold
        label.textColor = UIColor(red: 51, green: 51, blue: 51)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var callerPhoneLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font = label.font.withSize(17)
        label.textColor = UIColor(red: 51, green: 51, blue: 51)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font = label.font.withSize(13)
        label.font = label.font.italic
        label.textColor = UIColor(red: 96, green: 96, blue: 96)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font = label.font.withSize(13)
        label.textColor = UIColor(red: 96, green: 96, blue: 96)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            frame.origin.x += 16
            frame.size.width -= 2 * 16
            super.frame = frame
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCellLayout()
        configureUserpicImageView()
        configureCallerNameLabel()
        configureCallerPhoneLabel()
        configureDurationLabel()
        configureDateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(with data: Record) {
        callerNameLabel.text = data.name
        durationLabel.text = data.duration
        callerPhoneLabel.text = data.description
        dateLabel.text = data.date
    }
    
    private func configureCellLayout() {
        backgroundColor = .clear
        layer.masksToBounds = false
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
    }
    
    private func configureUserpicImageView() {
        contentView.addSubview(userpicImageView)
        userpicImageView.image = UIImage(named: "Group")
        
        NSLayoutConstraint.activate([
            userpicImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            userpicImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 17),
            userpicImageView.widthAnchor.constraint(equalToConstant: 35),
            userpicImageView.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    private func configureCallerNameLabel() {
        contentView.addSubview(callerNameLabel)
        
        NSLayoutConstraint.activate([
            callerNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            callerNameLabel.leftAnchor.constraint(equalTo: userpicImageView.rightAnchor, constant: 22),
            callerNameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 11)
        ])
    }
    
    private func configureDurationLabel() {
        contentView.addSubview(durationLabel)
        
        NSLayoutConstraint.activate([
            durationLabel.topAnchor.constraint(equalTo: userpicImageView.bottomAnchor, constant: 12),
            durationLabel.leadingAnchor.constraint(equalTo: userpicImageView.leadingAnchor),
            durationLabel.trailingAnchor.constraint(equalTo: userpicImageView.trailingAnchor),
            durationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    private func configureCallerPhoneLabel() {
        contentView.addSubview(callerPhoneLabel)
        
        NSLayoutConstraint.activate([
            callerPhoneLabel.topAnchor.constraint(equalTo: callerNameLabel.bottomAnchor, constant: 4),
            callerPhoneLabel.leftAnchor.constraint(equalTo: callerNameLabel.leftAnchor)
        ])
    }
    
    private func configureDateLabel() {
        contentView.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            dateLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
            dateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
    
}
