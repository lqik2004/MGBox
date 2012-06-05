//
//  Created by Matt Greenfield on 24/05/12
//  Copyright (c) 2012 Big Paua. All rights reserved
//  http://bigpaua.com/
//

#import "MGStyledBox.h"

#define DEFAULT_WIDTH          318.0
#define DEFAULT_TOP_MARGIN      0.0
#define DEFAULT_LEFT_MARGIN      1.0
#define CORNER_RADIUS            4.0

@implementation MGStyledBox{
    //capture background color
    //highlight method may change background
    //restore when highlight cancled
    UIColor* backGroundColor;
    
}
@synthesize enableViewHighlight=_enableViewHighlight;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.enableViewHighlight=YES;
        self.autoresizesSubviews = YES;
        self.topMargin = DEFAULT_TOP_MARGIN;
        self.bottomMargin = 0.5;
        
    }
    return self;
}

+ (id)box {
    CGRect frame = CGRectMake(DEFAULT_LEFT_MARGIN, 0, DEFAULT_WIDTH, 0);
    MGStyledBox *box = [[self alloc] initWithFrame:frame];
    return box;
}

+ (id)boxWithWidth:(CGFloat)width {
    CGRect frame = CGRectMake(DEFAULT_LEFT_MARGIN, 0, width, 0);
    MGStyledBox *box = [[self alloc] initWithFrame:frame];
    return box;
}

- (void)addLayers {
    [super addLayers];
    self.backgroundColor =
            [UIColor colorWithRed:0.94 green:0.94 blue:0.95 alpha:1];
    self.layer.cornerRadius = CORNER_RADIUS;
    self.layer.shadowColor = [UIColor colorWithWhite:0.12 alpha:1].CGColor;
    self.layer.shadowOffset = CGSizeMake(0, 0.5);
    self.layer.shadowRadius = 0.7;
    self.layer.shadowOpacity = 1;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}

- (void)draw {
    [super draw];

    // make shadow faster
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
            cornerRadius:self.layer.cornerRadius].CGPath;
}
-(void) enableSelectWithTarget:(id)target action:(SEL) action{
    UITapGestureRecognizer *gestureRecongnizer=[[UITapGestureRecognizer alloc] init];
    [gestureRecongnizer addTarget:target action:action];
    [self addGestureRecognizer:gestureRecongnizer];
}

#pragma mark -
#pragma mark Override UIView Methods

/*!
 * Highlight Box when taped
 */
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (_enableViewHighlight) {
    backGroundColor=self.backgroundColor;
    [self setBackgroundColor:[UIColor colorWithPatternImage:
                              [UIImage imageNamed:@"HighlightBackground.PNG"]]];  
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.2 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self setBackgroundColor:backGroundColor];
    });
    }
}
@end
