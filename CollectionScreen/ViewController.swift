//
//  ViewController.swift
//  CollectionScreen
//
//  Created by KAMA . on 27.02.2025.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0
        layout.collectionView?.showsVerticalScrollIndicator = false
        layout.collectionView?.showsHorizontalScrollIndicator = false
        
        $0.register(ItemCell.self, forCellWithReuseIdentifier: ItemCell.reuseID)
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectoinItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCell.reuseID, for: indexPath) as! ItemCell
        let item = collectoinItem[indexPath.item]
        cell.setCell(text: item.title, img: item.image!, mainText: item.mainText)
        return cell
    }


}

import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
    }
}

// PreviewProvider для SwiftUI
struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
        //            .previewLayout(.sizeThatFits)
    }
}
