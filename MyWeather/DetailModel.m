//
//  DetailModel.m
//  Weather
//
//  Created by mao on 2022/5/24.
//

#import "DetailModel.h"

@implementation DetailModel

- (id)initWithWindDirection:(NSString *)direction WindSpeed:(NSString *)speed WindScale:(NSString *)scale Humidity:(NSString *)humidity Visibility:(NSString *)visibility Pressure:(NSString *)pressure {
    self = [super init];
    
    if (self) {
        self.windDirection = direction;
        self.windSpeed = speed;
        self.windScale = scale;
        self.humidity = humidity;
        self.visibility = visibility;
        self.pressure = pressure;
    }
    
    return self;
}

@end
