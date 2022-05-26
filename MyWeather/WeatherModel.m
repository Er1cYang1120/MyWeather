//
//  WeatherModel.m
//  Weather
//
//  Created by mao on 2022/5/23.
//

#import "WeatherModel.h"

@implementation WeatherModel

- (id)initWithTime:(NSString *)time City:(NSString *)city Temperature:(NSString *)temperature {
    self = [super init];
    
    if (self) {
        self.cityName = city;
        self.currentTemperature = temperature;
        self.updateTime = time;
    }
    
    return self;
}

@end
