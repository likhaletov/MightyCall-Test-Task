//
//  PageOneViewController.swift
//  MightyCall Test Task
//
//  Created by Dmitry Likhaletov on 02.10.2020.
//

import UIKit

class PageOneViewController: UIViewController {
    
    // inject network service
    let networkService: NetworkService = NetworkServiceImplementation()
    
    // MARK: - Outlets
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var callImageContainerView: UIView!
    @IBOutlet weak var callImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var businessBlockStackView: UIStackView!
    @IBOutlet weak var businessNumberLabel: UILabel!
    @IBOutlet weak var businessPhoneNumberLabel: UILabel!
    
    @IBOutlet weak var handleImageView: UIImageView!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        obtainData()
        setupContainerView()
        setupCallerImageView()
        setupContainerSwipeGesture()
    }
    
    private func obtainData() {
        guard let url = URL(string: Settings.api) else { return }
        networkService.obtainData(fromURL: url) { (response) in
            switch response {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let object = try decoder.decode(Client.self, from: data)
                    DispatchQueue.main.async {
                        let duration = DateFormatter.formatTime(from: object.duration)
                        let phoneNumber = String.format(with: "+X XXX XXX-XXXX", phone: object.client.address)
                        let businessPhoneNumber = String.format(with: "+X XXX XXX-XXXX", phone: object.businessNumber.number)
                        
                        self.durationLabel.text = duration
                        self.nameLabel.text = object.client.name

//                        self.nameLabel.text = "very loooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong user name"
                        
                        self.phoneNumberLabel.text = phoneNumber
                        self.businessNumberLabel.text = object.businessNumber.label
                        self.businessPhoneNumberLabel.text = businessPhoneNumber
                        
                    }
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    // container view for all objects
    private func setupContainerView() {
        containerView.layer.masksToBounds = false
        containerView.layer.shadowRadius = 4
        containerView.layer.shadowOpacity = 0.1
        containerView.layer.shadowColor = UIColor.lightGray.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 5)
        
        containerView.layer.cornerRadius = 16
        containerView.layer.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMaxXMaxYCorner
        ]
    }
    
    // shadow and radiuses for caller image view
    private func setupCallerImageView() {
        callImageContainerView.layer.cornerRadius = callImageContainerView.bounds.height/2
        callImageContainerView.layer.shadowOpacity = 0.2
        callImageContainerView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        callImageContainerView.layer.shadowRadius = 4.0
        callImageContainerView.layer.shadowColor = UIColor.lightGray.cgColor
        
        callImageView.layer.cornerRadius = callImageView.bounds.height/2
        callImageView.clipsToBounds = true
    }
    
    private func setupContainerSwipeGesture() {
        let topSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeHandler))
        topSwipe.direction = .up
        containerView.addGestureRecognizer(topSwipe)
    }
    
    @objc private func swipeHandler() {
        UIView.animate(withDuration: 0.25) {
            self.businessBlockStackView.alpha = 0.0
            self.handleImageView.alpha = 0.0
            let sizeOfStockView = self.businessBlockStackView.frame.height
    
            self.bottomConstraint.constant = -sizeOfStockView + 16
            self.view.layoutIfNeeded()
        }
    }
}
