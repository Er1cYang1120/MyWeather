//
//  WeatherTableViewCell.h
//  Weather
//
//  Created by mao on 2022/5/22.
//

#import <UIKit/UIKit.h>
#import "WeatherModel.h"

#define Width [UIScreen mainScreen].bounds.size.width

NS_ASSUME_NONNULL_BEGIN

@interface WeatherTableViewCell : UITableViewCell

@property(strong, nonatomic)UILabel *updateTime;
@property(strong, nonatomic)UILabel *cityName;
@property(strong, nonatomic)UILabel *currentTemperature;
@property(strong, nonatomic)UIImageView *weatherIcon;

- (void)setWeather:(WeatherModel *)weather;

@end

NS_ASSUME_NONNULL_END
