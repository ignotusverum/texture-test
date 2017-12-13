//
//  NestedCollectionNode.swift
//  texture
//
//  Created by Vladislav Zagorodnyuk on 12/12/17.
//  Copyright © 2017 Youji LLC. All rights reserved.
//

import Foundation

import AsyncDisplayKit

class NestedCollectionNode: ASCellNode {
    
    /// Gif image node
    lazy var gifNode: ASNetworkImageNode = {
        
        /// Node setup
        let node = ASNetworkImageNode()
        node.contentMode = .scaleAspectFit
        node.shouldCacheImage = false
        
        return node
    }()
    
    // MARK: - Initialization
    override init() {
        super.init()
        
        addSubnode(gifNode)
        
//        gifNode.backgroundColor = UIColor.red
        gifNode.url = URL(string: "https://media4.giphy.com/avatars/100soft/WahNEDdlGjRZ.gif")
    }
    
    /// Layout setup
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange)-> ASLayoutSpec {
        
        gifNode.style.preferredSize = CGSize(width: constrainedSize.max.width, height: constrainedSize.max.width)
        
        let stackLayout = ASStackLayoutSpec(direction: .vertical, spacing: 8, justifyContent: .center, alignItems: .center, children: [gifNode])
        let gifLayout = ASAbsoluteLayoutSpec(sizing: .sizeToFit, children: [stackLayout])
        let centering = ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: gifLayout)
        
        return centering
    }
}
