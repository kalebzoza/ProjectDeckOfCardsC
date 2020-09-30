//
//  CardViewController.swift
//  DeckOfCards-ObjC
//
//  Created by Kaleb  Carrizoza on 9/29/20.
//

import UIKit

class CardViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var drawCardButton: UIButton!
    
    
    
    //MARK: - Properties
    var cards: [KCCard] = []
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchCard()
        
        
    }
    
    //MARK: - Actions
    @IBAction func drawCardButtonTapped(_ sender: Any) {
        self.fetchCard()
    }
    
    
    //MARK: - Helper functions
    
    func fetchCard() {
        KCCardController.drawANewCard(1) { (cards) in
            
            if let cards = cards {
                KCCardController.fetchCardImage(cards[0]) { (image) in
                    DispatchQueue.main.async {
                        if let cardImage = image {
                            self.updateViews(card: cards[0], image: cardImage)
                        }
                    }
                }
            }
        }
    }
    
    func updateViews(card: KCCard, image: UIImage) {
        self.suitLabel.text = card.suit
        self.cardImageView.image = image
    }

    

}// end of class
