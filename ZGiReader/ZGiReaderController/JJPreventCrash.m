//
//  JJPreventCrash.m
//  JINJIANG-iOS
//
//  Created by 杨振国 on 2017/12/8.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import "JJPreventCrash.h"



@implementation JJPreventCrash

+ (NSString *)jjFilterTheAfferentString:(NSString *)str
{
    if ([str isKindOfClass:[NSString class]]) {
        return str;
    }else{
        return [NSString string];
    }
}


+ (NSString *)jjRetuenStringDictionary:(NSDictionary *)dict objectForKey:(NSString *)key
{
    if ([dict isKindOfClass:[NSDictionary class]])
    {
        for (NSString * str in [dict allKeys])
        {
            if ([str isEqualToString:key])
            {
                NSString * str = [dict objectForKey:key];
                return jjString(str);
            }
            
        }
    
            return [NSString string];
        
    }else{
        return [NSString string];
    }
    
}

/**
 过滤字符串

 @param value 需要过滤的字符串
 @param str 如果value不是string设置的默认str，此str最好不要为nil
 @return 如果是string就返回原来的value，不是就返回str
 */
+ (NSString *)jjValueIsNil:(NSString *)value BecomeString:(NSString *)str
{
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    }else{
        NSLog(@"传入的数据异常");
        return str;
    }
}
+ (NSArray *)jjArray:(NSArray *)array index:(NSInteger)index key:(NSString *)key
{
    if (([array isKindOfClass:[NSArray class]]) && array.count > index && index > -1 && ([key isKindOfClass:[NSString class]]))
    {
        if ([[array objectAtIndex:index] isKindOfClass:[NSDictionary class]]) {
            return [[array objectAtIndex:index] objectForKey:key];
        }else{
            NSLog(@"数组越界");
            return [NSArray array];
        }
        
    }else{
        NSLog(@"数组越界");
        return [NSArray array];
    }
}
+ (id)jjObjectWithArray:(NSArray*)array AndAtIndex:(NSInteger)index
{
    if (array.count > index && index > -1 && [array isKindOfClass:[NSArray class]]) {
        id object = [array objectAtIndex:index];
        return object;
    }
    NSLog(@"数组越界");
    return nil;
}
+ (NSDictionary *)jjDictionaryWithArray:(NSArray*)array AndAtIndex:(NSInteger)index
{
    if (array.count > index && index > -1 && [array isKindOfClass:[NSArray class]]) {
        id object = [array objectAtIndex:index];
        return object;
    }
    NSLog(@"数组越界");
    return [NSDictionary dictionary];
}


/**
 根据数组下标取出字典，根据字典的key取出value

 @param array 最外层数组
 @param index 数组下标
 @param key 该下标下的字典的key
 @return 返回字典中key对应的value
 */
+ (NSString *)jjDictionaryValue:(NSArray *)array index:(NSInteger)index key:(NSString *)key
{
    if (array) {
        if (array.count > index && index > -1) {
            id tempid = [array objectAtIndex:index];
            if ([tempid isKindOfClass:[NSDictionary class]]) {
                NSDictionary *tempDic = (NSDictionary *)tempid;
                if (key) {
                    if ([tempDic objectForKey:key] && [[tempDic objectForKey:key] isKindOfClass:[NSString class]]) {
                        NSString *string = (NSString *)[tempDic objectForKey:key];
                        return string;
                    }else if ([tempDic objectForKey:key] && [[tempDic objectForKey:key] isKindOfClass:[NSNumber class]]){
                        NSNumber *value = [tempDic objectForKey:key];
                        return  [NSString stringWithFormat:@"%td", [value integerValue]];
                        
                    }
                }
            }
        }
    }
    return [NSString string];
}

+ (NSArray *)jjDictionary:(NSDictionary *)dict objectForKey:(NSString *)key
{
    if([[dict objectForKey:key] isKindOfClass:[NSNull class]] || (![dict isKindOfClass:[NSDictionary class]])){
        return [NSArray array];
    }else{
        return [dict objectForKey:key];
    }
}
+ (NSDictionary *)jjReturnDictionaryInDictionary:(NSDictionary *)dict key:(NSString *)key
{
    if ([dict isKindOfClass:[NSDictionary class]] && [key isKindOfClass:[NSString class]]) {
        if ([[dict objectForKey:key] isKindOfClass:[NSDictionary class]]) {
            return [dict objectForKey:key];
        }else{
            return [NSDictionary dictionary];
        }
    }else{
        return [NSDictionary dictionary];
    }
    
    
}

+ (NSString *)jjParseString:(NSDictionary *)dictionary key:(NSString *)key
{
    if (!dictionary || !key) {
        return @"";
    }
    id temp = [dictionary objectForKey:key];
    if (temp && [temp isKindOfClass:[NSString class]]) {
        NSString *backString = (NSString *)temp;
        return backString;
    }else if (temp && [temp isKindOfClass:[NSNumber class]]) {
        NSNumber *backString = (NSNumber *)temp;
        
        double maxQuota = [backString doubleValue];
        return [NSString stringWithFormat:@"%.2f", maxQuota];
    }else{
        return @"";
    }
}
+ (NSMutableArray *)jjAddObjectWithArrayM:(NSMutableArray *)arrM addObject:(NSObject *)obj
{
    if ([arrM isKindOfClass:[NSMutableArray class]] && [obj isKindOfClass:[NSObject class]]) {
        [arrM addObject:obj];
        return arrM;
    }else{
        return arrM;
    }
}

+ (NSString *)jjReturnSubStringWithString:(NSString *)string substringWithRange:(NSRange)range
{
    if ([string isKindOfClass:[NSString class]] && (range.location + range.length) <= string.length && range.location < string.length && range.length > 0) {
        return [string substringWithRange:range];
    }else{
        NSLog(@"--------字符串截取时出错--------");
        
        return [NSString string];
    }
}
@end
