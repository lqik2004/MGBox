//
//  Created by Matt Greenfield on 24/05/12
//  Copyright (c) 2012 Big Paua. All rights reserved
//  http://bigpaua.com/
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "MGBoxProtocol.h"
#import "MGBox.h"

@interface MGStyledBox : MGBox

+ (id)box;
+ (id)boxWithWidth:(CGFloat)width;
-(void) enableSelectWithTarget:(id)target action:(SEL) action;
@property (nonatomic) BOOL enableViewHighlight;
@end
