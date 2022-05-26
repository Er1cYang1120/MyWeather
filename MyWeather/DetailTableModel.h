//
//  DetailTableModel.h
//  Weather
//
//  Created by mao on 2022/5/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailTableModel : NSObject

@property(strong, nonatomic)NSString *date;
@property(strong, nonatomic)NSString *weather;
@property(strong, nonatomic)NSString *lowTemperature;
@property(strong, nonatomic)NSString *highTemperature;

- (id)initWithDate:(NSString *)date Weather:(NSString *)weather LowTemperature:(NSString *)low HighTemperature:(NSString *)high;

@end

NS_ASSUME_NONNULL_END
