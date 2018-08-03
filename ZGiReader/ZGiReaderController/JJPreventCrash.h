//
//  JJPreventCrash.h
//  JINJIANG-iOS
//
//  Created by 杨振国 on 2017/12/8.
//  Copyright © 2017年 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>
#define jjString(str) [JJPreventCrash jjFilterTheAfferentString:str]
@interface JJPreventCrash : NSObject

+ (NSString *)jjFilterTheAfferentString:(NSString *)str;

+ (id)jjObjectWithArray:(NSArray*)array AndAtIndex:(NSInteger)index;
+ (NSDictionary *)jjDictionaryWithArray:(NSArray*)array AndAtIndex:(NSInteger)index;
+ (NSString *)jjDictionaryValue:(NSArray *)array index:(NSInteger)index key:(NSString *)key;
+ (NSArray *)jjDictionary:(NSDictionary *)dict objectForKey:(NSString *)key;
+ (NSString *)jjRetuenStringDictionary:(NSDictionary *)dict objectForKey:(NSString *)key;
+ (NSArray *)jjArray:(NSArray *)array index:(NSInteger)index key:(NSString *)key;
/**
 过滤字符串
 
 @param value 需要过滤的字符串
 @param str 如果value不是string设置的默认str，此str最好不要为nil
 @return 如果是string就返回原来的value，不是就返回str
 */
+ (NSString *)jjValueIsNil:(NSString *)value BecomeString:(NSString *)str;

+ (NSDictionary *)jjReturnDictionaryInDictionary:(NSDictionary *)dict key:(NSString *)key;

+ (NSString *)jjParseString:(NSDictionary *)dictionary key:(NSString *)key;
//防止往可变数组中插入非对象类型数据
+ (NSMutableArray *)jjAddObjectWithArrayM:(NSMutableArray *)arrM addObject:(NSObject *)obj;


/**
 从一个字符串中截取对应位置和长度的字符串

 @param string 从该字符串中截取内容
 @param range 要截取的位置和长度
 @return 返回截取成功的字符串
 */
+ (NSString *)jjReturnSubStringWithString:(NSString *)string substringWithRange:(NSRange)range;
@end
