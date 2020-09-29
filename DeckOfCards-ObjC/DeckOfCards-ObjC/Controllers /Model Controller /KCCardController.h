//
//  KCCardController.h
//  DeckOfCards-ObjC
//
//  Created by Kaleb  Carrizoza on 9/29/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class KCCard;

NS_ASSUME_NONNULL_BEGIN

@interface KCCardController : NSObject

+ (void)drawNewCard:(NSNumber *)numberOfCards completion:(void(^) (NSArray<KCCard *> *cards, NSError *error))completion;

+ (void) fetchCardImage: (KCCard *)card completion:(void(^) (UIImage *))completion;



@end

NS_ASSUME_NONNULL_END
