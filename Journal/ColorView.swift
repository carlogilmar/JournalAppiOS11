//
//  ColorView.swift
//  Journal
//
//  Created by Carlo Gilmar on 3/18/18.
//  Copyright © 2018 Carlo Gilmar. All rights reserved.
//

import UIKit

class ColorView: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createView()
    }
    
    func createView(){
        let radius = max(frame.width, frame.height) / 2
        layer.cornerRadius = radius
        clipsToBounds = true
        backgroundColor = .lightGray
    }
}
