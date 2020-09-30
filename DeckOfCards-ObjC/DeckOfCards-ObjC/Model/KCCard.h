//
//  KCCard.h
//  DeckOfCards-ObjC
//
//  Created by Kaleb  Carrizoza on 9/29/20.
//

#import <Foundation/Foundation.h>



@interface KCCard : NSObject

@property (nonatomic,copy, readonly) NSString *suit;
@property (nonatomic,copy) NSString *imageString;

-(instancetype) initWithSuit:(NSString *)suit
                       imageString:(NSString *)imageString;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end


