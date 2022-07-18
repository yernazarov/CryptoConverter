//
//  ViewController.swift
//  CryptoConverter
//
//  Created by Zhandos Yernazarov on 5/8/20.
//  Copyright © 2020 Zhandos Yernazarov. All rights reserved.
//

import UIKit
import AVFoundation

class ConverterViewController: UIViewController, UITextFieldDelegate {
    var firstQuote: Quote?
    var secondQuote: Quote?
    var isFirstButtonClicked: Bool?
    var player : AVAudioPlayer?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        NotificationCenter.default.addObserver(self, selector: #selector(receiveSelectQuoteNotification), name: NotificationSendSelectedQuote, object: nil)
    }
    @objc func receiveSelectQuoteNotification(notification: Notification){
        if let quotes1 = notification.object as? Quote{
            if isFirstButtonClicked == true{
                firstQuote = quotes1
            }else{
                secondQuote = quotes1
            }
        }
    }
    
    @IBOutlet weak var firstQuoteButton: UIButton!
    @IBOutlet weak var secondQuoteButton: UIButton!
    @IBOutlet weak var firstInputTxtFld: UITextField!
    @IBOutlet weak var secondInputTxtFld: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let soundPath = Bundle.main.path(forResource: "blaster", ofType: "wav")
        let url = URL(string: soundPath!)
        player = try! AVAudioPlayer(contentsOf: url!)
        firstInputTxtFld.delegate = self
        secondInputTxtFld.delegate = self
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let firstQuote = firstQuote,
            let secondQuote = secondQuote else {
            return
        }
        if firstInputTxtFld.isEditing == true, firstInputTxtFld.text != ""{
            let baseQuote = Converter(baseQuote: firstQuote.price)
            var count: Double? {
                return Double(firstInputTxtFld.text!)
            }
            secondInputTxtFld.text = String(baseQuote.convert(count!, secondQuote.price))
        }else {
            secondInputTxtFld.text = ""
        }
    }
    @IBAction func hideKeyBoard(_ sender: Any) {
        player!.play()
        firstInputTxtFld.resignFirstResponder()
        secondInputTxtFld.resignFirstResponder()
    }
    @IBAction func firstQuoteButtonClick(_ sender: Any) {
        player!.play()
        isFirstButtonClicked = true
    }
    @IBAction func secondQuoteButtonClick(_ sender: Any) {
        player!.play()
        isFirstButtonClicked = false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? QuoteTableViewController {
            destination.isSelectQuoteMode = true
        }
    }
}
