//
//  DetailViewController.h
//  Weather
//
//  Created by mao on 2022/5/23.
//

#import <UIKit/UIKit.h>
#import "DetailModel.h"
#import "DetailTableModel.h"
#import "DetailTableViewCell.h"

#define Width [UIScreen mainScreen].bounds.size.width

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController

@property(strong, nonatomic)UILabel *windDirection;
@property(strong, nonatomic)UILabel *windSpeed;
@property(strong, nonatomic)UILabel *windScale;
@property(strong, nonatomic)UILabel *humidity;
@property(strong, nonatomic)UILabel *visibility;
@property(strong, nonatomic)UILabel *pressure;
@property(strong, nonatomic)UITableView *tableView;

@property(strong, nonatomic)NSMutableArray *detailList;
@property(strong, nonatomic)DetailModel *detail;

@end

NS_ASSUME_NONNULL_END
