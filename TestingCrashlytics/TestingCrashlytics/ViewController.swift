//
//  ViewController.swift
//  TestingCrashlytics
//
//  Created by Gabriel Merenfeld on 29/04/26.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
          super.viewDidLoad()

          // Do any additional setup after loading the view, typically from a nib.

          let button = UIButton(type: .roundedRect)
          button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
          button.setTitle("Test Crash", for: [])
          button.addTarget(self, action: #selector(crashButtonTapped), for: .touchUpInside)
          view.addSubview(button)
      }

      @objc func crashButtonTapped(_ sender: AnyObject) {
          let numbers = [0]
          let _ = numbers[1]
      }
}

