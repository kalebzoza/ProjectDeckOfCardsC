//
//  KCCardController.m
//  DeckOfCards-ObjC
//
//  Created by Kaleb  Carrizoza on 9/29/20.
//

#import "KCCardController.h"
#import "KCCard.h"

@implementation KCCardController

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new/";
static NSString * const drawComponent = @"draw/";
static NSString * const countQueryName = @"count";
static NSString * const cardsArray = @"cards";

+ (void)drawNewCard:(NSNumber *)numberOfCards completion:(void (^)(NSArray<KCCard *> * _Nonnull, NSError * _Nonnull))completion
{
    NSURL *baseURL = [NSURL URLWithString: baseURLString];
    NSURL *drawURL = [baseURL URLByAppendingPathComponent:drawComponent];
    NSString *cardCount = [numberOfCards stringValue];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:drawURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:countQueryName value:cardCount];
     urlComponents.queryItems = @[queryItem];
    NSURL *searchURL = urlComponents.URL;
    
    [[NSURLSession.sharedSession dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
        
        
        
    }] resume];
}


@end
