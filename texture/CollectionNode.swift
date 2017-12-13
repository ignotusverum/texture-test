//
//  CollectionCell.swift
//  texture
//
//  Created by Vladislav Zagorodnyuk on 12/12/17.
//  Copyright © 2017 Youji LLC. All rights reserved.
//

import Foundation
import AsyncDisplayKit

class CollectionNode: ASCellNode {
    
    lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        layout.scrollDirection = .horizontal
        
        layout.sectionInset = UIEdgeInsets(top: 5, left: 20, bottom: 0, right: 0)
        return layout
    }()
    
    /// Collection node
    lazy var collectionNode: ASCollectionNode = {
        /// Node
        let node = ASCollectionNode(collectionViewLayout: flowLayout)
        
        return node
    }()
    
    // MARK: - Initialization
    override init() {
        super.init()
        
        /// Datasource / delegate setup
        collectionNode.delegate = self
        collectionNode.dataSource = self
    }
    
    override func didLoad() {
        super.didLoad()
        
        addSubnode(collectionNode)
        collectionNode.frame = frame
    }
}

/// Collection node delegate
extension CollectionNode: ASCollectionDelegate {
    
    func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
        
        return ASSizeRange(min: CGSize(width: 100, height: 100), max: CGSize(width: 100, height: 100))
    }
}

/// Collection node datasource
extension CollectionNode: ASCollectionDataSource {
    
    /// Number of sections
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }
    
    /// Number of rows
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        
        return {
            
            let node = NestedCollectionNode()
            return node
        }
    }
}
