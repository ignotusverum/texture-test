//
//  ViewController.swift
//  texture
//
//  Created by Vladislav Zagorodnyuk on 12/12/17.
//  Copyright © 2017 Youji LLC. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ViewController: UIViewController {

    var datasourceCount = 2
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = .zero
        layout.minimumInteritemSpacing = 0
        
        return layout
    }()
    
    private lazy var leftButtonItem: UIBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addCell))
    
    /// Collection node
    lazy var collectionNode: ASCollectionNode = {
        /// Node
        let node = ASCollectionNode(collectionViewLayout: flowLayout)
        
        node.view.showsVerticalScrollIndicator = false
        node.view.showsHorizontalScrollIndicator = false
        
        node.delegate = self
        node.dataSource = self
        
        node.view.backgroundColor = .white
        
        return node
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionNode.view)
        
        navigationItem.leftBarButtonItem = leftButtonItem
        collectionNode.view.frame = self.view.frame
    }
    
    @objc
    func addCell() {
        
        datasourceCount += 1
        collectionNode.insertSections(IndexSet(integer: 1))
    }
}

extension ViewController: ASCollectionDelegate {
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        
        let width = collectionNode.bounds.width - flowLayout.sectionInset.left - flowLayout.sectionInset.right
        let itemHeight = width/2.5 - flowLayout.minimumInteritemSpacing
        
        return ASSizeRange(min: .zero, max: CGSize(width: width, height: itemHeight))
    }
}

extension ViewController: ASCollectionDataSource {
    
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return datasourceCount
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        return {
            
            let node = CollectionNode()
            return node
        }
    }
}
