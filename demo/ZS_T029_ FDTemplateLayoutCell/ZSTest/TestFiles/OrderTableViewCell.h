//
//  OrderTableViewCell.h
//  Mocha
//
//  Created by zhoushuai on 16/10/14.
//  Copyright © 2016年 renningning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *separateLineView;

@property (weak, nonatomic) IBOutlet UILabel *orderStatusInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIView *firstLineView;

@property (weak, nonatomic) IBOutlet UIImageView *headerImgView;
@property (weak, nonatomic) IBOutlet UILabel *orderNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *remarksLable;
@property (weak, nonatomic) IBOutlet UILabel *SponsorNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderPriceLabel;

//数据
@property(nonatomic,strong)NSDictionary *dataDic;

/*弃用代码
+ (OrderTableViewCell *)getOrderTableViewCell;
*/


@end
