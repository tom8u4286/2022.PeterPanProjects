//
//  ViewController.swift
//  Project6.1
//
//  Created by 曲奕帆 on 2022/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    // 宣告imageView
    @IBOutlet var imageView: UIImageView!
    // 宣告segmentedControl
    @IBOutlet var segmentedControl: UISegmentedControl!
    // 宣告pageControl
    @IBOutlet var pageControl: UIPageControl!
    
    // 圖片檔名陣列
    let imageNames = [
        "Ai.jpeg",
        "Conan.png",
        "Lan.png",
        "Mori.jpeg",
        "Shinichi"
    ]
    // 當前顯示的圖片index
    var imageIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 設定imageView初始的圖片
        imageView.image = UIImage(named: imageNames[imageIndex])
        
        // 設定imageView的左滑gestureRecognizer
        let gestureRecognizerLeft = UISwipeGestureRecognizer(target: self, action: #selector(gestureFired(_:)))
        gestureRecognizerLeft.direction = .left
        gestureRecognizerLeft.numberOfTouchesRequired = 1
        imageView.addGestureRecognizer(gestureRecognizerLeft)
        
        // 設定imageView的右滑gestureRecognizer
        let gestureRecognizerRight = UISwipeGestureRecognizer(target: self, action: #selector(gestureFired(_:)))
        gestureRecognizerRight.direction = .right
        gestureRecognizerRight.numberOfTouchesRequired = 1
        imageView.addGestureRecognizer(gestureRecognizerRight)
        
        // 設定imageView為可互動元件
        imageView.isUserInteractionEnabled = true
        
    }
    
    /** 滑動imageView時，所觸發的function
     * 將會設定：
     * 1.imageView的圖片
     * 2.segmentedControl的位置
     * 3.pageControl點點的位置
     */
    @objc func gestureFired(_ sender: UISwipeGestureRecognizer){
        guard imageIndex <= 4 && imageIndex >= 0 else { return }
    
        // 若User向左滑動，imageIndex加一，並設定圖片
        if sender.direction == .left && imageIndex + 1 <= 4 {
            imageIndex += 1
            imageView.image = UIImage(named: imageNames[imageIndex])
        }
        // 若User向左滑動，imageIndex減一，並設定圖片
        if sender.direction == .right && imageIndex - 1 >= 0  {
            imageIndex -= 1
            imageView.image = UIImage(named: imageNames[imageIndex])
        }
        
        // 設定segmentedControl被選擇的選項
        segmentedControl.selectedSegmentIndex = imageIndex
        segmentedControl.sendActions(for: .valueChanged)
        
        // 設定點點的位置
        pageControl.currentPage = imageIndex
    }
    
    /** segmentedControl被點按時觸發的function
     * 將會設定：
     * 1.imageView的圖片
     * 2. pageControl的當前頁面點點
     */
    @IBAction func segmentChanged(_ sender: UISegmentedControl){
        // 設定圖片
        imageIndex = sender.selectedSegmentIndex
        imageView.image = UIImage(named: imageNames[imageIndex])
        
        // 設定點點位置
        pageControl.currentPage = imageIndex
    }
    
    @IBAction func pageControlValueChanged(_ sender: UIPageControl){
        // 設定圖片
        imageView.image = UIImage(named: imageNames[pageControl.currentPage])
        
        // 設定segmentedControl當前被選擇的選項
        segmentedControl.selectedSegmentIndex = pageControl.currentPage
        segmentedControl.sendActions(for: .valueChanged)
    }
}

