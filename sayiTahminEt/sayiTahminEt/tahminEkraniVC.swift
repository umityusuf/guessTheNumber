//
//  tahminEkraniVC.swift
//  sayiTahminEt
//
//  Created by ümit yusuf erdem on 31.01.2023.
//

import UIKit

class tahminEkraniVC: UIViewController {
    
    @IBOutlet weak var labelGuessRight: UILabel!
    @IBOutlet weak var labelHelp: UILabel!
    @IBOutlet weak var textFieldInput: UITextField!
    
    var randomNumber:Int?
    var right = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomNumber = Int.random(in: 0...100) // 0 - 100 arasında sayı üret
        print("Random Number : \(randomNumber!)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let gelenVeri = sender as? Bool {
            let gidilecekVC = segue.destination as! sonucEkraniVC
            gidilecekVC.sonuc = gelenVeri
            gidilecekVC.gelenSonuc = randomNumber
        }
    }
    
    @IBAction func tahminEt(_ sender: Any) {
        
        labelHelp.isHidden = false
        right -= 1
        if let veri = textFieldInput.text {
            
            if let tahmin = Int(veri) {
                
                if right != 0 {
                    
                    if tahmin == randomNumber {
                        let sonuc = true
                        performSegue(withIdentifier: "guessToResult", sender: sonuc)
                        return
                    }
                    
                    
                    if tahmin < randomNumber! {
                        
                        labelHelp.text = "Arttır"
                        labelGuessRight.text = "Tahmin Hakkı: \(right)"
                    }
                    
                    
                    if tahmin > randomNumber! {
                        
                        labelHelp.text = "Azalt"
                        labelGuessRight.text = "Tahmin Hakkı: \(right)"
                    }
                    
                    
                } else if right == 0 && randomNumber == tahmin {
                        let sonuc = true
                        performSegue(withIdentifier: "guessToResult", sender: sonuc)
                } else{
                    let sonuc = false
                    performSegue(withIdentifier: "guessToResult", sender: sonuc)
                }
                
                textFieldInput.text = ""
            }
            
        }
        
        
    }
    
    
}
