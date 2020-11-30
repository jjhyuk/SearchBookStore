//
//  UIColor+Hex.m
//  SearchBookStore
//
//  Created by jinhyuk on 2020/11/30.
//

#import "UIColor+Color.h"

@implementation UIColor(Color)

+(UIColor *)colorFromRGB:(NSUInteger)c{
    return [UIColor colorWithRed:((c&0x00FF0000) >> 16)/255.0f
                           green:((c&0x0000FF00) >> 8)/255.0f
                            blue:((c&0x000000FF))/255.0f
                           alpha:1.0f];
}

@end
