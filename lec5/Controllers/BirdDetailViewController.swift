//
//  BirdDetailViewController.swift
//  lec5
//
//  Created for L5: Delegation + Protocols
//  Created by Jay on 3/23/26.
//

import UIKit

class BirdDetailViewController: UIViewController {
    
    // MARK: - Properties (view)
    
    private let birdImageView = UIImageView()
    private let birdNameLabel = UILabel()
    private let favoriteButton = UIButton()
    
    // add the delegate
    
    // MARK: - Properties (data)
    
    private var bird: Bird
    
    // MARK: - init
    
    init(bird: Bird) {
        self.bird = bird
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("")
    }
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = bird.name
        view.backgroundColor = .white
        
        setupBirdImage()
        setupBirdName()
        setupFavoriteButton()
    }
    
    // MARK: - Set Up Views
    private func setupBirdImage() {
        
        // configure its appearance
        birdImageView.image = UIImage(named: bird.image)
        birdImageView.contentMode = .scaleAspectFit
        
        // add it as a subview
        view.addSubview(birdImageView)
        
        // disable auto-resizing mask
        birdImageView.translatesAutoresizingMaskIntoConstraints = false
        
        // pin it with constraints
        NSLayoutConstraint.activate([
            birdImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            birdImageView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 40
            ),
            birdImageView.widthAnchor.constraint(equalToConstant: 200),
            birdImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupBirdName() {
        birdNameLabel.text = bird.name
        birdNameLabel.font = .systemFont(ofSize: 28, weight: .bold)
        birdNameLabel.textAlignment = .center
        
        view.addSubview(birdNameLabel)
        
        birdNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            birdNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            birdNameLabel.topAnchor.constraint(equalTo: birdImageView.bottomAnchor, constant: 16)
        ])
        
    }
    
    private func setupFavoriteButton() {
        updateFavoriteButton()
        
        favoriteButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        favoriteButton.setTitleColor(.white, for: .normal)
        favoriteButton.layer.cornerRadius = 12
        
        favoriteButton.addTarget(self, action: #selector(didTapFavorite), for: .touchUpInside)
        
        view.addSubview(favoriteButton)
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favoriteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            favoriteButton.topAnchor.constraint(
                equalTo: birdNameLabel.bottomAnchor,
                constant: 32
            ),
            favoriteButton.widthAnchor.constraint(equalToConstant: 200),
            favoriteButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Helper
    
    private func updateFavoriteButton() {
        if bird.isFavorited {
            favoriteButton.setTitle("unfavorite", for: .normal)
            favoriteButton.backgroundColor = .systemRed
        } else {
            favoriteButton.setTitle("favorite", for: .normal)
            favoriteButton.backgroundColor = .systemBlue
        }
            
    }
    
    // MARK: - Button Action
    
    @objc private func didTapFavorite() {
        bird.isFavorited.toggle()
        updateFavoriteButton()
        
        // call the delegate
    }
   
}

// Make a protocol
