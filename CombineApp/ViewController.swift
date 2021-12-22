//
//  ViewController.swift
//  CombineApp
//
//  Created by Василий  on 22.12.2021.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    private var cancellebel: AnyCancellable?
    
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var purcaseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancellebel = NotificationCenter.default
                   .publisher(for: UITextField.textDidChangeNotification, object: priceTextField)
                   .map {$0.object as? UITextField }
                   .compactMap { $0?.text }
                   .map { str -> Bool in
                       if let number = Double(str) {
                           return number > 10
                       } else {
                           return false
                       }
                   }
                   .assign(to: \.isEnabled, on: purcaseButton)
    }
}

