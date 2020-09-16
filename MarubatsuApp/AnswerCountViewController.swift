//
//  AnswerCountViewController.swift
//  MarubatsuApp
//
//  Created by 天野修一 on 2020/09/12.
//  Copyright © 2020 shuichiama.com. All rights reserved.
//

import UIKit

class AnswerCountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


    func getCorrectAnswerNumber(for correctAnswerCount: Int){
        
        let correctAnswerNumber = "\(correctAnswerCount)問正解！"
        
        print("インスタンス接続ok",correctAnswerNumber)
        
//        DispatchQueue.main.async {
        self.answerCountLabel?.text = correctAnswerNumber
//        }
    }
    
//  正解数を表示するラベル
    @IBOutlet var answerCountLabel: UILabel!

    
    
//  2つ前へのバックボタン
    @IBAction func backBackButton(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
//presentingViewControllerというプロパティには、モーダル表示された遷移前の画面が格納されており、
//上記のように2回書いた場合は、2つ前のViewControllerを指定する。
    }

    
}
