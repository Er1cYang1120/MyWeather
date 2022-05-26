//
//  WeatherTableViewCell.m
//  Weather
//
//  Created by mao on 2022/5/22.
//

#import "WeatherTableViewCell.h"

@implementation WeatherTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}

#pragma mark 初始化视图
- (void)initSubView {
    // 更新时间
    self.updateTime = [[UILabel alloc] init];
    self.updateTime.textColor = [UIColor redColor];
    [self.updateTime setFrame:CGRectMake(20, 30, 100, 20)];
    [self.contentView addSubview:self.updateTime];
    
    // 城市名称
    self.cityName = [[UILabel alloc] init];
    self.cityName.textColor = [UIColor yellowColor];
    [self.cityName setFrame:CGRectMake(Width / 4 + 20, 30, 100, 20)];
    [self.contentView addSubview:self.cityName];
    
    // 当前气温
    self.currentTemperature = [[UILabel alloc] init];
    self.currentTemperature.textColor = [UIColor blueColor];
    [self.currentTemperature setFrame:CGRectMake(Width / 2 + 20, 30, 100, 20)];
    [self.contentView addSubview:self.currentTemperature];
    
    // 当前天气icon
    self.weatherIcon = [[UIImageView alloc] init];
    self.weatherIcon.backgroundColor = [UIColor purpleColor];
    [self.weatherIcon setFrame:CGRectMake(Width / 4 * 3 + 20, 20, 40, 40)];
    [self.contentView addSubview:self.weatherIcon];
}

#pragma mark 设置数据
- (void)setWeather:(WeatherModel *)weather {
    [self.updateTime setText:weather.updateTime];
    [self.cityName setText:weather.cityName];
    [self.currentTemperature setText:weather.currentTemperature];
}

@end
