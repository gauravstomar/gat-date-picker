//
//  CircularView.swift
//  exzeo.analytics
//
//  Created by Himanshu on 17/02/17.
//  Copyright © 2017 Gaurav Singh. All rights reserved.
//

import UIKit

@IBDesignable class GSTCircularView : UIView {
    
    @IBInspectable var bgColor: UIColor = UIColor.clear
    private var circleFillBezierPath: UIBezierPath!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.width/2
        layer.masksToBounds = true
        
        circleFillBezierPath = UIBezierPath()
        circleFillBezierPath.addArc(withCenter: CGPoint(x: bounds.width/2, y: bounds.height/2), radius: bounds.width/2, startAngle: 0.0, endAngle: CGFloat(2 * M_PI), clockwise: false)
        
        let maskLayer = CAShapeLayer()
        maskLayer.fillColor = bgColor.cgColor
        maskLayer.path = circleFillBezierPath.cgPath
        
        layer.insertSublayer(maskLayer, at: 0)
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        super.point(inside: point, with: event)
        
        print(circleFillBezierPath.contains(point))
        
        return circleFillBezierPath.contains(point)
    }
}
