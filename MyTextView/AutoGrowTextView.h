//
//  AutoGrowTextView.h
//  MyTextView
//
//  Created by user on 15/11/16.
//  Copyright © 2015年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AutoGrowTextView : UIView<UITextViewDelegate>

@property (nonatomic, assign) NSInteger maxLines;
@property (nonatomic, assign) NSInteger minLines;

- (void)hideKeyboard;

@end
