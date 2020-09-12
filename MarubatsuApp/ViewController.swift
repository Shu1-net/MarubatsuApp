//
//  ViewController.swift
//  MarubatsuApp
//
//  Created by 天野修一 on 2020/09/12.
//  Copyright © 2020 shuichiama.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//      アプリが開いたときに作成した問題を表示する！！
        showQuestion()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
//          配列を空にしておく
            questions = []
//      保存内容を短縮
        let userDefaults = UserDefaults.standard
        
        if userDefaults.object(forKey: "questions") != nil {
            
            questions = userDefaults.object(forKey: "questions")as! [[String:Any]]
        }
        
        
        showQuestion()
    }
    
    @IBOutlet var questionLabel: UILabel!
    
//      問題以降のための数字を積む変数
    var currentQustionsNumber:Int = 0
//      正解数をカウントする変数
    var answerCount:Int = 0
//  配列(辞書)のデータの順番。アクセスするため、Int型
    
    
    var questions:[[String:Any]] = []
//    配列を宣言(class内ならどこでもいい)
    
/*        let questions:[[String:Any]] =
    [
        [
        "question":"BLEACHの吉良イヅルの斬魄刀の解号名は「面を上げろ、侘助」である",
        "answer":true
        ],
        
        [
        "question":"SKET DANCEのスイッチの好きな十刃はゾマリ・ルルーである",
        "answer":false
        ],
        
        [
        "question":"法律なんかクソくらえ",
        "answer":false
        ]
    ]
*/
    
//  問題を表示するための関数。これの名前を指定して呼び起こす
    func showQuestion(){
//      配列が空でなければ、、、
        if questions.count > currentQustionsNumber{
            let question = questions[currentQustionsNumber]
//      as? Stringはルール(気にしなくてよい)
            if let que = question["question"] as? String {
//           keyを指定し、データ(問題文)をLabelに表示
                questionLabel.text = que
                
                falseButton.isEnabled = true
                trueButton.isEnabled = true
                
            } else {
                
                questionLabel.text = "問題文を入力してください！"
                falseButton.isEnabled = false
                trueButton.isEnabled = false
                
            }
        }
    }
    
    
//  回答のチェック関数  (後にボタンで使うためにuserAnswerはBool型だと宣言)
    func checkAnswer(userAnswer:Bool){
        
//      変数名は同じだが、中身は違う
        let question = questions[currentQustionsNumber]
        
        if let ans = question["answer"] as? Bool{
//      答えがあってるかどうか判断！
//          合ってれば、次の問題に移行できるようにする
            if userAnswer == ans{
//              正解の場合
                answerCount += 1
                currentQustionsNumber += 1
                showAlert(message: "正解")
                
            } else {
//              不正解の場合
                currentQustionsNumber += 1
                showAlert(message: "不正解")
            }
        }
    //  エラー落ちを防ぐため
        else {print("答えがありません")
                return
        }
        
        print(currentQustionsNumber)
//      正解でも次の問題を表示、不正解の場合でも次の問題を表示
        if currentQustionsNumber < questions.count {
            showQuestion()
        } else {
//            goToAnswerCount()
        }
    }
/*
//        問題数を上回ったときに最初の問題に戻るため。＋新しいviewに移動
        if currentQustionsNumber ==  questions.count {
//           currentQustionsNumber = 0
//正答数をカウントした変数を保存し、別ファイルで呼び起こせるようにする
            print("移動する前")
            
            let storyboard: UIStoryboard = self.storyboard!
            let third = storyboard.instantiateViewController(withIdentifier: "answerCountView")
            self.present(third, animated: true, completion: nil)
        }
            print("移動できた？")
//      正解だったら次の問題を表示、不正解の場合は同じ問題を再度表示
        showQuestion()
        print(answerCount)
        print(currentQustionsNumber)
    }
*/
 
    

//    最後の問題を解くと、画面が移り変わるアクション
    func goToAnswerCount(){
        //        問題数を上回ったときに最初の問題に戻るため。＋新しいviewに移動
//        if currentQustionsNumber >=  questions.count {
            //           currentQustionsNumber = 0
            //正答数をカウントした変数を保存し、別ファイルで呼び起こせるようにする
            
            let storyboard: UIStoryboard = self.storyboard!
            let third = storyboard.instantiateViewController(withIdentifier: "answerCountView") as! AnswerCountViewController
//        sleep(UInt32(2.5))
            self.present(third, animated: true, completion: nil)
        print("移動できた？")
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
    
    
//アウトレット用ボタン
    @IBOutlet var falseButton: UIButton!
    
    
    @IBOutlet var trueButton: UIButton!
    
    
    
    
//アクション用ボタン
    @IBAction func falseButton(_ sender: Any) {
        
        checkAnswer(userAnswer: false)
        
    }
    
    @IBAction func trueButton(_ sender: Any) {
        
        checkAnswer(userAnswer: true)
        
    }
    
    
//バックボタン
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
}

