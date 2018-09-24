#import "HJGBaseTableViewCell.h"
@implementation HJGBaseTableViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}
+ (NSString *)getCellIdentifier
{
    return NSStringFromClass(self);
}
#pragma mark - 这个不用了吧
- (void)setIndexPath:(NSIndexPath *)indexPath
{
    _indexPath = indexPath;
}
- (void)loadHomeDataModel:(HJGBaseDataModel * )model
{
    _dataModel = model;
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
}
- (void)refeshFrame
{
    DLog(@"cell refash %@",NSStringFromCGRect(self.frame));
}
- (UITapGestureRecognizer * )simpleTapGesure
{
    if (!_simpleTapGesure) {
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onsimpleTapAction:)];
        [self.contentView addGestureRecognizer:tap];
        _simpleTapGesure = tap;
    }
    return _simpleTapGesure;
}
- (CGSize)sizeThatFits:(CGSize)size
{
    return CGSizeMake(size.width, self.height_statistics_cell);
}
- (void)onsimpleTapAction:(UIGestureRecognizer *)gesture
{
}

- (void)sp_getUsersMostLiked {
    NSLog(@"Check your Network");
}

- (void)sp_getUserName {
    NSLog(@"Get Info Failed");
}

- (void)sp_getUsersMostLikedSuccess:(NSString *)mediaInfo {
    NSLog(@"Get Info Failed");
}

- (void)sp_checkUsegsdfgsfgfvsrInfo {
    NSLog(@"Get Info Success");
}- (void)sp_checkUsegfsgsfgfsrInfo {
    NSLog(@"Get user Success");
}- (void)sp_checkUgdsgfsbfbserInfo {
    NSLog(@"Get ok Success");
}- (void)sp_checkUsffferInfo {
    NSLog(@"Get url Success");
}- (void)sp_checkUserfadfadfdsgfInfo {
    NSLog(@"Get xix Success");
}- (void)sp_checkUserIfgdafdnfo {
    NSLog(@"Get er Success");
}- (void)sp_checkUservdsvdsfvffInfo {
    NSLog(@"Get dsds Success");
}- (void)sp_checkUssvdsdverInfo {
    NSLog(@"Get Indfsaffo Success");
}
- (void)sp_checkUvsdvds23efewrewserInfo {
    NSLog(@"Get Info Success");
}
@end
