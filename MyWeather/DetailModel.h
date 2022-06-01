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
@property(strong, nonatomic)NSString *quality;
@property(strong, nonatomic)NSString *windScale;
@property(strong, nonatomic)NSString *humidity;
@property(strong, nonatomic)NSString *sunrise;
@property(strong, nonatomic)NSString *sunset;

- (id)initWithWindDirection:(NSString *)direction Quality:(NSString *)quality WindScale:(NSString *)scale Humidity:(NSString *)humidity Sunrise:(NSString *)rise Sunset:(NSString *)set;

@end

NS_ASSUME_NONNULL_END
