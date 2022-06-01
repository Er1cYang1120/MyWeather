//
//  WeatherModel.m
//  Weather
//
//  Created by mao on 2022/5/23.
//

#import "WeatherModel.h"

@implementation WeatherModel

- (id)initWithTime:(NSString *)time City:(NSString *)city Temperature:(NSString *)temperature Weather:(NSString *)info {
    self = [super init];
    
    if (self) {
        self.cityName = city;
        self.currentTemperature = temperature;
        self.updateTime = time;
        self.weatherInfo = info;
    }
    
    return self;
}

@end
