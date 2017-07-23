//
//  ViewController.swift
//  WeaponShop
//
//  Created by GP on 21/06/2017.
//  Copyright © 2017 Gameplay. All rights reserved.
//  Git!

import UIKit
import GameplayKit

var lv1 = "lv1.png"
var lv2 = "lv2.png"
var lv3 = "lv3.png"
var lv4 = "lv4.png"
var lv5 = "lv5.png"
var lv6 = "lv6.png"
var lv7 = "lv7.png"
var lv8 = "lv8.png"
var lv9 = "lv9.png"
var lv10 = "lv10.png"

var tf: Int = 1
var count: Int = 0
var level: Int = 1
var money: Int = 10000
var SwordItem: Int = 0

let levelArr = [1000,2000,6000,12000,18000,36000,80000,160000,240000,300000,400000,800000,1200000,1600000,2000000,2800000,3600000]
let prob = [0,8,10,14,18,23,25,34,43,48,52,21,13,61,70,33,73]
class ViewController: UIViewController {
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var sellBtn: UIButton!
    @IBOutlet weak var reinBtn: UIButton!
    @IBOutlet weak var weaponViewImg: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var payLabel: UILabel!
    @IBOutlet weak var restartLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    
    let random = GKARC4RandomSource()
    

//    ----- 돈의 상태를 새로고침 -------------------------------------------
    func Reload() {
        // 돈의 상태를 재 출력
        moneyLabel.text = "Money : \(money)"
        restartLabel.text = "부활권 : \(count)"
        levelLabel.text = "Lv.\(level)"
    }
    
//    ----- 현재 자금의 상태를 출력하는 함수-----------------------------------
    func Status() {
        /*
         * 돈이 만약 0 보다 작아질 경우에 "돈이 없습니다" 를 출력하고 돈이 0 밑으로 내려가지 않게
         * 해주고 돈의 상태를 초기화 & 리로드
         */
        
        if money <= 0 // 현 자금이 0보다 작거나 같을 때 출력
        {
            statusLabel.text = "돈이 없습니다."
            money = 0
            Reload()
        }
            
        else if money > 0
        {
            statusLabel.text = "" // 현재 자금의 상태를 알려주는 레이블
            Reload()
        }
    }
    
//    ------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Reload()
        
        navigationItem.title = "Reinforce" // 강화
        
        sellBtn.setTitle("팔기", for: .normal)
        sellBtn.isEnabled = true
        sellBtn.isSelected = true // 버튼이 선택되었을 때를 활성화
        sellBtn.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        
        reinBtn.setTitle("강화", for: .normal)
        reinBtn.isSelected = true
        reinBtn.isEnabled = true
        reinBtn.tintColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        
        weaponViewImg.image = UIImage(named: "\(lv1)")
        
        payLabel.textAlignment = .right
        
        restartLabel.text = "부활권 : \(count)"
        restartLabel.textAlignment = .right
        
        levelLabel.text = "Lv.\(level)"
        
        Reload()
        
    }
    
//    ---------------------------------------------------------------
    override func viewWillAppear(_ animated: Bool) {
        restartLabel.text = "부활권 : \(count)"
        moneyLabel.text = "Money : \(money)"
    }
    
//    ---------------------------------------------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

//    --------- 돈 마이너스 ----------------------------------------------
    @IBAction func moneyIncreaseBtn(_ sender: Any) {
        money = 10000
        Reload()
        Status()
    }

//    ----- 아이템 팔기 ---------------------------------------------------
    @IBAction func itemSellBtn(_ sender: Any) {
        
        if tf == 1 {
            if level == 1 {
                payLabel.text = "팔 수 없습니다."
                level = 1
            } else {
                money += SwordItem
                Reload()
                Status()
                
                level = 1
                weaponViewImg.image = UIImage(named: "lv1.png")
            }
        } else if tf == 0 {
            level = 1
            sellBtn.setTitle("팔기", for: .normal)
            reinBtn.setTitle("강화", for: .normal)
            weaponViewImg.image = UIImage(named: "\(lv1)")
            tf = 1
        }
        Reload()
        payLabel.text = ""
    }

//     ----- 확률 ------
    func reinforce(reinPrice: Int, probub: Int, price: Int, image: String) {
        
        payLabel.text = ""
        
        let ran = random.nextInt(upperBound: 100)
        
        if money >= reinPrice {
            money = money - reinPrice
            Reload()
            Status()
            tf = 1
            
            if ran > probub {
                weaponViewImg.image = UIImage(named: "\(image)")
                level += 1
                SwordItem = price
                Reload()
                Status()
                
            } else {
                payLabel.text = "실패"
                tf = 0
                
                if tf == 1 {
                    sellBtn.setTitle("팔기", for: .normal)
                    reinBtn.setTitle("강화", for: .normal)
                }
                else if tf == 0 {
                    reinBtn.setTitle("부활", for: .normal)
                    sellBtn.setTitle("시작", for: .normal)
                }
                
                switch level {
                case 2:
                    weaponViewImg.image = UIImage(named: "lv2.png")
                case 3:
                    weaponViewImg.image = UIImage(named: "lv3.png")
                case 4:
                    weaponViewImg.image = UIImage(named: "lv4.png")
                case 5:
                    weaponViewImg.image = UIImage(named: "lv5.png")
                case 6:
                    weaponViewImg.image = UIImage(named: "lv6.png")
                case 7:
                    weaponViewImg.image = UIImage(named: "lv7.png")
                case 8:
                    weaponViewImg.image = UIImage(named: "lv8.png")
                case 9:
                    weaponViewImg.image = UIImage(named: "lv9.png")
                case 10:
                    weaponViewImg.image = UIImage(named: "lv10.png")
                case 11:
                    weaponViewImg.image = UIImage(named: "lv2.png")
                case 12:
                    weaponViewImg.image = UIImage(named: "lv3.png")
                case 13:
                    weaponViewImg.image = UIImage(named: "lv4.png")
                case 14:
                    weaponViewImg.image = UIImage(named: "lv5.png")
                case 15:
                    weaponViewImg.image = UIImage(named: "lv6.png")
                case 16:
                    weaponViewImg.image = UIImage(named: "lv7.png")
                case 17:
                    weaponViewImg.image = UIImage(named: "lv10.png")
                default:
                    ()
                }
            }
        } else {
            payLabel.text = "강화 비용이 부족합니다."
        }
    }
    
    func restart(consum: Int, image: String) {
        if tf == 0 {
            if count >= consum {
                count = count-consum
                tf = 1
                weaponViewImg.image = UIImage(named: "\(image)")
                levelLabel.text = "Lv.\(level) \(consum)"
            } else {
                payLabel.text = "부활권이 부족합니다"
            }
        }
    }

//    -----------------------------------------------------------------
    @IBAction func ReinBtn(_ sender: Any) {
        
        if tf == 1 {
            sellBtn.setTitle("팔기", for: .normal)
            reinBtn.setTitle("강화", for: .normal)
            print(tf)
            
            switch level {
            case 1:
                reinforce(reinPrice: 1000, probub: 0, price: 30000, image: lv2)
                
            case 2:
                reinforce(reinPrice: 2000, probub: 8, price: 60000, image: lv3)
                
            case 3:
                reinforce(reinPrice: 6000, probub: 10, price: 120000, image: lv4)
                
            case 4:
                reinforce(reinPrice: 12000, probub: 14, price: 240000, image: lv5)
                
            case 5:
                reinforce(reinPrice: 18000, probub: 18, price: 400000, image: lv6)
                
            case 6:
                reinforce(reinPrice: 36000, probub: 23, price: 900000, image: lv7)
                
            case 7:
                reinforce(reinPrice: 80000, probub: 25, price: 2000000, image: lv8)
                
            case 8:
                reinforce(reinPrice: 160000, probub: 34, price: 4000000, image: lv9)
                
            case 9:
                reinforce(reinPrice: 240000, probub: 43, price: 8000000, image: lv10)
                
            case 10:
                reinforce(reinPrice: 300000, probub: 48, price: 10000000, image: lv1)
                
            case 11:
                reinforce(reinPrice: 400000, probub: 52, price: 20000000, image: lv2)
                
            case 12:
                reinforce(reinPrice: 800000, probub: 21, price: 40000000, image: lv3)
                
            case 13:
                reinforce(reinPrice: 1200000, probub: 13, price: 80000000, image: lv4)
                
            case 14:
                reinforce(reinPrice: 1600000, probub: 61, price: 100000000, image: lv5)
                
            case 15:
                reinforce(reinPrice: 2000000, probub: 70, price: 150000000, image: lv6)
                
            case 16:
                reinforce(reinPrice: 2800000, probub: 33, price: 200000000, image: lv7)
                
            case 17:
                reinforce(reinPrice: 3600000, probub: 73, price: 500000000, image: lv10)
                
            default:
                ()
            }
            
        }
            
        else if tf == 0 {
            reinBtn.setTitle("부활", for: .normal)
            sellBtn.setTitle("시작", for: .normal)
            
            switch level {
            case 2:
                level = 2
                restart(consum: 1, image: lv2)
                statusLabel.text = "Lv.\(level) (1)"
            case 3:
                level = 3
                restart(consum: 1, image: lv3)
                statusLabel.text = "Lv.\(level) (1)"
            case 4:
                level = 4
                restart(consum: 1, image: lv4)
                statusLabel.text = "Lv.\(level) (1)"
            case 5:
                level = 5
                restart(consum: 1, image: lv5)
                statusLabel.text = "Lv.\(level) (1)"
            case 6:
                level = 6
                restart(consum: 2, image: lv6)
                statusLabel.text = "Lv.\(level) (2)"
            case 7:
                level = 7
                restart(consum: 4, image: lv7)
                statusLabel.text = "Lv.\(level) (4)"
            case 8:
                level = 8
                restart(consum: 8, image: lv8)
                statusLabel.text = "Lv.\(level) (8)"
            case 9:
                level = 9
                restart(consum: 16, image: lv9)
                statusLabel.text = "Lv.\(level) (16)"
            case 10:
                level = 10
                restart(consum: 32, image: lv10)
                statusLabel.text = "Lv.\(level) (32)"
            case 11:
                level = 11
                restart(consum: 40, image: lv2)
                statusLabel.text = "Lv.\(level) (40)"
            case 12:
                level = 12
                restart(consum: 60, image: lv3)
                statusLabel.text = "Lv.\(level) (60)"
            case 13:
                level = 13
                restart(consum: 80, image: lv4)
                statusLabel.text = "Lv.\(level) (80)"
            case 14:
                level = 14
                restart(consum: 100, image: lv5)
                statusLabel.text = "Lv.\(level) (100)"
            case 15:
                level = 15
                restart(consum: 120, image: lv6)
                statusLabel.text = "Lv.\(level) (120)"
            case 16:
                level = 16
                restart(consum: 140, image: lv7)
                statusLabel.text = "Lv.\(level) (140)"
            case 17:
                level = 17
                restart(consum: 160, image: lv8)
                statusLabel.text = "Lv.\(level) (160)"
            default:
                ()
            }
        }
        
        Reload()
        
    }
    
    @IBAction func Increase(_ sender: UIBarButtonItem) {
        money += 1000000
        Reload()
    }
    
}
