//
//  GSTLabel.swift
//  exzeo.analytics
//
//  Created by Himanshu on 17/02/17.
//  Copyright © 2017 Gaurav Singh. All rights reserved.
//

import UIKit



@IBDesignable class GSTLabel : UILabel {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var f = self.frame
        
        f.size.height = f.size.height * 2
        f.origin.y = f.origin.y - f.size.height

        self.frame = f
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var f = self.frame
        
        f.size.height = f.size.height / 2
        f.origin.y = f.origin.y + f.size.height
        
        self.frame = f
        
    }
    
}

