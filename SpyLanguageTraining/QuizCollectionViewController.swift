//
//  QuizCollectionViewController.swift
//  SpyLanguageTraining
//
//  Created by yunchiri on 2016. 5. 25..
//  Copyright © 2016년 youngchill. All rights reserved.
//

import UIKit
import TisprCardStack

class QuizCollectionViewController: TisprCardStackViewController,TisprCardStackViewControllerDelegate {

    private var countOfCards: Int = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set animation speed
        setAnimationSpeed(5)
        
        //set size of cards
        let size = CGSizeMake(view.bounds.width - 40, view.bounds.height/2)
        setCardSize(size)
        
        cardStackDelegate = self
        
        //configuration of stacks
        layout.topStackMaximumSize = 40
        layout.bottomStackMaximumSize = 10
        layout.bottomStackCardHeight = 45
    }
    
    //method to add new card
    @IBAction func addNewCards(sender: AnyObject) {
        countOfCards += 1
        newCardWasAdded()
    }
    
    
    override func numberOfCards() -> Int {
        return countOfCards
    }
    
    override func card(collectionView: UICollectionView, cardForItemAtIndexPath indexPath: NSIndexPath) -> TisprCardStackViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("QuizCellIdentifier", forIndexPath: indexPath) as! QuizCell
        
        
        
//        cell.backgroundColor = colors[indexPath.item % colors.count]
//        cell.text.text = "Card - \(indexPath.item)"
        
        return cell
        
    }
    
    @IBAction func moveUP(sender: AnyObject) {
        //        moveCardUp()
    }
    
    @IBAction func moveCardDown(sender: AnyObject) {
        moveCardDown()
    }
    
    func cardDidChangeState(cardIndex: Int) {
        print("card with index - \(cardIndex) changed position")
    }

}
