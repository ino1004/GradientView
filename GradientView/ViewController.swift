//
//  ViewController.swift
//  GradientView
//
//  Created by Stephen Chui on 2018/8/4.
//  Copyright © 2018年 Stephen Chui. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var gradientView: GradientView!
	
//	private var gradientView: GradientView!
	
	private var colors: [UIColor] = [UIColor(hexString: "D32F2F"),
									 UIColor(hexString: "512DA8"),
									 UIColor(hexString: "00796B"),
									 UIColor(hexString: "689F38"),
									 UIColor(hexString: "303F9F"),
									 UIColor(hexString: "0288D1"),
									 UIColor(hexString: "FBC02D"),
									 UIColor(hexString: "F57C00"),
									 UIColor(hexString: "5D4037")]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//		gradientView = GradientView(frame: view.bounds)
//		gradientView.fromColor = .red
//		gradientView.toColor = .yellow
//		gradientView.direction = .vertical
//		gradientView.fromValue = 0
//		gradientView.toValue = 1
//		view.addSubview(gradientView)
//		view.sendSubview(toBack: gradientView)
	}

	@IBAction func buttonDidPress(_ sender: UIButton) {
		gradientView.fromColor = gradientView.toColor
		let randomColor = colors[Int(arc4random_uniform(UInt32(colors.count)))]
		gradientView.toColor = randomColor
	}
}

