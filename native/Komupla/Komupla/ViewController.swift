//
//  ViewController.swift
//  Komupla
//
//  Created by Miguel Sesma on 22/04/2019.
//  Copyright © 2019 Sesma. All rights reserved.
//

import UIKit
import SharedCode

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
        label.center = CGPoint(x: 160, y: 200)
        label.textAlignment = .center
        label.font = label.font.withSize(25)
        label.text = CommonKt.createApplicationScreenMessage()
        view.addSubview(label)
        
        let label2 = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 21))
        label2.center = CGPoint(x: 160, y: 300)
        label2.textAlignment = .center
        label2.font = label.font.withSize(25)
        label2.text = WeatherApi.fetchWeather()
        view.addSubview(label2)
    }
}

