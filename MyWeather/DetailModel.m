//
//  DetailModel.m
//  Weather
//
//  Created by mao on 2022/5/24.
//

#import "DetailModel.h"

@implementation DetailModel

- (id)initWithWindDirection:(NSString *)direction Quality:(NSString *)quality WindScale:(NSString *)scale Humidity:(NSString *)humidity Sunrise:(NSString *)rise Sunset:(NSString *)set {
    self = [super init];
    
    if (self) {
        self.windDirection = direction;
        self.quality = quality;
        self.windScale = scale;
        self.humidity = humidity;
        self.sunrise = rise;
        self.sunset = set;
    }
    
    return self;
}

@end
