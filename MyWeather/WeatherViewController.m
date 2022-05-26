//
//  WeatherViewController.m
//  Weather
//
//  Created by mao on 2022/5/22.
//

#import "WeatherViewController.h"

@interface WeatherViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"城市列表";
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, 100, 20)];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(Width / 4 + 10, 110, 100, 20)];
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(Width / 2 + 10, 110, 100, 20)];
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(Width / 4 * 3 + 10, 110, 100, 20)];
    
    [label1 setText:@"更新时间"];
    [label2 setText:@"城市名称"];
    [label3 setText:@"当前气温"];
    [label4 setText:@"天气情况"];
    
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
    [self.view addSubview:label4];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 140, Width, 300) style:UITableViewStylePlain];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.view addSubview:self.tableView];
    
    NSArray *dataArray = @[@[@"17:31", @"wuhan", @"27degC"],
                       @[@"17:33", @"nanjing", @"29degC"],
                       @[@"17:35", @"shanghai", @"25degC"],
                       @[@"17:37", @"huzhou", @"23degC"],
                       @[@"17:39", @"guangzhou", @"21degC"]];
    
    self.tableList = [[NSMutableArray alloc] init];
    for (int i = 0; i < dataArray.count; i++) {
        WeatherModel *weatherModel = [[WeatherModel alloc] initWithTime:dataArray[i][0] City:dataArray[i][1] Temperature:dataArray[i][2]];
        
        [self.tableList addObject:weatherModel];
    }
    
    NSArray *detailArray = @[@[@"东", @"10", @"2", @"11", @"11", @"11"],
                         @[@"南", @"9", @"3", @"11", @"11", @"11"],
                         @[@"西", @"8", @"4", @"11", @"11", @"11"],
                         @[@"北", @"7", @"5", @"11", @"11", @"11"],
                         @[@"西", @"9", @"5", @"11", @"11", @"11"]];
    
    self.detailList = [[NSMutableArray alloc] init];
    for (int i = 0; i < detailArray.count; i++) {
        DetailModel *detailModel = [[DetailModel alloc] initWithWindDirection:detailArray[i][0] WindSpeed:detailArray[i][1] WindScale:detailArray[i][2] Humidity:detailArray[i][3] Visibility:detailArray[i][4] Pressure:detailArray[i][5]];

        [self.detailList addObject:detailModel];
    }
    
    NSArray *detailTableArray = @[@[@"04-18", @"晴", @"1", @"31"],
                              @[@"11-20", @"小雨", @"13", @"21"],
                              @[@"04-25", @"小雨", @"13", @"21"],
                              @[@"11-20", @"小雨", @"2", @"21"],
                              @[@"04-25", @"小雨", @"13", @"21"],
                              @[@"11-20", @"小雨", @"13", @"21"],
                              @[@"04-25", @"小雨", @"3", @"21"],
                              @[@"11-20", @"小雨", @"13", @"21"],
                              @[@"04-25", @"小雨", @"13", @"21"],
                              @[@"11-20", @"小雨", @"4", @"21"],
                              @[@"04-25", @"小雨", @"13", @"21"],
                              @[@"11-20", @"小雨", @"13", @"21"],
                              @[@"11-20", @"小雨", @"5", @"21"],
                              @[@"04-25", @"小雨", @"13", @"21"],
                              @[@"11-20", @"小雨", @"13", @"21"]];
                          
    
    self.detailTableList = [[NSMutableArray alloc] init];
    for (int j = 0 ; j < detailArray.count; j++) {
        NSMutableArray *temp = [[NSMutableArray alloc] init];
        for (int i = j * 3; i < (j + 1) * 3; i++) {
            DetailTableModel *detailTableModel = [[DetailTableModel alloc] initWithDate:detailTableArray[i][0] Weather:detailTableArray[i][1] LowTemperature:detailTableArray[i][2] HighTemperature:detailTableArray[i][3]];

            [temp addObject:detailTableModel];
        }
        [self.detailTableList addObject:temp];
    }

        
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  [self.tableList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeatherTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[WeatherTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:@"Cell"];
    }
    
    WeatherModel *weather = self.tableList[indexPath.row];
    [cell setWeather:weather];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *detailVC = [[DetailViewController alloc] init];
    detailVC.detail = self.detailList[indexPath.row];
    detailVC.detailList = self.detailTableList[indexPath.row];
    [self.navigationController pushViewController:detailVC animated:NO];
}

@end
