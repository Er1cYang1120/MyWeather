//
//  DetailTableModel.m
//  Weather
//
//  Created by mao on 2022/5/24.
//

#import "DetailTableModel.h"

@implementation DetailTableModel

- (id)initWithDate:(NSString *)date Weather:(NSString *)weather LowTemperature:(NSString *)low HighTemperature:(NSString *)high {
    self = [super init];
    
    if (self) {
        self.date = date;
        self.weather = weather;
        self.lowTemperature = low;
        self.highTemperature = high;
    }
    
    return self;
}

@end
