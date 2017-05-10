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
        
        let vertical = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.reportVerticalSwipe(_:)))
        vertical.direction = [.up, .down]
        view.addGestureRecognizer(vertical)
        
        let horizontal = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.reportHorizontalSwipe(_:)))
        horizontal.direction = [.left, .right]
        view.addGestureRecognizer(horizontal)
    }
    
    func reportHorizontalSwipe(_ recognizer: UIGestureRecognizer)
    {
        label.text = "Horizontal swipe detected"
        DispatchQueue.main.after(when: DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC))
        {
            self.label.text = ""
        }
    }
    
    func reportVerticalSwipe(_ recognizer: UIGestureRecognizer)
    {
        label.text = "Vertical swipe detected"
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
