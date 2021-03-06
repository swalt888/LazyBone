//
//  AIMessageWrapper.m
//  AITrans
//
//  Created by 王坜 on 15/8/7.
//  Copyright (c) 2015年 __ASIAINFO__. All rights reserved.
//

#import "AIMessageWrapper.h"
#import "AIMessage.h"
#import "AIServerConfig.h"

@implementation AIMessageWrapper


#pragma mark - 获取服务列表

+ (AIMessage *)getServiceListWithServiceID:(NSString *)serviceID
{
    AIMessage *message = [AIMessage message];
    [message.body setObject:serviceID forKey:kKey_ServiceID];
    message.url = kURL_GetServiceList;
    
    return message;
}


+ (AIMessage *)getServiceSchemeWithServiceID:(NSString *)SchemeID
{
    AIMessage *message = [AIMessage message];
    
    NSDictionary *body = @{@"data":@{@"sheme_id":@(401)},@"desc":@{@"data_mode":@"0",@"digest":@""}};
    
    [message.body addEntriesFromDictionary:body];

    
    return message;
    
}

+ (AIMessage *)addWishNoteWithWishID:(NSInteger)wishID type:(NSString *)type content:(NSString *)content  duration:(NSInteger)duration
{
    AIMessage *message = [AIMessage message];
    NSDictionary *body = @{@"data":@{@"wish_id":@(wishID),@"note_type":type,@"note_content":content,@"duration":@(duration)},@"desc":@{@"data_mode":@"0",@"digest":@""}};
    
    [message.body addEntriesFromDictionary:body];
    
    return message;
}

+ (AIMessage *)deleteWishNoteWithWishID:(NSInteger)wishID noteID:(NSInteger)noteID
{
    AIMessage *message = [AIMessage message];
    
    NSDictionary *body = @{@"data":@{@"wish_id":@(wishID),@"note_id":@(noteID)},@"desc":@{@"data_mode":@"0",@"digest":@""}};
    
    [message.body addEntriesFromDictionary:body];
    
    return message;
}

+ (AIMessage *) submitOrderServiceWithServiceArrays:(NSArray *)services{
    AIMessage *message = [AIMessage message];
    
    NSDictionary *body = @{@"data":@{@"service_list":services},@"desc":@{@"data_mode":@"0",@"digest":@""}};
    
    [message.body addEntriesFromDictionary:body];
    
    return message;
}

+ (AIMessage *) updateWiskListTagStateWishID:(NSInteger)wishID tagID:(NSInteger)tagID isChoose:(Boolean) ischoose{
    AIMessage *message = [AIMessage message];
    
    NSDictionary *body = @{@"data":@{@"wish_id":@(wishID),@"tag_list":@[@{@"id":@(tagID),@"is_chosen":@(ischoose)}]},@"desc":@{@"data_mode":@"0",@"digest":@""}};
    
    [message.body addEntriesFromDictionary:body];
    
    return message;
}

+ (AIMessage *) addFavoriteService:(NSString *)proposal_spec_id ServiceID:(NSString *)sid {
    AIMessage *message = [AIMessage message];
    
    NSDictionary *body = @{@"data":@{@"proposal_spec_id":proposal_spec_id,@"proposal_id":[NSString stringWithFormat:@"%@",sid]},@"desc":@{@"data_mode":@"0",@"digest":@""}};
    
    [message.body addEntriesFromDictionary:body];
    
    return message;
}

+ (AIMessage *) removeFavoriteService:(NSString *)proposal_inst_id {
    AIMessage *message = [AIMessage message];
    NSDictionary *body = @{@"data":@{@"proposal_inst_id":proposal_inst_id},@"desc":@{@"data_mode":@"0",@"digest":@""}};
    
    [message.body addEntriesFromDictionary:body];
    
    return message;
}

@end
