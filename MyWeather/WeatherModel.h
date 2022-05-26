//
//  WeatherModel.h
//  Weather
//
//  Created by mao on 2022/5/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeatherModel : NSObject

@property(strong, nonatomic)NSString *updateTime;
@property(strong, nonatomic)NSString *cityName;
@property(strong, nonatomic)NSString *currentTemperature;
// pic ???

- (id)initWithTime:(NSString *)time City:(NSString *)city Temperature:(NSString *)temperature;

@end

NS_ASSUME_NONNULL_END
