//
//  QuizViewController.swift
//  SpyLanguageTraining
//
//  Created by yunchiri on 2016. 5. 22..
//  Copyright © 2016년 youngchill. All rights reserved.
//

import UIKit
import Koloda
import pop
import CountdownLabel


private let numberOfCards: UInt = 50
private let frameAnimationSpringBounciness: CGFloat = 9
private let frameAnimationSpringSpeed: CGFloat = 16
private let kolodaCountOfVisibleCards = 2
private let kolodaAlphaValueSemiTransparent: CGFloat = 0.1


class QuizViewController: UIViewController {
    
    
    @IBOutlet weak var kolodaView: KolodaView!
    
//    @IBOutlet weak var countDownLabel: CountdownLabel!
    
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
//        kolodaView.alphaValueSemiTransparent = kolodaAlphaValueSemiTransparent
//        kolodaView.countOfVisibleCards = kolodaCountOfVisibleCards
        
        kolodaView.delegate = self
        kolodaView.dataSource = self
//        kolodaView.animator = BackgroundKolodaAnimator(koloda: kolodaView)
        
        self.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        
        kolodaView.layer.cornerRadius = 20
        kolodaView.layer.shadowColor = UIColor.blackColor().CGColor
        
//        countDownLabel.setCountDownTime(60)
//        countDownLabel.timeFormat = "mm:ss"
////        countDownLabel.animationType = .Pixelate
//        countDownLabel.countdownDelegate = self
//        countDownLabel.start() { [unowned self] in
//            self.countDownLabel.text = "timer finished."
        
//        }
    }
    
    
}


//MARK: KolodaViewDelegate
extension QuizViewController: KolodaViewDelegate {
    
    func kolodaDidRunOutOfCards(koloda: KolodaView) {
        kolodaView.resetCurrentCardIndex()
    }
    
    func koloda(koloda: KolodaView, didSelectCardAtIndex index: UInt) {
//        UIApplication.sharedApplication().openURL(NSURL(string: "http://yalantis.com/")!)
    }
    
    func kolodaShouldApplyAppearAnimation(koloda: KolodaView) -> Bool {
        return true
    }
    
    func kolodaShouldMoveBackgroundCard(koloda: KolodaView) -> Bool {
        return false
    }
    
    func kolodaShouldTransparentizeNextCard(koloda: KolodaView) -> Bool {
        return true
    }
    
    func koloda(kolodaBackgroundCardAnimation koloda: KolodaView) -> POPPropertyAnimation? {
        let animation = POPSpringAnimation(propertyNamed: kPOPViewFrame)
        animation.springBounciness = frameAnimationSpringBounciness
        animation.springSpeed = frameAnimationSpringSpeed
        return animation
    }
}



//MARK: KolodaViewDataSource
extension QuizViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(koloda: KolodaView) -> UInt {
        return numberOfCards
    }
    
    func koloda(koloda: KolodaView, viewForCardAtIndex index: UInt) -> UIView {
   
        
        let view2 =  NSBundle.mainBundle().loadNibNamed("QuestionView", owner: nil, options: nil)[0] as! UIView
        view2.layer.cornerRadius = 20
        view2.layer.shadowOffset = CGSizeMake(1, 1)
        view2.layer.shadowColor = UIColor.blackColor().CGColor
        view2.layer.borderWidth = 0.3
        view2.layer.borderColor = UIColor.blackColor().CGColor
        view2.layer.masksToBounds = true;
        return view2
    }
    
    func koloda(koloda: KolodaView, viewForCardOverlayAtIndex index: UInt) -> OverlayView? {
//        return NSBundle.mainBundle().loadNibNamed("CustomOverlayView",
//                                                  owner: self, options: nil)[0] as? OverlayView
        
        return nil
    }
}



extension QuizViewController: CountdownLabelDelegate {
    func countdownFinished() {
        debugPrint("countdownFinished at delegate.")
    }
    
    func countingAt(timeCounted timeCounted: NSTimeInterval, timeRemaining: NSTimeInterval) {
        debugPrint("time counted at delegate=\(timeCounted)")
        debugPrint("time remaining at delegate=\(timeRemaining)")
    }
    
}