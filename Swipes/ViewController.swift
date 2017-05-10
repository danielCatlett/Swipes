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
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if let touch = touches.first
        {
            gestureStartPoint = touch.location(in: self.view)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        if let touch = touches.first, let gestureStartPoint = self.gestureStartPoint
        {
            let currentPosition = touch.location(in: self.view)
            
            let deltaX = fabsf(Float(gestureStartPoint.x - currentPosition.x))
            let deltaY = fabsf(Float(gestureStartPoint.y - currentPosition.y))
            
            if(deltaX >= ViewController.minimumGestureLength && deltaY <= ViewController.maximumVariance)
            {
                label.text = "Horizontal swipe detected"
                DispatchQueue.main.after(when: DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC))
                {
                    self.label.text = ""
                }
            }
            else if(deltaY >= ViewController.minimumGestureLength && deltaX <= ViewController.maximumVariance)
            {
                label.text = "Vertical swipe detected"
                DispatchQueue.main.after(when: DispatchTime.now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC))
                {
                    self.label.text = ""
                }
            }
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
