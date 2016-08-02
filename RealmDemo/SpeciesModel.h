//
//  SpeciesModel.h
//  RealmDemo
//
//  Created by SunShine on 16/8/2.
//  Copyright © 2016年 JP. All rights reserved.
//

#import <Realm/Realm.h>

@interface SpeciesModel : RLMObject

@property NSInteger ID;    // ID
@property NSString* name;   // 姓名
@property NSInteger age;    // 年龄
@property NSString* sex;    // 性别
@property NSString* ignore; // 我不想存的属性

- (void)addData;
- (void)deleteData;
- (void)modifyData;
- (void)selectData;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<SpeciesModel>
RLM_ARRAY_TYPE(SpeciesModel)
