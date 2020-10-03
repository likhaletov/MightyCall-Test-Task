//
//  PageTwoView.swift
//  MightyCall Test Task
//
//  Created by Dmitry Likhaletov on 02.10.2020.
//

import UIKit

class PageTwoView: UIView {
    
    lazy var callsTableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.estimatedRowHeight = 600
        tv.rowHeight = UITableView.automaticDimension
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCallsTableView()
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCallsTableView() {
        callsTableView.register(CallerTableViewCell.self, forCellReuseIdentifier: CallerTableViewCell.reusableCell)
        
        addSubview(callsTableView)
        NSLayoutConstraint.activate([
            callsTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            callsTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            callsTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            callsTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
