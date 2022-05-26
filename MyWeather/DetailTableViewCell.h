//
//  DetailTableViewCell.h
//  Weather
//
//  Created by mao on 2022/5/24.
//

#import <UIKit/UIKit.h>
#import "DetailTableModel.h"

#define Width [UIScreen mainScreen].bounds.size.width

NS_ASSUME_NONNULL_BEGIN

@interface DetailTableViewCell : UITableViewCell

@property(strong, nonatomic)UILabel *date;
@property(strong, nonatomic)UILabel *weather;
@property(strong, nonatomic)UILabel *lowTemperature;
@property(strong, nonatomic)UILabel *highTemperature;

- (void)setDetail:(DetailTableModel *)detail;

@end

NS_ASSUME_NONNULL_END
