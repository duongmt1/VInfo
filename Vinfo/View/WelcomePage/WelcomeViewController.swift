//
//  WelcomeViewController.swift
//  Vinfo
//
//  Created by Mai Duong on 28/06/2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var tagTF: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        setupPlaceHolder(tf: userNameTF, placeHolder: "Username: ")
        setupPlaceHolder(tf: tagTF, placeHolder: "Tag: ")
        searchBtn.layer.cornerRadius = 4
        searchBtn.setTitle("Login", for: .normal)
        searchBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    private func setupPlaceHolder(tf: UITextField, placeHolder: String) {
        tf.attributedPlaceholder = NSAttributedString(
            string: placeHolder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black]
        )
    }
    
    @objc func login() {
        callAPI()
        print("tapped")
    }
    
    func callAPI() {
        guard let url = URL(string: baseURL) else { return }
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            print(data)
        })
        
        task.resume()
    }
}

/*
extension WelcomeViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissMyKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard() {
        view.endEditing(true)
    }
}
 */
