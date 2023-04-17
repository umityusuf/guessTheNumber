//
//  sonucEkraniVC.swift
//  sayiTahminEt
//
//  Created by ümit yusuf erdem on 31.01.2023.
//

import UIKit

class sonucEkraniVC: UIViewController {

    @IBOutlet weak var imageViewResult: UIImageView!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var sonucLabel: UILabel!
    
    var sonuc:Bool?
    var gelenSonuc:Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true // geri tuşunu iptal et
        
        self.navigationItem.title = "Sonuç Ekranı" // başlık yazma

        print(sonuc!)
        
        if sonuc! {
            labelResult.text = "Kazandınız !🥳"
            sonucLabel.text = "Sonuç : \(String(gelenSonuc!))"
            imageViewResult.image = UIImage(named: "happyFace")
        } else {
            labelResult.text = "Kaybettiniz 🙁"
            imageViewResult.image = UIImage(named: "sadFace")
            sonucLabel.text = "Sonuç : \(String(gelenSonuc!))"
        }
        
        
    }
    

    @IBAction func tekrarOyna(_ sender: Any) {
        
        navigationController?.popToRootViewController(animated: true)
    }
    

}
