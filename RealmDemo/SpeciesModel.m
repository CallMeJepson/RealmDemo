//
//  SpeciesModel.m
//  RealmDemo
//
//  Created by SunShine on 16/8/2.
//  Copyright © 2016年 JP. All rights reserved.
//

#import "SpeciesModel.h"

@interface SpeciesModel ()
{
    NSInteger _Count;
}
@end
@implementation SpeciesModel

- (void)addData {
    
    //数据库操作对象
    RLMRealm *realm = [RLMRealm defaultRealm];

    //打开数据库事务
    [realm transactionWithBlock:^{
        SpeciesModel *_temp = [[SpeciesModel alloc] init];
        _temp.ID = _Count++;
        _temp.name = @"JingPeng";
//        _temp.age = 25;
//        _temp.sex = @"man";
        
        // 添加到数据库
        [realm addObject:_temp];
        
        // 提交事务
        [realm commitWriteTransaction];
    }];
    
}

- (void)deleteData {
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm transactionWithBlock:^{
        
//        // 获得对象
//        RLMResults *result = [SpeciesModel allObjects];
//        // 一条条删除
//        [realm deleteObject:result.firstObject];
        
        // 全部清空
        [realm deleteAllObjects];
    }];
}

- (void)modifyData {
    RLMRealm *realm = [RLMRealm defaultRealm];
    
    [realm transactionWithBlock:^{
        RLMResults *result = [SpeciesModel allObjects];
        //获得第一个对象
        SpeciesModel *firstObject = [result objectAtIndex:0];
        
        //修改sex
        firstObject.sex = @"shen";
        
        //提交事务，即被修改
        [realm commitWriteTransaction];
    }];
}

- (void)selectData {
    RLMResults *tempArray = [SpeciesModel allObjects];
    for (SpeciesModel *model in tempArray) {
        NSLog(@"ID : %ld, name : %@, age : %ld , sex : %@",model.ID,model.name,model.age,model.sex);
    }
}

// Specify default values for properties

+ (NSDictionary*)defaultPropertyValues {
    return @{@"age":@"18", @"sex":@"woman"};
}

+ (NSDictionary*)replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}

//+ (NSString*)primaryKey {
//    return @"ID";
//}

// Specify properties to ignore (Realm won't persist these)

+ (NSArray *)ignoredProperties {
    return @[@"ignore"];
}

@end
