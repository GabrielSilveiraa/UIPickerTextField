//
//  UIComboBoxTextFIeld.m
//
//  Created by Gabriel Miranda Silveira on 04/07/18.
//  Copyright © 2018 GabrielSilveira. All rights reserved.
//

#import "UIPickerTextField.h"

@implementation UIPickerTextField

UIPickerView *comboBoxPickerView;

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setRightImageView];
        [self configurePickerView];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setRightImageView];
        [self configurePickerView];
    }
    
    return self;
}

-(void)configurePickerView {
    comboBoxPickerView = [[UIPickerView alloc] init];
    self.inputView = comboBoxPickerView;
    comboBoxPickerView.dataSource = self;
    comboBoxPickerView.delegate = self;
}

- (void)setRightImageView {
    float width =  14;
    float height =  24;
    
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    [rightView setClipsToBounds:YES];
    
    [rightView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didPressComboBox)]];
    
    UIImageView *rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
    UIImage *image = [UIImage imageNamed:@"arrow-down"];
    rightImageView.image = image;
    rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [rightView addSubview:rightImageView];
    
    self.rightView = rightView;
    self.rightViewMode = UITextFieldViewModeAlways;
}

- (void)didPressComboBox {
    [self becomeFirstResponder];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _data.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *title = [_data objectAtIndex:row];
    return title;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSString *title = [_data objectAtIndex:row];
    self.text = title;
    [_pickerDelegate didSelectRow:row withTitle:title];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

@end
