//
//  WSThirdTableController.m
//  EnableEditCellDemo
//
//  Created by sw on 16/7/23.
//  Copyright © 2016年 sw. All rights reserved.
//

#import "WSThirdTableController.h"
#import "WSTextViewCell.h"

@interface WSThirdTableController ()


{
    BOOL isEditing;
}
// 如果既有成员变量，又有属性，那么属性写在成员变量后面，否则报错
@property(nonatomic,strong) NSMutableArray<NSString *> *contentTexts;

@end

@implementation WSThirdTableController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([WSTextViewCell class]) bundle:nil] forCellReuseIdentifier:@"enableEditCell"];
    
    // self-sizing
    self.tableView.estimatedRowHeight = 200.f;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.contentTexts.count;;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WSTextViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"enableEditCell"];
    
    [cell setContent:self.contentTexts[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"选中:%ld行",indexPath.row);
    
    CGRect rectInView = [self getCellRectInView:self.view forIndexPath:indexPath];
    
    WSTextViewCell *cell = [self getCellInTableView:tableView ForRect:rectInView];
    
    isEditing = !isEditing;
    if (!isEditing) {
        [self.view endEditing:YES];
        [self.tableView setScrollEnabled:YES];
        self.contentTexts[indexPath.row] = cell.textView.text;
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        return;
    }
    [cell.textView becomeFirstResponder];
    
    // [self addTextView:self.textView toCell:cell];
}

- (CGRect)getCellRectInView:(UIView *)view forIndexPath:(NSIndexPath *)indexPath {
    // 1.获取cell 在 屏幕上的 frame
    CGRect rectInTableView = [self.tableView rectForRowAtIndexPath:indexPath];
    CGRect rect = [self.tableView convertRect:rectInTableView toView:view];
    return rect;
}

- (WSTextViewCell *)getCellInTableView:(UITableView *)tableView ForRect:(CGRect)rect {
    // 2.获取显示的所有cell
    NSArray *visibleCells = [tableView visibleCells];
    // 3.遍历数组中每个cell的frame
    for (WSTextViewCell *cell in visibleCells) {
        CGRect frame = [tableView convertRect:cell.frame toView:self.view];
        if (CGRectEqualToRect(frame, rect)) {
            return cell;
        }
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - getter
- (NSMutableArray<NSString *> *)contentTexts {
    if (!_contentTexts) {
        NSArray *contentTexts = @[
                                  @"1.《卜算子·我住长江头》-作者：李之仪。我住长江头，君住长江尾。日日思君不见君，共饮长江水。此水几时休，此恨何时已。只愿君心似我心，定不负相思意。",
                                  @"2.《临江仙·梅》-作者：李清照。庭院深深深几许，云窗雾阁春迟。为谁憔悴损芳姿。夜来清梦好，应是发南枝。瘦檀轻无限恨，南楼羌管休吹。浓香吹尽有谁知。暖风迟日也，别到杏花肥。",
                                  @"3.《虞美人·宜州见梅作》-作者：黄庭坚。天涯也有江南信。梅破知春近。夜阑风细得香迟。不道晓来开遍、向南枝。玉台弄粉花应妒。飘到眉心住。平生个里愿杯深。去国十年老尽、少年心",
                                  @"4.《渔家傲·秋思》-作者：范仲淹。塞下秋来风景异，衡阳雁去无留意。四面边声连角起，千嶂里，长烟落日孤城闭。浊酒一杯家万里，燕然未勒归无计。羌管悠悠霜满地，人不寐，将军白发征夫泪。",
                                  @"5.《雨霖铃·寒蝉凄切》- 作者：柳永。寒蝉凄切，对长亭晚，骤雨初歇。都门帐饮无绪，留恋处，兰舟催发。执手相看泪眼，竟无语凝噎。念去去，千里烟波，暮霭沉沉楚天阔。多情自古伤离别，更那堪，冷落清秋节！今宵酒醒何处？杨柳岸，晓风残月。此去经年，应是良辰好景虚设。便纵有千种风情，更与何人说？",
                                  @"6.《摸鱼儿·更能消几番风雨》-作者：辛弃疾。更能消、几番风雨，匆匆春又归去。惜春长怕花开早，何况落红无数。春且住，见说道、天涯芳草无归路。怨春不语。算只有殷勤，画檐蛛网，尽日惹飞絮。(怕 一作：恨)   (无归路 一作：迷归路）长门事，准拟佳期又误。蛾眉曾有人妒。千金纵买相如赋，脉脉此情谁诉？君莫舞，君不见、玉环飞燕皆尘土！闲愁最苦！休去倚危栏，斜阳正在，烟柳断肠处。",
                                  @"7.《水龙吟·过南剑双溪楼》-作者：辛弃疾。举头西北浮云，倚天万里须长剑。人言此地，夜深长见，斗牛光焰。我觉山高，潭空水冷，月明星淡。待燃犀下看，凭栏却怕，风雷怒，鱼龙惨。峡束苍江对起，过危楼，欲飞还敛。元龙老矣！不妨高卧，冰壶凉簟。千古兴亡，百年悲笑，一时登览。问何人又卸，片帆沙岸，系斜阳缆？",
                                  @"8.《昭君怨·送别》-作者：苏轼。谁作桓伊三弄。惊破绿窗幽梦。新月与愁烟。满江天。欲去又还不去。明日落花飞絮。飞絮送行舟。水东流。",
                                  @"9.《一剪梅·红藕香残玉簟秋》-作者：李清照。红藕香残玉簟秋。轻解罗裳，独上兰舟。云中谁寄锦书来，雁字回时，月满西楼。花自飘零水自流。一种相思，两处闲愁。此情无计可消除，才下眉头，却上心头。 ",
                                  @"10.《卜算子·咏梅》-作者：陆游。驿外断桥边，寂寞开无主。已是黄昏独自愁，更著风和雨。无意苦争春，一任群芳妒。零落成泥碾作尘，只有香如故。"
                                  ];
        _contentTexts = [NSMutableArray arrayWithArray:contentTexts];
    }
    return _contentTexts;
}

@end
