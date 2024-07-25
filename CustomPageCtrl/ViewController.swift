//
//  ViewController.swift
//  CustomPageCtrl
//
//  Created by seobyeonggwan on 2024/07/25.
//


import UIKit

struct TestCells {
    let labelString: String
    let backgroundColor: UIColor
}

class ViewController: UIViewController {

    private let cells = [
        TestCells(labelString: "cell1", backgroundColor: UIColor.red),
        TestCells(labelString: "cell2", backgroundColor: UIColor.blue),
        TestCells(labelString: "cell3", backgroundColor: UIColor.brown),
        TestCells(labelString: "cell4", backgroundColor: UIColor.green)
    ]
    
    lazy var collectionView: UICollectionView =  {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        layout.footerReferenceSize = .zero
        layout.headerReferenceSize = .zero
        layout.itemSize = view.bounds.size
        
        let slideView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        slideView.isScrollEnabled = true
        slideView.isPagingEnabled = true
        slideView.showsHorizontalScrollIndicator = false
        slideView.register(CustomPageControlCollectionViewCell.self, forCellWithReuseIdentifier: "CustomPageControlCollectionViewCell")
        
        slideView.delegate = self
        slideView.dataSource = self
        
        return slideView
    }()
    
    lazy var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.frame = view.bounds
        
        pageControl.frame = CGRect(x: 0, y: view.frame.height - 50, width: view.frame.width, height: 50)
        pageControl.numberOfPages = cells.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .white
        
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        
        view.layoutIfNeeded()
    }
}

extension ViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.frame.size.width != 0 {
            let value = (scrollView.contentOffset.x / scrollView.frame.width)
            pageControl.currentPage = Int(round(value))
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomPageControlCollectionViewCell", for: indexPath) as! CustomPageControlCollectionViewCell
        let cellData = cells[indexPath.item]
        cell.configure(with: cellData.labelString, background: cellData.backgroundColor)
        
        return cell
    }
}
