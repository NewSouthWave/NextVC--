//
//  FirstViewController.swift
//  NextVC
//
//  Created by Nam on 7/19/24.
//

import UIKit

class FirstViewController: UIViewController {

    let mainLabel = UILabel()
//    let backButton = UIButton(type: .custom)
    
    //  클로져로 구현한 버튼
    let backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Back", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var someString: String? //  문자열 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setUp()
        configureUI()
    }
    
    func setUp() {
        
        view.backgroundColor = .gray
        
        
        // 레이블 관련 설정
        mainLabel.text = someString // mainLabel.text가 원래 optional string 형이라 바인딩 안해도 됨
        mainLabel.font = UIFont.systemFont(ofSize: 22)
        view.addSubview(mainLabel)
        
        // 버튼 관련 설정
//        backButton.setTitle("Back", for: .normal)
//        backButton.setTitleColor(.white, for: .normal)
//        backButton.backgroundColor = .blue
//        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        view.addSubview(backButton)
    }
    
    func configureUI() {
        
        
        // 레이블 오토레이아웃
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        
        // 버튼 오토레이아웃
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    @objc func backButtonTapped() {
        //  전 화면으로 돌아가는 메서드
        dismiss(animated: true, completion: nil)
        
    }
    
}
