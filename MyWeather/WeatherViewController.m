//
//  WeatherViewController.m
//  Weather
//
//  Created by mao on 2022/5/22.
//

#import "WeatherViewController.h"
#import "AFNetworking.h"
#import "MJRefresh.h"

@interface WeatherViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation WeatherViewController

BOOL isDataLoaded = NO;
NSDictionary *dict;
int dataLoadedNum = 0;

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
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 140, Width, 400) style:UITableViewStylePlain];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.view addSubview:self.tableView];
    
    // tableView中的初始兜底数据写死
    NSArray *dataArray = @[@[@"17:31", @"wuhan", @"27degC"],
                       @[@"17:33", @"nanjing", @"29degC"],
                       @[@"17:35", @"shanghai", @"25degC"],
                       @[@"17:37", @"huzhou", @"23degC"],
                       @[@"17:39", @"guangzhou", @"21degC"]];
    
    self.tableList = [[NSMutableArray alloc] init];
    for (int i = 0; i < dataArray.count; i++) {
        WeatherModel *weatherModel = [[WeatherModel alloc] initWithTime:dataArray[i][0] City:dataArray[i][1] Temperature:dataArray[i][2] Weather:@"大雨"];

        [self.tableList addObject:weatherModel];
    }

    NSArray *detailArray = @[@[@"东", @"10", @"2", @"11", @"11", @"11"],
                         @[@"南", @"9", @"3", @"11", @"11", @"11"],
                         @[@"西", @"8", @"4", @"11", @"11", @"11"],
                         @[@"北", @"7", @"5", @"11", @"11", @"11"],
                         @[@"西", @"9", @"5", @"11", @"11", @"11"]];
    
    self.detailList = [[NSMutableArray alloc] init];
    for (int i = 0; i < detailArray.count; i++) {
        DetailModel *detailModel = [[DetailModel alloc] initWithWindDirection:detailArray[i][0] Quality:detailArray[i][1] WindScale:detailArray[i][2] Humidity:detailArray[i][3] Sunrise:detailArray[i][4] Sunset:detailArray[i][5]];

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
    
    // 网络请求&下拉刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNetworkData)];
     
     header.stateLabel.textColor = [UIColor redColor];
     header.stateLabel.font = [UIFont systemFontOfSize:16];
     [header setTitle:@"玩命加载中" forState:MJRefreshStateIdle];
     [header setTitle:@"松开马上刷新" forState:MJRefreshStatePulling];
     [header setTitle:@"正在拼命刷新" forState:MJRefreshStateRefreshing];

    header.lastUpdatedTimeLabel.hidden = YES;
     self.tableView.mj_header = header;
     self.tableView.mj_header.automaticallyChangeAlpha = YES;
     [self.tableView.mj_header beginRefreshing];

}

#pragma mark 网络数据处理
-(void)loadNetworkData {
    // 天气预报API
    NSString *url = @"http://t.weather.itboy.net/api/weather/city/";
    NSArray *cityArray = @[@"101020100", @"101010100", @"101030100", @"101230201", @"101280601"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    for (int i = 0; i < 5; i++) {
        [manager GET:[url stringByAppendingString:cityArray[i]] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //        NSLog(@"%@---%@",[responseObject class],responseObject);
            NSLog(responseObject[@"cityInfo"][@"city"]);
            NSLog([NSString stringWithFormat:@"%d", i]);
            dict = (NSDictionary *)responseObject;
            [self networkDataProcessing:i];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
            NSLog(@"请求失败--%@",error);
        }];
    }
}

-(void)networkDataProcessing:(int)index {
    WeatherModel *weatherModel = [[WeatherModel alloc] initWithTime:dict[@"cityInfo"][@"updateTime"] City:dict[@"cityInfo"][@"city"] Temperature:[dict[@"data"][@"wendu"] stringByAppendingString:@"degC"] Weather:dict[@"data"][@"forecast"][0][@"type"]];
    [self.tableList replaceObjectAtIndex:index withObject:weatherModel];
    [self.tableView reloadData];
    
    DetailModel *detailModel = [[DetailModel alloc] initWithWindDirection:dict[@"data"][@"forecast"][0][@"fx"] Quality:dict[@"data"][@"quality"] WindScale:dict[@"data"][@"forecast"][0][@"fl"] Humidity:dict[@"data"][@"shidu"] Sunrise:dict[@"data"][@"forecast"][0][@"sunrise"] Sunset:dict[@"data"][@"forecast"][0][@"sunset"]];
    [self.detailList replaceObjectAtIndex:index withObject:detailModel];
    
    NSMutableArray *temp1 = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i++) {
        DetailTableModel *detailTableModel = [[DetailTableModel alloc] initWithDate:dict[@"data"][@"forecast"][i][@"ymd"] Weather:dict[@"data"][@"forecast"][i][@"type"]  LowTemperature:dict[@"data"][@"forecast"][i][@"low"] HighTemperature:dict[@"data"][@"forecast"][i][@"high"]];

        [temp1 addObject:detailTableModel];
    }
    [self.detailTableList replaceObjectAtIndex:index withObject:temp1];
    
    dataLoadedNum++;
    if (dataLoadedNum == 5) {
        // 设置数据加载标志位
        isDataLoaded = YES;
        // 结束刷新
        [self.tableView.mj_header endRefreshing];
        // 5次请求都成功后重置标志位
        dataLoadedNum = 0;
    }
}

#pragma mark tableView
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
    if (isDataLoaded) { // 数据加载成功后才可点击跳转到天气详情页
        DetailViewController *detailVC = [[DetailViewController alloc] init];
        detailVC.detail = self.detailList[indexPath.row];
        detailVC.detailList = self.detailTableList[indexPath.row];
        [self.navigationController pushViewController:detailVC animated:NO];
    }
}

@end
