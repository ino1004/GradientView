//
//  UIColor + Hex.swift
//  VolleyBallsBoard
//
//  Created by Chui Kam Him on 2016/12/17.
//  Copyright © 2016年 Chui Kam Him. All rights reserved.
//

import UIKit

extension UIColor {
	
	enum Palette {
		static let black = UIColor.black
		static let white = UIColor(hexString: "e0e0e0")
		static let red = UIColor(hexString: "b71c1c")
		static let pink = UIColor(hexString: "e91e63")
		static let redOrange = UIColor(hexString: "f44336")
		static let orange = UIColor(hexString: "ff9800")
		static let amber = UIColor(hexString: "ffc107")
		static let yellow = UIColor(hexString: "ffeb3b")
		static let green = UIColor(hexString: "009688")
		static let lightGreen = UIColor(hexString: "8bc34a")
		static let lime = UIColor(hexString: "cddc39")
		static let cyan = UIColor(hexString: "00bcd4")
		static let blue = UIColor(hexString: "2196f3")
		static let indigo = UIColor(hexString: "3f51b5")
		static let purple = UIColor(hexString: "9c27b0")
		static let deepPurple = UIColor(hexString: "673ab7")
		static let brown = UIColor(hexString: "795548")
		static let blueGrey = UIColor(hexString: "607d8b")
	}
	
	var hexString: String {
		return self.toHexString()
	}
	
	convenience init(hexString:String, alpha: CGFloat? = nil) {
		
		let hexString:NSString = hexString.trimmingCharacters(in: .whitespacesAndNewlines) as NSString
		let scanner = Scanner(string: hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
		
		if (hexString.hasPrefix("#")) {
			scanner.scanLocation = 1
		}
		
		var color:UInt32 = 0
		scanner.scanHexInt32(&color)
		
		let mask = 0x000000FF
		let r = Int(color >> 16) & mask
		let g = Int(color >> 8) & mask
		let b = Int(color) & mask
		
		let red   = CGFloat(r) / 255.0
		let green = CGFloat(g) / 255.0
		let blue  = CGFloat(b) / 255.0
		
		self.init(red:red, green:green, blue:blue, alpha:alpha ?? 1)
	}

	func toHexString() -> String {
		var r:CGFloat = 0
		var g:CGFloat = 0
		var b:CGFloat = 0
		var a:CGFloat = 0
		
		getRed(&r, green: &g, blue: &b, alpha: &a)
		
		let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
		
		return NSString(format:"#%06x", rgb) as String
	}
}
