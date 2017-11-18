//
//  CollapsableViewModel.swift
//  ExpandableView
//
//  Created by Sanjeet Verma on 18/11/17.
//  Copyright © 2017 Sanjeet Verma. All rights reserved.
//

import Foundation
import UIKit
class CollapsableViewModel {
    let label: String
    let image: UIImage?
    let children: [CollapsableViewModel]
    var isCollapsed: Bool
    var needsSeparator: Bool = true
    var isChild:Bool
    init(label: String, image: UIImage? = nil, children: [CollapsableViewModel] = [], ischild: Bool, isCollapsed: Bool = true) {
        self.label = label
        self.image = image
        self.children = children
        self.isCollapsed = isCollapsed
        self.isChild = ischild
        for child in self.children {
            self.isChild = true
            child.needsSeparator = false
        }
        self.children.last?.needsSeparator = true
    }
}
