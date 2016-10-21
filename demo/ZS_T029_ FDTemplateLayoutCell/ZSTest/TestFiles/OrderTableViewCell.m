//
//  OrderTableViewCell.m
//  Mocha
//
//  Created by zhoushuai on 16/10/14.
//  Copyright © 2016年 renningning. All rights reserved.
//

#import "OrderTableViewCell.h"
#import "Masonry.h"
@implementation OrderTableViewCell

#pragma mark - 视图生命周期及控件加载
- (void)awakeFromNib {
    [super awakeFromNib];
    //awakeFromNib方法中添加约束
    [self setupConstraints];
}

/*弃用代码
+ (OrderTableViewCell *)getOrderTableViewCell{
    NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"OrderTableViewCell" owner:nil options:nil];
    OrderTableViewCell *view = array[0];
    //设置约束
    [view setupConstraints];
    return view;
}
*/


#pragma mark - 赋值
- (void)setDataDic:(NSDictionary *)dataDic{
    if (_dataDic != dataDic) {
        _dataDic = dataDic;
    }
    [self updateViewData];
 }

- (void)updateViewData{
    self.orderStatusInfoLabel.text = _dataDic[@"statusName"];
    
    self.timeLabel.text = _dataDic[@"create_time"];
    
    self.headerImgView.backgroundColor = [UIColor redColor];
    //[self.headerImgView sd_setImageWithURL:[NSURL URLWithString:startHeader] placeholderImage:[UIImage imageNamed:@"AppIcon"]];
    
    self.orderNameLabel.text = [NSString stringWithFormat:@"订单名称：%@",_dataDic[@"orderName"]];
    
    if (_dataDic[@"mark"]) {
        self.remarksLable.text = [NSString stringWithFormat:@"发起人：%@",_dataDic[@"mark"]];
    }else{
        self.remarksLable.text =  @"备注：无";
    }
    self.SponsorNameLabel.text =  [NSString stringWithFormat:@"发起人：%@",_dataDic[@"nickname"]];
    self.orderPriceLabel.text = [NSString stringWithFormat:@"订单价格：%@元",_dataDic[@"money"]];
}

- (void)setupConstraints{
    //更新约束
    CGFloat leftForHeaderImg = 30;

    [self.separateLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(10);
    }];
    [self.orderStatusInfoLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_separateLineView.mas_bottom);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(40);
    }];
    [self.timeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_separateLineView.mas_bottom);
        make.left.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.mas_equalTo(40);
    }];
    [self.firstLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.orderStatusInfoLabel.mas_bottom);
        make.left.equalTo(self.contentView).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.mas_equalTo(0.5);
    }];
    [self.headerImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.orderStatusInfoLabel.mas_bottom).offset(10);
        make.left.equalTo(self.contentView).offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
    
    [self.orderNameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerImgView);
        make.left.equalTo(self.headerImgView.mas_right).offset(leftForHeaderImg);
        make.right.equalTo(self).offset(-10);
        make.height.mas_equalTo(25);
    }];
    
    
    [self.remarksLable mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.orderNameLabel.mas_bottom);
        make.left.equalTo(self.headerImgView.mas_right).offset(leftForHeaderImg);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.mas_equalTo(25);
    }];
    
    [self.SponsorNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.remarksLable.mas_bottom);
        make.left.equalTo(self.headerImgView.mas_right).offset(leftForHeaderImg);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.mas_equalTo(25);
    }];
    
    //显示订单价格的Label的约束设置
    [self.orderPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.SponsorNameLabel.mas_bottom);
        make.left.equalTo(self.headerImgView.mas_right).offset(leftForHeaderImg);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.mas_equalTo(25);
        make.bottom.mas_offset(-10);//关键代码
    }];
}


#pragma mark - other
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}




@end
