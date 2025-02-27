//
//  ItemCell.swift
//  CollectionScreen
//
//  Created by KAMA . on 27.02.2025.
//

import UIKit

class ItemCell: UICollectionViewCell {
    
    static let reuseID = "ItemCell"
    
    lazy var cellView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        $0.addSubview(cellImage)
        $0.addSubview(textLabel)
        $0.addSubview(mainTextLabel)
        
        return $0
    }(UIView())
    
    lazy var cellImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        
        return $0
    }(UIImageView())
    
    lazy var textLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.numberOfLines = 2
        $0.backgroundColor = .clear
        $0.font = UIFont.boldSystemFont(ofSize: 16)
        $0.clipsToBounds = true

        return $0
    }(UILabel())
    
    lazy var mainTextLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.numberOfLines = 10
        $0.backgroundColor = .clear
        $0.textColor = .black
        
        return $0
    }(UILabel())
    
    lazy var phoneIcon: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "phone")
        $0.widthAnchor.constraint(equalToConstant: 21).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        return $0
    }(UIImageView())
    
    lazy var personIcon: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "person")
        $0.widthAnchor.constraint(equalToConstant: 21).isActive = true
        $0.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        return $0
    }(UIImageView())
    
    lazy var hStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.contentMode = .scaleAspectFit
        $0.spacing = 15
        
        return $0
    }(UIStackView())
    
    lazy var moreButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(red: 0/255, green: 156/255, blue: 90/255, alpha: 1)
        $0.layer.cornerRadius = 20
        $0.setTitle("Подробнее", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.addTarget(self, action: #selector(showMoreDetails), for: .touchUpInside)
        return $0
    }(UIButton())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cellView)
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(text: String, img: UIImage, mainText: String) {
        self.textLabel.text = text
        self.cellImage.image = img
        self.mainTextLabel.text = mainText
        
        let imageSize = cellImage.image?.size
        let imageRatio = (imageSize?.height ?? 1) / (imageSize?.width ?? 1)
        
        let viewWidth = UIScreen.main.bounds.width - 20
        let newHeightImg = viewWidth * imageRatio
        
        hStack.addArrangedSubview(textLabel)
        hStack.addArrangedSubview(phoneIcon)
        hStack.addArrangedSubview(personIcon)
        
        cellView.addSubview(hStack)
        cellView.addSubview(moreButton)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cellView.centerXAnchor.constraint(equalTo: centerXAnchor),
            cellView.widthAnchor.constraint(equalToConstant: viewWidth - 20),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            cellImage.topAnchor.constraint(equalTo: cellView.topAnchor),
            cellImage.heightAnchor.constraint(equalToConstant: newHeightImg),
            cellImage.widthAnchor.constraint(equalToConstant: viewWidth - 20),
            
            textLabel.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: 15),
            textLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 34),
            textLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -100),
            
            mainTextLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 10),
            mainTextLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            mainTextLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            mainTextLabel.centerXAnchor.constraint(equalTo: cellView.centerXAnchor),
            
            moreButton.topAnchor.constraint(equalTo: mainTextLabel.bottomAnchor, constant: 10),
            moreButton.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            moreButton.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            moreButton.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -20),
            moreButton.centerXAnchor.constraint(equalTo: cellView.centerXAnchor),
            moreButton.heightAnchor.constraint(equalToConstant: 45),
        ])
    }
    
    @objc func showMoreDetails() {
        guard let collectionView = superview as? UICollectionView,
              let _ = collectionView.indexPath(for: self),
              let _ = collectionView.delegate as? UIViewController else {
            return
        }
        
    }
}

