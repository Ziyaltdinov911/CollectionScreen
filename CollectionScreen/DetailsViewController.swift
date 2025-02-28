//
//  DetailsViewController.swift
//  CollectionScreen
//
//  Created by KAMA . on 28.02.2025.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var fullText: String?
    var image: UIImage?
    var userName: String?
    
    let scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        return $0
    }(UIScrollView())
    
    let userNameTitle: UILabel = {
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    let articleImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        
        return $0
    }(UIImageView())

    let fullTextLabel: UILabel = {
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    init(userName: String, image: UIImage?, fullText: String?) {
        self.userName = userName
        self.image = image
        self.fullText = fullText
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(scrollView)
        scrollView.addSubview(articleImage)
        scrollView.addSubview(fullTextLabel)
        scrollView.addSubview(userNameTitle)
        
        articleImage.image = image
        userNameTitle.text = userName
        fullTextLabel.text = fullText
        
        let imageSize = articleImage.image?.size
        let imageRatio = (imageSize?.height ?? 1) / (imageSize?.width ?? 1)
        
        let viewWidth = UIScreen.main.bounds.width - 20
        let newHeightImg = viewWidth * imageRatio

        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            userNameTitle.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            userNameTitle.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 40),
            userNameTitle.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -40),
            
            articleImage.topAnchor.constraint(equalTo: userNameTitle.topAnchor, constant: 40),
            articleImage.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            articleImage.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            articleImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            articleImage.heightAnchor.constraint(equalToConstant: newHeightImg),
            
            fullTextLabel.topAnchor.constraint(equalTo: articleImage.bottomAnchor, constant: 40),
            fullTextLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            fullTextLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            fullTextLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
        ])

        fullTextLabel.preferredMaxLayoutWidth = view.bounds.width - 60
    }
}

import SwiftUI
struct DetailsViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

// PreviewProvider для SwiftUI
struct DetailsViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
        //            .previewLayout(.sizeThatFits)
    }
}
