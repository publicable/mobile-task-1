//
//  BookManagerProtocol.h
//  Task1
//
//  Created by Rostislav Raykov on 11/5/13.
//  Copyright (c) 2013 publicable. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Book;
@protocol BookManager <NSObject>
- (NSUInteger)count;
- (Book *)bookAtIndex:(NSUInteger)index;
- (Book *)createBook;
- (NSArray *)allBooks;
- (void)removeBook:(Book *)b;
- (void)moveBookAtIndex:(NSUInteger)from toIndex:(NSUInteger)to;
- (NSUInteger)minPrice; - (NSUInteger)maxPrice; - (CGFloat)meanPrice;
- (NSUInteger)totalCost; - (void)saveChanges;
@end
