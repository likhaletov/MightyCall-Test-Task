//
//  PageTwoViewController.swift
//  MightyCall Test Task
//
//  Created by Dmitry Likhaletov on 02.10.2020.
//

import UIKit

class PageTwoViewController: UIViewController {
    
    private let mainView = PageTwoView()
    private let cellSpacingHeight: CGFloat = 30.0
    
    private let mockDataSource = MockDataManager.getMockData()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        mainView.callsTableView.delegate = self
        mainView.callsTableView.dataSource = self
        mainView.callsTableView.separatorStyle = .none
    }
    
}

extension PageTwoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        activate it if we have a lot of cells
//        cell.contentView.layer.masksToBounds = true
//        let radius = cell.contentView.layer.cornerRadius
//        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
}

extension PageTwoViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return mockDataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = mainView.callsTableView.dequeueReusableCell(withIdentifier: CallerTableViewCell.reusableCell, for: indexPath) as? CallerTableViewCell {
            cell.selectionStyle = .none
            let data = mockDataSource[indexPath.section]
            cell.configureCell(with: data)
            return cell
        }
        return UITableViewCell()
    }
}
