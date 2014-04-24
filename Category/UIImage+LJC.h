//
//  UIImage+LJC.h
//  
//
//  Created by  on 12-1-13.
//  Copyright (c) 2012年 LJC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>

@interface UIImage (LJC)

- (UIImage*) duplicate;
- (UIImage*) stretched;
- (UIImage*) antiAlias;

+ (UIImage*) imageWithColor:(UIColor*)color;
+ (UIImage*) imageWithColor:(UIColor*)color Size:(CGSize)size;

- (UIImage*) imageWithWidth:(float)width;
- (UIImage*) imageWithHeight:(float)height;
- (UIImage*) imageWithSize:(CGSize)size;
- (UIImage*) imageWithShortLength:(float)length;

// Resizes the image according to the given content mode, taking into account the image's orientation
-(UIImage*) scaleAndCropToSize:(CGSize)newSize;
-(UIImage*) avatarWithSize:(CGSize)size;

- (UIImage *)fixOrientation;

+ (UIImage *)imageName:(NSString*)name;
- (UIImage *)decodedImage;

@end
