//
//  ViewController.swift
//  NextVC
//
//  Created by Allen H on 2021/12/05.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 1) 코드로 화면 이동 (다음화면이 코드로 작성되어있을때만 가능한 방법)
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let firstVC = FirstViewController()
        
        firstVC.someString = "Baby Shark"   // FirstViewController의 변수에 값을 전달해주

        
        firstVC.modalPresentationStyle = .fullScreen    //  전체화면으로 띄우기
        
        present(firstVC, animated: true, completion: nil)
                
        
        
    }
    
    // 2) 코드로 스토리보드 객체를 생성해서, 화면 이동
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        guard let SecondVC = storyboard?.instantiateViewController(identifier: "secondVC") as? SecondViewController else {
            return
        }
        
        SecondVC.someString = "Father Shark"
        
        present(SecondVC, animated: true, completion: nil)
        
    }
    
    
    
    // 3) 스토리보드에서의 화면 이동(간접 세그웨이)
    @IBAction func storyboardWithSegueButtonTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toThirdVC", sender: self) // 세그웨이를 작동시키는 메서드

        
        
    }
    
    // 3) 데이터를 전달하는 메서드 재정의
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThirdVC" {
            let thirdVC = segue.destination as! ThirdViewController // 타입 캐스팅 필요
            
            // 데이터 전달
            thirdVC.someString = "Mother Shark"
        }
        
        if segue.identifier == "toFourthVC" {
            let fourthVC = segue.destination as! FourthViewController // 타입 캐스팅 필요
            
            // 데이터 전달
            fourthVC.someString = "Bye Shark"
        }
        
    }

    var segueAloow = true

    //  4) 조건에 따라 세그웨이를 실행할 것인지 결정  (버튼으로 직접 세그웨이를 연결했을 경우만 실행가능
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if segueAloow {
            return true
        } else {
            return false
        }
        
    }
    
    
}

