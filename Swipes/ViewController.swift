//  ViewController.swift
//  Swipes
//
//  Created by Daniel Catlett on 5/10/17.
//  Copyright © 2017 Daniel Catlett. All rights reserved.

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var label: UILabel!
    private var gestureStartPoint:CGPoint!
    private static let minimumGestureLength = Float(25.0)
    private static let maximumVariance = Float(5)

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        for touchCount in 0..<5
        {
            let vertical = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.reportVerticalSwipe(_:)))
            vertical.direction = [.up, .down]
            vertical.numberOfTouchesRequired = touchCount
            view.addGestureRecognizer(vertical)
            let horizontal = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.reportHorizontalSwipe(_:)))
            horizontal.direction = [.left, .right]
            horizontal.numberOfTouchesRequired = touchCount
            view.addGestureRecognizer(horizontal)
        }

    }
    
    func descriptionForTouchCount(_ touchCount:Int) -> String
    {
        switch touchCount
        {
        case 1:
            return "Single"
        case 2:
            return "Double"
        case 3:
            return "Triple"
        case 4:
            return "Quadruple"
        case 5:
            return "Quintuple"
        default:
            return ""
        }
    }
    
    func reportHorizontalSwipe(_ recognizer:UIGestureRecognizer)
    {
        label.text = "Horizontal swipe detected"
        let count = descriptionForTouchCount(recognizer.numberOfTouches)
        label.text = "\(count)-finger horizontal swipe detected"
        DispatchQueue.main.after(when: DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC))
        {
            self.label.text = ""
        }
    }
    func reportVerticalSwipe(_ recognizer:UIGestureRecognizer)
    {
        label.text = "Vertical swipe detected"
        let count = descriptionForTouchCount(recognizer.numberOfTouches)
        label.text = "\(count)-finger vertical swipe detected"
        DispatchQueue.main.after(when: DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC))
        {
            self.label.text = ""
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
