//
//  ImageViewController.swift
//  UIWebViewWithNSConnection
//
//  Created by vichhai on 6/15/15.
//  Copyright (c) 2015 kan vichhai. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    override func viewDidLoad() {
        /*
            UIImageView* animatedImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
            animatedImageView.animationImages = [NSArray arrayWithObjects:
                [UIImage imageNamed:@"image1.gif"],
                [UIImage imageNamed:@"image2.gif"],
            [UIImage imageNamed:@"image3.gif"],
            [UIImage imageNamed:@"image4.gif"], nil];
            animatedImageView.animationDuration = 1.0f;
            animatedImageView.animationRepeatCount = 0;
            [animatedImageView startAnimating];
            [self.view addSubview: animatedImageView];
        */
        
        
        let animatedImageView = UIImageView(frame: self.view.bounds)
        var arrImg = NSMutableArray()
        arrImg.addObject(UIImage(named: "01.tiff")!)
        arrImg.addObject(UIImage(named: "02.tiff")!)
        arrImg.addObject(UIImage(named: "03.tiff")!)
        arrImg.addObject(UIImage(named: "04.tiff")!)
        arrImg.addObject(UIImage(named: "05.tiff")!)
        arrImg.addObject(UIImage(named: "06.tiff")!)

        animatedImageView.animationImages = arrImg as [AnyObject]
        animatedImageView.animationDuration = 0.5
        animatedImageView.animationRepeatCount = 0
        
        animatedImageView.startAnimating()
        view.addSubview(animatedImageView)
        
    }
    
}
