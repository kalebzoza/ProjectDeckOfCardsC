//
//  KCCard.m
//  DeckOfCards-ObjC
//
//  Created by Kaleb  Carrizoza on 9/29/20.
//

#import "KCCard.h"

@implementation KCCard



- (instancetype)initWithSuit:(NSString *)suit imageString:(NSString *)imageString
{
    if (self = [super init]){
        
        _suit = suit;
        _imageString = imageString;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSString *suit = dictionary[@"suit"];
    NSString *imageString = dictionary[@"image"];
    
    return [self initWithSuit:suit imageString:imageString];
}


@end
