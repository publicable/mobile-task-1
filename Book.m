//
//  Book.m
//  Task1
//
//  Created by Rostislav Raykov on 11/5/13.
//  Copyright (c) 2013 publicable. All rights reserved.
//

#import "Book.h"

@implementation Book

@synthesize author = _author, title = _title, isbn = _isbn, course = _course, price = _price;

- (id) initWithAuthor:(NSString *)author :(NSString *)title :(NSString *)isbn :(NSString *)course :(NSInteger *)price
{
    self = [super init];
    if (self)
    {
        return nil;
    }
    
    [self setAuthor:author];
    [self setTitle:title];
    [self setIsbn:isbn];
    [self setCourse:course];
    [self setPrice:price];
    
    return self;
}

@end
