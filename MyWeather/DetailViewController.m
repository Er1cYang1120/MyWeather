//
//  DetailViewController.m
//  Weather
//
//  Created by mao on 2022/5/23.
//

#import "DetailViewController.h"

@interface DetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"天气详情";
    int x = Width / 4;
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 150, 100, 20)];
    self.windDirection = [[UILabel alloc] initWithFrame:CGRectMake(x + 10, 150, 100, 20)];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(x * 2 + 10, 150, 100, 20)];
    self.windSpeed = [[UILabel alloc] initWithFrame:CGRectMake(x * 3 + 10, 150, 100, 20)];
    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 190, 100, 20)];
    self.windScale = [[UILabel alloc] initWithFrame:CGRectMake(x + 10, 190, 100, 20)];
    UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(x * 2 + 10, 190, 100, 20)];
    self.humidity = [[UILabel alloc] initWithFrame:CGRectMake(x * 3 + 10, 190, 100, 20)];
    UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(10, 230, 100, 20)];
    self.visibility = [[UILabel alloc] initWithFrame:CGRectMake(x + 10, 230, 100, 20)];
    UILabel *label6 = [[UILabel alloc] initWithFrame:CGRectMake(x * 2 + 10, 230, 100, 20)];
    self.pressure = [[UILabel alloc] initWithFrame:CGRectMake(x * 3 + 10, 230, 100, 20)];
    UILabel *label7 = [[UILabel alloc] initWithFrame:CGRectMake(10, 110, 110, 20)];
    
    [label1 setText:@"风向"];
    [label2 setText:@"风速"];
    [label3 setText:@"风力大小"];
    [label4 setText:@"空气湿度"];
    [label5 setText:@"能见度"];
    [label6 setText:@"气压"];
    [label7 setText:@"今天天气详情"];
    [label7 setBackgroundColor:[UIColor redColor]];
    [self.windDirection setText:self.detail.windDirection];
    [self.windSpeed setText:self.detail.windSpeed];
    [self.windScale setText:self.detail.windScale];
    [self.humidity setText:self.detail.humidity];
    [self.visibility setText:self.detail.visibility];
    [self.pressure setText:self.detail.pressure];

    
    [self.view addSubview:label1];
    [self.view addSubview:label2];
    [self.view addSubview:label3];
    [self.view addSubview:label4];
    [self.view addSubview:label5];
    [self.view addSubview:label6];
    [self.view addSubview:label7];
    [self.view addSubview:self.windDirection];
    [self.view addSubview:self.windSpeed];
    [self.view addSubview:self.windScale];
    [self.view addSubview:self.humidity];
    [self.view addSubview:self.pressure];
    [self.view addSubview:self.visibility];
    
    UILabel *label8 = [[UILabel alloc] initWithFrame:CGRectMake(10, 300, 110, 20)];
    UILabel *label9 = [[UILabel alloc] initWithFrame:CGRectMake(0, 340, x, 20)];
    UILabel *label10 = [[UILabel alloc] initWithFrame:CGRectMake(x, 340, x, 20)];
    UILabel *label11= [[UILabel alloc] initWithFrame:CGRectMake(x * 2, 340, x, 20)];
    UILabel *label12 = [[UILabel alloc] initWithFrame:CGRectMake(x * 3, 340, x, 20)];
    
    [label8 setText:@"未来三天天气"];
    [label8 setBackgroundColor:[UIColor redColor]];
    [label9 setText:@"日期"];
    [label10 setText:@"天气"];
    [label11 setText:@"高温"];
    [label12 setText:@"低温"];
    
    label9.textAlignment = NSTextAlignmentCenter;
    label10.textAlignment = NSTextAlignmentCenter;
    label11.textAlignment = NSTextAlignmentCenter;
    label12.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:label8];
    [self.view addSubview:label9];
    [self.view addSubview:label10];
    [self.view addSubview:label11];
    [self.view addSubview:label12];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 370, Width, 250) style:UITableViewStylePlain];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  [self.detailList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[DetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:@"Cell"];
    }
    
    DetailTableModel *detail = self.detailList[indexPath.row];
    [cell setDetail:detail];
    
    return cell;
}

@end
