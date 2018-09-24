//
//  HJG_HomeController.m
//  JinRiYouJia
//
//  Created by Developer on 2018/8/29.
//  Copyright © 2018年 Developer. All rights reserved.
//

#import "HJG_HomeController.h"
#import <BRStringPickerView.h>
#define appid @"72569"
#define miyao @"16832f34ea984854a4d3b9c190a65427"
#import "HJGYouModel.h"
@interface HJG_HomeController ()

@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, strong) UIButton *titleBut;

@property (nonatomic, strong) UILabel *shengLab;

@property (nonatomic, strong) UILabel *todayLab;

@property (nonatomic, strong) UILabel *firstLab;

@property (nonatomic, strong) UILabel *secondLab;

@property (nonatomic, strong) UILabel *thirdLab;

@property (nonatomic, strong) UILabel *forthLab;

@property (nonatomic, strong) NSMutableArray *modelArr;

@end

@implementation HJG_HomeController

- (NSMutableArray *)modelArr{
    
    if (!_modelArr) {
        _modelArr = [NSMutableArray array];
    }
    
    return _modelArr;
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configNav];
    
    [self configView];
    
    [self getNetData];
}

#pragma mark - configNav
- (void)configNav{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"今日油价";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[UIView new]];
    
}

- (void)getNetData{
    
     NSDictionary *dic = @{@"showapi_appid":appid,@"showapi_sign":miyao};
    
    [self.modelArr removeAllObjects];
    [HJGNetManger getUrl:@"http://route.showapi.com/138-46" IsNeedCashe:NO dic:dic responseSuccess:^(id response) {
        
        DLog(@"--------%@",response);
        
        NSArray *arr = response[@"showapi_res_body"][@"list"];
        
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            HJGYouModel *model = [HJGYouModel mj_objectWithKeyValues:obj];
            
            [self.modelArr addObject:model];
        }];
        
        
        [self dealWithgData];
    } responseFail:^(NSError *error) {
        
    }];
    
    
}

#pragma mark - configView
- (void)configView{
    
    [self bgImageView];
    
    [self titleBut];
    
    [self shengLab];
    
    [self todayLab];
    
    [self firstLab];
    
    [self secondLab];
    
    [self thirdLab];
    
    [self forthLab];
    
    NSDate *date=[NSDate date];
    NSDateFormatter *format1=[[NSDateFormatter alloc] init];
    [format1 setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr;
    dateStr=[format1 stringFromDate:date];
    NSLog(@"%@",dateStr);
    
    self.todayLab.text = dateStr;

}


- (void)dealWithgData{
    
    [self.modelArr enumerateObjectsUsingBlock:^(HJGYouModel * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj.prov isEqualToString:self.titleBut.titleLabel.text]) {
            self.firstLab.text = [NSString stringWithFormat:@"P0号的今日油价为%@元",obj.p0];
            self.secondLab.text = [NSString stringWithFormat:@"P89号的今日油价为%@元",obj.p89];
            self.thirdLab.text = [NSString stringWithFormat:@"P92号的今日油价为%@元",obj.p92];
            self.forthLab.text = [NSString stringWithFormat:@"P95号的今日油价为%@元",obj.p95];
        }
        
    }];
    
}

- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        UIImageView * theView = [[UIImageView alloc] init];
        theView.image = [UIImage imageNamed:@"33333"];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(self.view);
            make.top.equalTo(self.view).offset(kMarginTopHeight);
        }];
        _bgImageView = theView;
    }
    return _bgImageView;
}

- (void)titleButClick
{

    
    NSMutableArray *arr = [NSMutableArray array];
    
    [self.modelArr enumerateObjectsUsingBlock:^(HJGYouModel * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [arr addObject:obj.prov];
        
    }];
    
    
    @weakify_self;
//    NSString *dataSource = @"testData1.plist"; // 可以将数据源（上面的数组）放到plist文件中
    [BRStringPickerView showStringPickerWithTitle:@"选择省份" dataSource:arr defaultSelValue:@"北京"         isAutoSelect:YES themeColor:nil resultBlock:^(id selectValue) {
        @strongify_self;
        [self.titleBut setTitle:selectValue forState:UIControlStateNormal];
        
        [self dealWithgData];
    } cancelBlock:^{
        NSLog(@"点击了背景视图或取消按钮");
    }];
    

}


- (UIButton *)titleBut
{
    if (!_titleBut) {
        UIButton * theView = [[UIButton alloc] init];
        [theView setTitle:@"北京" forState:0];
        theView.layer.borderColor = [UIColor grayColor].CGColor;
        [theView addTarget:self action:@selector(titleButClick) forControlEvents:UIControlEventTouchUpInside];
        [theView setTitleColor:dingzhiyanse forState:UIControlStateNormal];
        theView.layer.borderWidth = W(2);
        theView.clipsToBounds = YES;
        theView.layer.cornerRadius = W(3);
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(kMarginTopHeight + H(40));
            make.centerX.equalTo(self.view);
            make.size.equalTo(CGSizeMake(W(100), H(45)));
        }];

        _titleBut = theView;
    }
    return _titleBut;
}


- (UILabel *)shengLab
{
    if (!_shengLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.text = @"省";
        theView.textColor = dingzhiyanse;
        theView.textAlignment = NSTextAlignmentLeft;
        theView.font = [UIFont systemFontOfSize:W(16)];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleBut);
            make.left.equalTo(self.titleBut.right).offset(W(5));
            make.height.equalTo(H(20));
        }];
        _shengLab = theView;
    }
    return _shengLab;
}


- (UILabel *)todayLab
{
    if (!_todayLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.text= @"今日2018-18日";
        theView.textAlignment = NSTextAlignmentCenter;
        theView.font = [UIFont systemFontOfSize:W(18)];
        theView.textColor = [UIColor darkTextColor];
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.shengLab.bottom).offset(H(45));
            make.height.equalTo(H(25));
        }];
        _todayLab = theView;
    }
    return _todayLab;
}


- (UILabel *)firstLab
{
    if (!_firstLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.text= @"10好汽油今日价格10.00元";
        theView.textAlignment = NSTextAlignmentCenter;
        theView.font = [UIFont systemFontOfSize:W(18)];
        theView.textColor = dingzhiyanse;
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.todayLab.bottom).offset(H(40));
            make.centerX.equalTo(self.view);
            make.height.equalTo(H(25));
        }];
        _firstLab = theView;
    }
    return _firstLab;
}


- (UILabel *)secondLab
{
    if (!_secondLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.text= @"8好汽油今日价格10.00元";
        theView.textAlignment = NSTextAlignmentCenter;
        theView.font = [UIFont systemFontOfSize:W(18)];
        theView.textColor = dingzhiyanse;
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.firstLab.bottom).offset(H(50));
            make.centerX.equalTo(self.view);
            make.height.equalTo(H(25));
        }];
        _secondLab = theView;
    }
    return _secondLab;
}


- (UILabel *)thirdLab
{
    if (!_thirdLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.text= @"3443好汽油今日价格10.00元";
        theView.textAlignment = NSTextAlignmentCenter;
        theView.font = [UIFont systemFontOfSize:W(18)];
        theView.textColor = dingzhiyanse;
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.secondLab.bottom).offset(H(50));
            make.centerX.equalTo(self.view);
            make.height.equalTo(H(25));
        }];
        _thirdLab = theView;
    }
    return _thirdLab;
}

- (UILabel *)forthLab
{
    if (!_forthLab) {
        UILabel * theView = [[UILabel alloc] init];
        theView.text= @"r22好汽油今日价格10.00元";
        theView.textAlignment = NSTextAlignmentCenter;
        theView.font = [UIFont systemFontOfSize:W(18)];
        theView.textColor = dingzhiyanse;
        [self.view addSubview:theView];
        [theView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.thirdLab.bottom).offset(H(50));
            make.centerX.equalTo(self.view);
            make.height.equalTo(H(25));
        }];
        _forthLab = theView;
    }
    return _forthLab;
}
@end
