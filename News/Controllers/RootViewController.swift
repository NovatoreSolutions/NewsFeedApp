//
//  RootViewController.swift
//  News
//
//  Created by Imran Jameel on 11/23/17.
//  Copyright © 2017 NovatoreSolutions. All rights reserved.
//

import UIKit
import SideMenu

class RootViewController: UIViewController, UIScrollViewDelegate {
    
    
    //Buttons
    @IBOutlet var buttons: [UIButton]!
    
    //views
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var menuScrollView: UIScrollView!
    
    //variables
    var homeVC:UIViewController!
    var literatureVC:UIViewController!
    var believeVC: UIViewController!
    var textVC: UIViewController!
    var videoVC: UIViewController!
    var multimediaVC: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initializing controllers
        initControllers()
        
        //Setting up Menu
        configMenu()
        
        //scroll view
        menuScrollView.delegate = self
        menuScrollView.setContentOffset(CGPoint(x:menuScrollView.contentOffset.x,y: 0), animated: true)
    }
    
    fileprivate func initControllers(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // This is the initial controller
        homeVC = storyboard.instantiateViewController(withIdentifier: "homeVCId")
        homeVC.view.frame = contentView.bounds
        contentView.addSubview(homeVC.view)
        addChildViewController(homeVC)
    }
    
    func configMenu(){
        SideMenuManager.default.menuPresentMode = .menuSlideIn
        SideMenuManager.default.menuWidth = UIScreen.main.bounds.width / 2
        SideMenuManager.default.menuAnimationBackgroundColor = UIColor.clear
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuScrollView.contentOffset.y = 0.0
    }
        @IBAction func didPressTab(_ sender: UIButton) {
            
            textVC = storyboard?.instantiateViewController(withIdentifier: "textVCId")
            videoVC = storyboard?.instantiateViewController(withIdentifier: "videoVCId")
            believeVC  = storyboard?.instantiateViewController(withIdentifier: "believeVCId")
            literatureVC = storyboard?.instantiateViewController(withIdentifier: "literatureVCId")
            multimediaVC = storyboard?.instantiateViewController(withIdentifier: "multimediaVCId")
        }
        
    
        
        @IBAction func didPressTab(_ sender: UIButton) {
            
            switch sender.tag{
            case 0:
                buttons[4].isSelected = false
                homeVC.view.frame = contentView.bounds
                contentView.addSubview(homeVC.view)
                addChildViewController(homeVC)
            case 1:
                literatureVC.view.frame = contentView.bounds
                contentView.addSubview(literatureVC.view)
                addChildViewController(literatureVC)
            case 2:
                
                believeVC.view.frame = contentView.bounds
                contentView.addSubview(believeVC.view)
                addChildViewController(believeVC)
            case 3:
                textVC.view.frame = contentView.bounds
                contentView.addSubview(textVC.view)
                addChildViewController(textVC)
            case 4:
                videoVC.view.frame = contentView.bounds
                contentView.addSubview(videoVC.view)
                addChildViewController(videoVC)
            case 5:
                multimediaVC.view.frame = contentView.bounds
                contentView.contentMode = .scaleAspectFit
                contentView.addSubview(multimediaVC.view)
                addChildViewController(multimediaVC)
            default:
                break
            }
    }
    
}

        
        
        

    
}



