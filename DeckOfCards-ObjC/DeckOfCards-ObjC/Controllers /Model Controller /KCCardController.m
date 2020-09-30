//
//  KCCardController.m
//  DeckOfCards-ObjC
//
//  Created by Kaleb  Carrizoza on 9/29/20.
//

#import "KCCardController.h"
#import "KCCard.h"

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new";
static NSString * const drawComponent = @"draw";
static NSString * const countQueryName = @"count";
static NSString * const CardsArray = @"cards";


@implementation KCCardController

+ (void)drawANewCard:(NSInteger)numberOfCards completion:(void (^)(NSArray<KCCard *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *drawURL = [baseURL URLByAppendingPathComponent:drawComponent];
    NSString *cardCount = [@(numberOfCards) stringValue];
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:drawURL resolvingAgainstBaseURL:true];
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:countQueryName value:cardCount];
    
    urlComponents.queryItems = @[queryItem];
    
    NSURL *searchURL = urlComponents.URL;
    NSLog(@"%@", searchURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
                if (error)
                {
                    NSLog(@"There was an error: %@, %@", error, error.localizedDescription);
                    completion(nil);
                    return;
                }
                
                if (!data)
                {
                    NSLog(@"There appears to be no data.");
                    completion(nil);
                    return;
                }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error: &error];
        
        if (!topLevelDictionary)
        {
            NSLog(@"Error parsing the JSON: %@", error);
            completion(nil);
            return;
        }
        
        NSArray *cardsArray = topLevelDictionary[CardsArray];
        
        NSMutableArray *cardsPlaceholder = [NSMutableArray array];
        
        for (NSDictionary *cardDictionary in cardsArray)
        {
            KCCard *card = [[KCCard alloc] initWithDictionary:cardDictionary];
            [cardsPlaceholder addObject:card];
        }
        
        completion(cardsPlaceholder);
                
    }] resume];
}

+ (void)fetchCardImage:(KCCard *)card completion:(void (^)(UIImage * _Nullable))completion
{
    NSURL *imageURL = [NSURL URLWithString:card.imageString];
    NSLog(@"%@", imageURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
                if (error)
                {
                    NSLog(@"There was an error fetching the image: %@, %@", error, error.localizedDescription);
                    completion(nil);
                    return;
                }
                
                if (!data)
                {
                    NSLog(@"There was no data found for our image");
                    completion(nil);
                    return;
                }
        UIImage *cardImage = [UIImage imageWithData:data];
        completion(cardImage);

    }] resume];
}

@end

