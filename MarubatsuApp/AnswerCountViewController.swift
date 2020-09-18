//
//  AnswerCountViewController.swift
//  MarubatsuApp
//
//  Created by 天野修一 on 2020/09/12.
//  Copyright © 2020 shuichiama.com. All rights reserved.
//

import UIKit

class AnswerCountViewController: UIViewController {
    
//    var answerArray = [String]()
//    配列を.....
    
    var correctAnswerNumber = [String]()
    var correctAnswerCount = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//      ユーザデフォで値渡し
//        UserDefaults.standard.data(forKey: "correctAnswerCount")
        
        /*
        let userDefaults = UserDefaults.standard
                    
//          上の変数を使って、データを取ってきてnilチェック
        if userDefaults.object(forKey: "correctAnswercount") != nil {
            correctAnswerCount = userDefaults.object(forKey: "correctAnswerCount")
                as! [Int]}
        var correctAnswerNumber = "\(correctAnswerCount)問正解！"
        */
        
        
//        self.answerCountLabel?.text = correctAnswerNumber
//        self.answerCountLabel?.text = answerArray.last
//        配列を作って取り出そうとしたが断念...
    }
    


//for correctAnswerCount: Int
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
 
    
//  正解数を表示するラベル
    @IBOutlet var answerCountLabel: UILabel!

    
    
//  2つ前へのバックボタン
    @IBAction func backBackButton(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
//presentingViewControllerというプロパティには、モーダル表示された遷移前の画面が格納されており、
//上記のように2回書いた場合は、2つ前のViewControllerを指定する。
    }

    
}
