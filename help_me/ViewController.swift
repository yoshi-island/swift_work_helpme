//
//  ViewController.swift
//  help_me
//
//  Copyright © 2017 yoshiisland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // set variables
    var stopped_img:UIImage = UIImage(named:"stopped")!
    var started_img:UIImage = UIImage(named:"started")!

    // get screen size
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    
    // create button
    let button = UIButton()
    
    var count = 0

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // background
        self.view.backgroundColor = UIColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        
        // get screen size
        screenWidth = view.frame.size.width
        screenHeight = view.frame.size.height
        
        // resize image
        stopped_img = imageResize(img: stopped_img)
        started_img = imageResize(img: started_img)
        
        // set image
        button.setImage(stopped_img, for: .normal)
        
        // resize image
        button.frame = CGRect(x:screenWidth/4, y:screenHeight/2-screenWidth/2, width:screenWidth/2, height:screenWidth/2)
        
        // add button
        self.view.addSubview(button)
        
        // set action when button tapped
        button.addTarget(self, action: #selector(ViewController.buttonTapped(sender:)), for: .touchUpInside)
        
    }
    
    
    
    
    // change images by tapping
    func buttonTapped(sender : AnyObject) {
        count += 1
        
        if(count%2 == 0){
            button.setImage(stopped_img, for: UIControlState())
        }
        else if(count%2 == 1){
            button.setImage(started_img, for: UIControlState())
        }else{
            
        }
    }
    
    
    
    
    // resize image
    func imageResize(img:UIImage) -> UIImage{
        
        let rect = CGRect(x:0, y:0, width:screenWidth, height:screenWidth)
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width:screenWidth, height:screenWidth), false, 1.0)
        img.draw(in: rect)
        
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }

    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

