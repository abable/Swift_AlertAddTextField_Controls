//
//  ViewController.swift
//  AddTextField
//
//  Created by Seungjun Lim on 24/05/2019.
//  Copyright © 2019 Seungjun Lim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBAction func show(_ sender: Any) {
        // 먼저 새로운 얼라트 컨트롤러 인스턴스를 만들자..
        let controller = UIAlertController(title: "Sign In to iTunes Store", message: nil, preferredStyle: .alert)
        
        controller.addTextField { (idField) in
            idField.placeholder = "Apple ID"
        }
        
        controller.addTextField { (passwordField) in
            passwordField.placeholder = "Input Password"
            passwordField.isSecureTextEntry = true
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] (action) in
            if let fieldList = controller.textFields {
                if let idField = fieldList.first {
                    self?.idLabel.text = idField.text
                }
                // 지금처럼 퍼스트 인덱스를 통해 접근할수도 있고 영번인텍스로 접근할수도 있다.
                
                if let passwordField = fieldList.last {
                    self?.passwordLabel.text = passwordField.text
                }
            }
        }
        controller.addAction(okAction)
        
        // cancel 추가
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        controller.addAction(cancelAction)
        
        present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

