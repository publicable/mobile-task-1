//
//  SimpleBookManager.m
//  Task1
//
//  Created by Rostislav Raykov on 11/6/13.
//  Copyright (c) 2013 publicable. All rights reserved.
//

#import "SimpleBookManager.h"
#import "Book.h"

@interface SimpleBookManager ()
@property NSMutableArray* bookArray;
@end

@implementation SimpleBookManager

@synthesize bookArray;

- (id)init
{
    self = [super init];
    
    if ( ! self)
    {
        return nil;
    }
    
    bookArray = [NSMutableArray array];
    
    int i;
    for (i = 1; i <=5; i++) {
        [self createBook];
    }

    return self;
}

+(NSString*)generateRandomString:(int)num {
    NSMutableString* string = [NSMutableString stringWithCapacity:num];
    for (int i = 0; i < num; i++) {
        [string appendFormat:@"%C", (unichar)('a' + arc4random_uniform(25))];
    }
    return string;
}

- (Book *)createBook
{
    NSUInteger price = arc4random() % 100;
    NSString *author = [SimpleBookManager generateRandomString:6];
    NSString *title = [SimpleBookManager generateRandomString:6];
    NSString *isbn = [SimpleBookManager generateRandomString:6];
    NSString *course = [SimpleBookManager generateRandomString:6];
    
    Book *book = [[Book alloc]
            initWithAuthor:author
            :title
            :isbn
            :course
            :price
        ];
    
    NSLog(@"Book created: %@", title);
    [bookArray addObject: book];
    
    return book;
}

- (void)removeBook:(Book *)b
{
    [bookArray removeObject:b];
}

- (Book *)bookAtIndex:(NSUInteger)index
{
    return [bookArray objectAtIndex:index];
}

- (NSUInteger)minPrice
{
    int i;
    NSUInteger minPrice = MAX_INPUT;
    for (i = 0; i <= [bookArray count]; i++)
    {
        NSUInteger price = [[bookArray objectAtIndex:i] integerForKey:@"price"];
        if (price < minPrice)
        {
            minPrice = price;
        }
    }
    
    return minPrice;
}

- (NSUInteger)maxPrice
{
    int i;
    NSUInteger maxPrice = 0;
    for (i = 0; i <= [bookArray count]; i++)
    {
        NSUInteger price = [[bookArray objectAtIndex:i] integerForKey:@"price"];
        if (price > maxPrice)
        {
            maxPrice = price;
        }
    }
    
    return maxPrice;
}

- (void)moveBookAtIndex:(NSUInteger)from toIndex:(NSUInteger)to
{
    [bookArray exchangeObjectAtIndex:from withObjectAtIndex:to];
}

- (NSArray *)allBooks
{
    return bookArray;
}

- (NSUInteger)totalCost
{
    int i;
    NSUInteger totalPrice = 0;
    for (i = 0; i <= [bookArray count]; i++)
    {
        totalPrice += [[bookArray objectAtIndex:i] integerForKey:@"price"];
    }
    
    return totalPrice;
}

- (CGFloat)meanPrice
{
    int i;
    int totalPrice = 0;
    for (i = 0; i <= [bookArray count]; i++)
    {
        totalPrice += [[bookArray objectAtIndex:i] integerForKey:@"price"];
    }
    
    return totalPrice / [bookArray count];
}

- (NSUInteger)count
{
    return [bookArray count];
}

- (void)saveChanges
{
    
}

@end
