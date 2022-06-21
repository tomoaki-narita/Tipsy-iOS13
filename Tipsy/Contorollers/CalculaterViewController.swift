//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculaterViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"
    
    //tipボタン(%)
    @IBAction func tipChanged(_ sender: UIButton) {
        
        //どれか一つを選択したらキーボードを閉じる
        billTextField.endEditing(true)
        
        //isSelected(選択されているか)をfalseにしておく
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        //タップされたボタンのみをtrueに(他のボタンが選択解除されるようにする)
        sender.isSelected = true
        
        //タップされたボタンのタイトルを取得する(◯○%)
        let buttonTitle = sender.currentTitle!
        
        //タイトルから最後の文字（％）を削除してから、文字列に戻す(String型)
        //dropLast(一番最後の値を削除)、dropFirst(一番最初の値を削除)
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        
        //String型からDouble型に変換して、定数buttonTitleAsANumberとする
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        
        //buttonTitleAsANumber(Doubl型)に入っている値を100で割る
        //10なら0.1
        tip = buttonTitleAsANumber / 100
    }
    
    //+,-ボタン
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        //senderに入ってきた値(value)を取得して整数に切り捨ててテキストとして表示
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        //senderの値をInt型に変換して、定数numberOfPeopleに入れる
        numberOfPeople = Int(sender.value)
        
        
    }
    
    
    //計算ボタン
    @IBAction func calculatePressed(_ sender: UIButton) {
        //billTextFieldに入力された値を取得し、billとする
        let bill = billTextField.text!
        
        //もしbillが空の文字列でない場合
        if bill != "" {
            
            //billの値をDouble型に変換してbillTotalに入れる
            billTotal = Double(bill)!
            
            //billTotal(billTextFieldのtext)にtip(%)を掛けて人数で割る
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            
            //計算した結果を小数点以下2桁までにしてString型(文字列)に変換
            finalResult = String(format: "%.2f", result)
        }
        
        //identifierがgoToResultsに設定されたsegueが実行される(画面遷移のコード)
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    //segueが実行される直前にトリガーされるメソッド(値渡し)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //現在トリガーされているセグエが「goToResults」だったら
        if segue.identifier == "goToResults" {
            
            //ResultsViewController(遷移先のVC)をインスタンス化(destinationVC)
            let destinationVC = segue.destination as! ResultsViewController
            
            //宛先のResultsViewControllerのプロパティを設定(渡す値)
            //遷移先のViewControllerに作った変数 = 渡したい変数
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
        }
    }
}

