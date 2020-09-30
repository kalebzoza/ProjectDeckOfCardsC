//
//  KCCardController.h
//  DeckOfCards-ObjC
//
//  Created by Kaleb  Carrizoza on 9/29/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "KCCard.h"

NS_ASSUME_NONNULL_BEGIN

@interface KCCardController : NSObject

+ (void)drawANewCard:(NSInteger )numberOfCards completion:(void(^) (NSArray<KCCard *> *_Nullable cards))completion;

+ (void)fetchCardImage: (KCCard *)card completion:(void(^) (UIImage *_Nullable image))completion;



@end

NS_ASSUME_NONNULL_END
