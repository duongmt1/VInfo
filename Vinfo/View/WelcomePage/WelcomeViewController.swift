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
    var homePageTabbar: HomePageViewController?
    var newsTabbar: NewsViewController?
    let tabbarController = UITabBarController()
    
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
        setupTabbar()
        goToHomePage()
    }
    
    func setupTabbar() {
        tabbarController.viewControllers = [homePageTabbar!, newsTabbar!]
        
        let firstTabbarItem = UITabBarItem(title: "Home", image: nil, tag: 0)
        let secondTabbarItem = UITabBarItem(title: "News", image: nil, tag: 1)
        
        homePageTabbar?.tabBarItem = firstTabbarItem
        newsTabbar?.tabBarItem = secondTabbarItem
    }
    
    func goToHomePage() {
        self.navigationController?.pushViewController(tabbarController, animated: true)
    }
    
    func callAPI() {
        guard let url = URL(string: baseURL) else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
            } else {
                if let data = data {
                    print(data)
                }
            }
            
        }).resume()
        
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
