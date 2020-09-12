//
//  QuestionViewController.swift
//  MarubatsuApp
//
//  Created by 天野修一 on 2020/09/12.
//  Copyright © 2020 shuichiama.com. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

//      classにdelegateを追加したため記述
        questionField.delegate = self
    }
    
//      userが保持したときに、コンテンツを入れる配列
    var questions:[[String:Any]] = [
    ]
    
//  テキストフィールド(記述)
    @IBOutlet var questionField: UITextField!
    
    
//  セグメントコントローラー ○か✗
    @IBOutlet var trueFalseController: UISegmentedControl!
    
    
//  保存するボタン
    @IBAction func tapSaveButton(_ sender: Any) {
//      テキストフィールドに何か記述された場合
        if questionField.text != "" {
            var trueFalseAnswer = true
            
            if trueFalseController.selectedSegmentIndex == 0 {
                trueFalseAnswer = false
            } else {
                trueFalseAnswer = true
            }
            
            
//          変数に保存したデータを入れる
            let userDefaults = UserDefaults.standard
            
//          上の変数を使って、データを取ってきてnilチェック
            if userDefaults.object(forKey: "questions") != nil {
                questions = userDefaults.object(forKey: "questions")
                    as! [[String: Any]]
//          nilじゃなければ、配列に格納。forKeyは同じもの
            }
            
//          テキストフィールドから配列questionsにappendで追加
            questions.append(
                ["question" : questionField.text!,
                 "answer":trueFalseAnswer
            ])
            
            
//         配列questionsのデータを保存。これにより更新可能
            userDefaults.set(questions,forKey: "questions")
//        ユーザーにアラートを表示
            showAlert(message: "Your question saved!!!")
            
            
            print(questions)
//          テキストフィールドを空にする
            questionField.text = ""
            
        } else {
            showAlert(message: "問題を作成してください！")
        }
    }
    
    
    
    
    
    
    
    
    
//    削除ボタン
    @IBAction func tapAllDeleteButton(_ sender: Any) {
        
//        短縮
        let userDefaults = UserDefaults.standard
        
//        保存内容を削除
        userDefaults.removeObject(forKey: "questions")
        
//        空の配列にしておく(nilによるエラー回避)
        userDefaults.set([],forKey: "questions")

        showAlert(message: "問題をすべて削除しました！")
    }
    
//バックボタン
    @IBAction func tapBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //    正解、不正解をalertで表示  messageをString型宣言し、後で使う
    func showAlert(message : String){
        
        //      オプションUIAlertC、Aを使い、要素を指定。
        let alert = UIAlertController(title: nil, message:message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "close", style: .cancel,handler: nil)
        
        //      ボタンを押した時にでるポップアップを追加
        alert.addAction(close)
        
        present(alert, animated: true, completion: nil)
    }
}
