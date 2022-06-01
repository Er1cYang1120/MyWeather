//
//  WeatherViewController.h
//  Weather
//
//  Created by mao on 2022/5/22.
//

#import <UIKit/UIKit.h>
#import "WeatherTableViewCell.h"
#import "WeatherModel.h"
#import "DetailViewController.h"
#import "DetailModel.h"
#import "DetailTableModel.h"

#define Width [UIScreen mainScreen].bounds.size.width

NS_ASSUME_NONNULL_BEGIN

@interface WeatherViewController : UIViewController

@property(strong, nonatomic)UITableView *tableView;
@property(strong, nonatomic)NSMutableArray *tableList;
@property(strong, nonatomic)NSMutableArray *detailList;
@property(strong, nonatomic)NSMutableArray *detailTableList;
@property(strong, nonatomic)NSMutableDictionary *detailDic;

@end

NS_ASSUME_NONNULL_END
