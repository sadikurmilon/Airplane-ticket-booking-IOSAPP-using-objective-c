//
//  Mydatas.m
//  AirplaneTicketApp
//
//  Created by User on 2021-02-25.
//  Copyright © 2021 Seneca. All rights reserved.
//

#import "Mydatas.h"

@implementation Mydatas
-(NSMutableArray *)items{  //lazy loading all my data
    if(_items == nil){  
        _items = [[NSMutableArray alloc]initWithObjects:@"VIP",@"Business",@"Economy Adult",@"Economy Kid",@"Infent", nil];
    }
    return _items;
}
-(NSMutableArray *)quantitytotrnsfer{
    if(_quantitytotrnsfer == nil){
        _quantitytotrnsfer = [[NSMutableArray alloc]init];
    }
    return _quantitytotrnsfer;
}
-(NSMutableArray *)namestotrnsfer{
    if(_namestotrnsfer == nil){
        _namestotrnsfer = [[NSMutableArray alloc]init];
    }
    return _namestotrnsfer;
}

@end
