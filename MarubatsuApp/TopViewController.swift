//
//  TopViewController.swift
//  MarubatsuApp
//
//  Created by 天野修一 on 2020/09/12.
//  Copyright © 2020 shuichiama.com. All rights reserved.
//

//おつかれさま
import UIKit

class TopViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

//  アンサービューへの移動ボタン
    @IBAction func toAnswerButton(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let second = storyboard.instantiateViewController(withIdentifier: "answerView")
        second.modalPresentationStyle = .fullScreen
        
        self.present(second, animated: true, completion: nil)
    }
    
//  問題文作成ビューへの移動ボタン
    @IBAction func toQuestionButton(_ sender: Any) {
        
        let storyboard: UIStoryboard = self.storyboard!
        let second = storyboard.instantiateViewController(withIdentifier: "questionView")
        second.modalPresentationStyle = .fullScreen

        self.present(second, animated: true, completion: nil)
    }
    
}
