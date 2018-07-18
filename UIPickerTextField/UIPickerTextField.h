//
//  UIComboBoxTextFIeld.h
//
//  Created by Gabriel Miranda Silveira on 04/07/18.
//  Copyright © 2018 GabrielSilveira. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UIPickerTextFieldDelegate

- (void)didSelectRow:(NSInteger)row withTitle:(NSString *)title;

@end

@interface UIPickerTextField : UITextField <UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) id<UIPickerTextFieldDelegate> pickerDelegate;
@property NSArray<NSString *> *data;
@property UIPickerView *pickerView;

@end

