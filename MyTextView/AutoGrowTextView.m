//
//  AutoGrowTextView.m
//  MyTextView
//
//  Created by user on 15/11/16.
//  Copyright © 2015年 user. All rights reserved.
//

#import "AutoGrowTextView.h"

@interface AutoGrowTextView()

@property (nonatomic, retain) UITextView* textView;

@end

@implementation AutoGrowTextView


- (void)doInit {
	
	CGRect rect = self.frame;
	
	rect.origin = CGPointMake(0, 0);
	
	_textView = [[UITextView alloc] initWithFrame:rect];
	
	_textView.backgroundColor = [UIColor orangeColor];
	
	_minLines = 1;
	
	_maxLines = 3;
	
	_textView.delegate = self;
	
	_textView.font = [UIFont fontWithName:@"Helvetica" size:13];
	
	_textView.enablesReturnKeyAutomatically = YES;
	
	[_textView setEditable:YES];
	
	[self addSubview:_textView];
}

- (id)initWithFrame:(CGRect)frame {
	
	self = [super initWithFrame:frame];
	
	if (self) {
		
		[self doInit];
	}
	
	return self;
}

- (void)awakeFromNib {
	
	[super awakeFromNib];
	
	[self doInit];
}

- (void)textViewDidChange:(UITextView *)textView {
	
	[self refreshHeight];
}

- (void)refreshHeight {
	
	CGFloat width = self.frame.size.width;
	
	CGSize fudgeFactor = CGSizeMake(10.0, 16.0);
	
	NSAttributedString* text = _textView.attributedText;
	
	CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
	
	[self resetTextViewHeight:rect.size.height + fudgeFactor.height];
}

- (void)resetTextViewHeight:(CGFloat)height {
	
	CGRect rect = self.frame;
	
	rect.size.height = height;
	
	self.frame = rect;
	
	rect.origin = CGPointMake(0, 0);
	
	_textView.frame = rect;
}

- (void)hideKeyboard {
	
	[_textView resignFirstResponder];
}

@end
