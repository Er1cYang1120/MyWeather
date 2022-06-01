//
//  DetailTableViewCell.m
//  Weather
//
//  Created by mao on 2022/5/24.
//

#import "DetailTableViewCell.h"

@implementation DetailTableViewCell

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
    int x = Width / 4;
    
    // 日期
    self.date = [[UILabel alloc] init];
    self.date.textColor = [UIColor greenColor];
    [self.date setFrame:CGRectMake(0, 30, x, 20)];
    self.date.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.date];
    
    // 天气
    self.weather = [[UILabel alloc] init];
    self.weather.textColor = [UIColor orangeColor];
    [self.weather setFrame:CGRectMake(x, 30, x, 20)];
    self.weather.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.weather];
    
    // 低温
    self.lowTemperature = [[UILabel alloc] init];
    self.lowTemperature.textColor = [UIColor blueColor];
    [self.lowTemperature setFrame:CGRectMake(x * 2, 30, x, 20)];
    self.lowTemperature.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.lowTemperature];
    
    // 高温
    self.highTemperature = [[UILabel alloc] init];
    self.highTemperature.textColor = [UIColor redColor];
    [self.highTemperature setFrame:CGRectMake(x * 3, 30, x, 20)];
    self.highTemperature.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.highTemperature];
}

- (void)setDetail:(DetailTableModel *)detail {
    [self.date setText:detail.date];
    [self.weather setText:detail.weather];
    [self.lowTemperature setText:detail.lowTemperature];
    [self.highTemperature setText:detail.highTemperature];
}

@end
