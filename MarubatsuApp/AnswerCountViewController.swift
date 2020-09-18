//
//  AnswerCountViewController.swift
//  MarubatsuApp
//
//  Created by 天野修一 on 2020/09/12.
//  Copyright © 2020 shuichiama.com. All rights reserved.
//

import UIKit

class AnswerCountViewController: UIViewController {
    
//    配列を.....
    
    var correctAnswerNumber = [String]()
    var correctAnswerCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//      ユーザデフォで値渡し
        
        let userDefaults = UserDefaults.standard
        
        
        if userDefaults.object(forKey: "correctAnswerCount") != nil{
            correctAnswerCount = userDefaults.integer(forKey: "correctAnswerCount")
        }
        
        print(correctAnswerCount)
        
        self.answerCountLabel?.text = "\(correctAnswerCount)問正解！"
    }
        
    /*UserDefaultsを使うので、要らないからコメントアウト
    func getCorrectAnswerNumber(for finalCount: String){
        
        
//        let finalCount = String(correctAnswerCount)
        if  finalCount != ""{
            let correctAnswerNumber = "\(finalCount)問正解！"

//        print("インスタンス接続ok",correctAnswerNumber)
        DispatchQueue.main.async {
            print("ラベル前接続ok")

        self.answerCountLabel?.text = String(correctAnswerNumber)
            print("ラベル後接続ok",correctAnswerNumber)
        }

        }
        
    }
 ここまで*/
    
//  正解数を表示するラベル
    @IBOutlet var answerCountLabel: UILabel!

    
    
//  2つ前へのバックボタン
    @IBAction func backBackButton(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
//presentingViewControllerというプロパティには、モーダル表示された遷移前の画面が格納されており、
//上記のように2回書いた場合は、2つ前のViewControllerを指定する。
    }

    
}
