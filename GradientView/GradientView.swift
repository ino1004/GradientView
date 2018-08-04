//
//  GradientView.swift
//  GradientView
//
//  Created by Stephen Chui on 2018/7/5.
//  Copyright © 2018年 Stephen Chui. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
	@IBInspectable
	public var fromColor: UIColor = .white {
		didSet {
			setNeedsLayout()
		}
	}
	
	@IBInspectable
	public var toColor: UIColor = .darkGray {
		didSet {
			setNeedsLayout()
		}
	}
	
	@IBInspectable
	public var fromValue: Int = 0 {
		didSet {
			setNeedsLayout()
		}
	}
	
	@IBInspectable
	public var toValue: Int = 1 {
		didSet {
			setNeedsLayout()
		}
	}

	// IBInspectable didnt support enum, so replaced it by Bool
	@IBInspectable
	public var isVertical: Bool = true {
		didSet {
			self.direction = isVertical ? .vertical : .horizontal
		}
	}
	
	// If direction set as vertical, it means the startPoint & endPoint of Y is fixed, you just need to set the X value.
	// if horizontal, the startPoint & endPoint of X is fixed.
	@objc public enum Direction: Int {
		case vertical, horizontal
	}
	public var direction: Direction = .vertical {
		didSet {
			setNeedsLayout()
		}
	}
	
    private var gradientLayer: CAGradientLayer = CAGradientLayer()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
	
	/// Init with color, direction & value
	convenience init(frame: CGRect, fromColor: UIColor, toColor: UIColor, direction: Direction, fromValue: Int, toValue: Int) {
		self.init(frame: frame)
		self.fromColor = fromColor
		self.toColor = toColor
		self.direction = direction
		self.fromValue = fromValue
		self.toValue = toValue
		self.setNeedsLayout()
	}
	
    override func layoutSubviews() {
		layer.sublayers?.forEach {
			$0.removeFromSuperlayer()
		}
		gradientLayer.frame = self.bounds
		gradientLayer.colors = [fromColor.cgColor, toColor.cgColor]
		switch direction {
		case .vertical:
			gradientLayer.startPoint = CGPoint(x: fromValue, y: 0)
			gradientLayer.endPoint = CGPoint(x: toValue, y: 1)
		case .horizontal:
			gradientLayer.startPoint = CGPoint(x: 0, y: fromValue)
			gradientLayer.endPoint = CGPoint(x: 1, y: toValue)
		}
		layer.addSublayer(gradientLayer)
    }
}
