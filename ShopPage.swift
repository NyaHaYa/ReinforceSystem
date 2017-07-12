//
//  ShopPage.swift
//  WeaponShop
//
//  Created by GP on 21/06/2017.
//  Copyright © 2017 Gameplay. All rights reserved.
//

import UIKit

class ShopPage: UIViewController {
    @IBOutlet weak var moneyLable: UILabel!
    @IBOutlet weak var spellLabel: UILabel!
    @IBOutlet weak var buySpellBtn: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    func ReloadMC() {
        moneyLable.text = "Money : \(money)"
        countLabel.text = "x \(count)"
    }
    
    func ReloadS() {
        statusLabel.text = ""
        statusLabel.textColor = UIColor.black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moneyLable.text = "Money : \(money)"
        
        spellLabel.text = "Magic Spell"
        spellLabel.textAlignment = .center
        
        countLabel.text = "x \(count)"
        countLabel.textAlignment = .right
        
        priceLabel.text = "50000"
        priceLabel.textAlignment = .center
        
        buySpellBtn.setTitle("Buy", for: .normal)
        buySpellBtn.isEnabled = true
        buySpellBtn.isSelected = true
        buySpellBtn.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        
        ReloadS()
        ReloadMC()
        
        
    }
    
    @IBAction func buyBtn(_ sender: UIButton) {
        if money >= 50000 {
            money = money - 50000
            count = count + 1
            ReloadMC()
            ReloadS()
        } else {
            statusLabel.text = "비용이 부족합니다"
            statusLabel.textColor = UIColor.red
            ReloadMC()
        }
    }
}
