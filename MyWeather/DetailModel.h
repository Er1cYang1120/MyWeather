//
//  DetailModel.h
//  Weather
//
//  Created by mao on 2022/5/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailModel : NSObject

@property(strong, nonatomic)NSString *windDirection;
@property(strong, nonatomic)NSString *windSpeed;
@property(strong, nonatomic)NSString *windScale;
@property(strong, nonatomic)NSString *humidity;
@property(strong, nonatomic)NSString *visibility;
@property(strong, nonatomic)NSString *pressure;

- (id)initWithWindDirection:(NSString *)direction WindSpeed:(NSString *)speed WindScale:(NSString *)scale Humidity:(NSString *)humidity Visibility:(NSString *)visibility Pressure:(NSString *)pressure;

@end

NS_ASSUME_NONNULL_END
