//
//  ViewController.swift
//  CollectionView
//
//  Created by Uladzislau Daratsiuk on 2018-03-30.
//  Copyright © 2018 Uladzislau Daratsiuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let cellId = "cellId"
    
    let newCollection: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        collection.backgroundColor = UIColor.gray
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        return collection
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newCollection.delegate = self
        newCollection.dataSource = self
        newCollection.register(CustomeCell.self, forCellWithReuseIdentifier: cellId)
        view.addSubview(newCollection)
        setupCollection()
       
    }
    func setupCollection(){
        
        newCollection.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newCollection.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        newCollection.heightAnchor.constraint(equalToConstant: 400  ).isActive = true
        newCollection.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = newCollection.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomeCell
        cell.backgroundColor  = .white
        cell.layer.cornerRadius = 5
        cell.layer.shadowOpacity = 3
        cell.imageView.image = UIImage(named: "user")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 250)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    
    
}

class CustomeCell: UICollectionViewCell {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            setupView()
    }
    
    let imageView: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 50
        image.backgroundColor = UIColor.gray
        return image
    }()
    
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.text = "New Person"
        return label
    }()
    
    
    func  setupView(){
        addSubview(imageView)
        addSubview(textLabel)
        
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        textLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5).isActive = true
        textLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        textLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

