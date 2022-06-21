//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by output. on 2020/08/24.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingsLabel: UILabel!
    
    //CalculaterViewControllerから渡ってきた値を受け取る変数を準備
    var result = "0.0"
    var tip = 10
    var split = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //totalLabelのtextに受け取ったresultを表示
        totalLabel.text = result
        
        //settingsLabelのtextにsplitとtipを文を合わせて表示
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    //遷移先画面を閉じる(遷移元に戻る)メソッド
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
}
