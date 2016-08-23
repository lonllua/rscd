//
//  MainController.m
//  rscd
//
//  Created by bim on 16/8/11.
//  Copyright © 2016年 bim. All rights reserved.
//

#import "AppMacro.h"
#import "AppColor.h"
#import "AppFont.h"
#import "NavigationItemWraper.h"
#import "NavigationStyleUtil.h"
#import "MainController.h"
#import "MainUIStyleMng.h"
#import "RsWordDao.h"
#import "RsSentenceDao.h"
#import "StyleUtil.h"
#import "PopUtils.h"

@interface MainController ()
{
    AppColor *appColor;
    NSInteger currentIndex;//指示当前处于第几个tab页面
    NavigationItemWraper *navigationItemWraper;//标题控件打包
    NSString *appName;
    UIScrollView *root;
    UITextField *wordField; // 搜索栏
    
    UIView *noResultRoot;
    UIImageView *noResultImg;
    UILabel *noResultLabel;
    
    // 词性
    UIView *wordView;
    UILabel *cxLabel;
    UILabel *cixinL;
    UILabel *bianxinL;
    UILabel *bxLabel;
    UILabel *shiyiL;
    UILabel *syLabel;
    
    // 例句
    UILabel *llLabel;
    NSMutableArray *lijuLabelList;
    
    float fontSize;
}

@end

@implementation MainController

-(void) viewDidLoad
{
    [super viewDidLoad];
    [self initNavigationBar];
    [self.navigationController setNavigationBarHidden:NO];
    [StyleUtil drawLine:self.view frame:CGRectMake(0, 0, SCREEN_WIDTH, 0.5)];
    
    appColor = [AppColor sharedAppColor];
    fontSize = 16;
    
    root = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, CONTENT_HEIGHT-40)];
    [self.view addSubview:root];
    [root setBackgroundColor:[UIColor whiteColor]];
    
    //////////////////////////////////////// 输入框 ////////////////////////////////////////////////////////////
    wordField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH - 20, 40)];
    wordField.delegate = self;
    wordField.clearButtonMode = UITextFieldViewModeWhileEditing;
    wordField.returnKeyType = UIReturnKeyDone;
    wordField.keyboardType = UIKeyboardTypeDefault;
    wordField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    wordField.autocorrectionType = UITextAutocorrectionTypeNo;
    [self.view addSubview:wordField];
    [wordField setPlaceholder:@"请输入单词，如：göra"];
    
    [StyleUtil drawLine:root frame:CGRectMake(0, 10, SCREEN_WIDTH, 10) color:[appColor colorWithString:@"#EDEDED"]];
    /// 单词属性VIEW
    wordView = [[UIView alloc] initWithFrame:CGRectMake(0, 15, SCREEN_WIDTH, 0)];
    [root addSubview:wordView];
    //////////////////////////////////////// 词性 ////////////////////////////////////////////////////////////
    cxLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 48, fontSize)];
    [cxLabel setText:@"词性："];
    [self setLabel:cxLabel];
    [wordView addSubview:cxLabel];
    
    cixinL = [[UILabel alloc] initWithFrame:CGRectMake(58, 15, SCREEN_WIDTH - 68, fontSize)];
    [self setLabel:cixinL];
    [cixinL setTextColor:[appColor colorWithString:FONT2_COLOR]];
    [wordView addSubview:cixinL];
    
    //////////////////////////////////////// 变形 ////////////////////////////////////////////////////////////
    bxLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, fontSize+25, 48, fontSize)];
    [bxLabel setText:@"变形："];
    [self setLabel:bxLabel];
    [wordView addSubview:bxLabel];
    
    bianxinL = [[UILabel alloc] initWithFrame:CGRectMake(58, fontSize+23, SCREEN_WIDTH - 68, 0)];
    [self setLabel:bianxinL];
    [bianxinL setTextColor:[appColor colorWithString:FONT2_COLOR]];
    [wordView addSubview:bianxinL];
    
    //////////////////////////////////////// 词典释义 /////////////////////////////////////////////////////////
    syLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 48, fontSize)];
    [syLabel setText:@"释义："];
    [self setLabel:syLabel];
    [wordView addSubview:syLabel];
    
    shiyiL = [[UILabel alloc] initWithFrame:CGRectMake(58, 0, SCREEN_WIDTH - 68, 0)];
    [self setLabel:shiyiL];
    [shiyiL setTextColor:[appColor colorWithString:FONT2_COLOR]];
    [wordView addSubview:shiyiL];
    
    //////////////////////////////////////// 例句 ////////////////////////////////////////////////////////////
    llLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 32, 16)];
    [llLabel setText:@"例句"];
    [self setLabel:llLabel];
    [root addSubview:llLabel];

    //////////////////////////////////////// 近义词 ////////////////////////////////////////////////////////////
    
    //  收起键盘
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTap:)];
    [root addGestureRecognizer:tapRecognizer];
    
    [self seachWord:NO];
    
    //////////////////////////////////////// 无结果 ////////////////////////////////////////////////////////////
    noResultRoot = [[UIView alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, CONTENT_HEIGHT-40)];
    [noResultRoot setHidden:YES];
    [self.view addSubview:noResultRoot];
    [noResultRoot setBackgroundColor:[UIColor whiteColor]];
    [StyleUtil drawLine:noResultRoot frame:CGRectMake(0, 0, SCREEN_WIDTH, 10) color:[appColor colorWithString:@"#EDEDED"]];
    
    noResultImg = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH - 110)/2, 140, 110, 110)];
    [noResultImg setImage:[UIImage imageNamed:@"img_empty"]];
    [noResultRoot addSubview:noResultImg];
    
    noResultLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 265, SCREEN_WIDTH, 16)];
    noResultLabel.text = @"抱歉！没有找到单词";
    noResultLabel.textAlignment = NSTextAlignmentCenter;
    noResultLabel.font = [UIFont systemFontOfSize:16];
    noResultLabel.textColor = [appColor colorWithString:@"#333333"];
    [noResultRoot addSubview:noResultLabel];
    //  收起键盘
    [noResultRoot addGestureRecognizer:tapRecognizer];
}

-(void) setLabel:(UILabel *)label
{
    [label setFont:[UIFont systemFontOfSize:fontSize]];
    [label setTextColor:[appColor colorWithString:FONT3_COLOR]];
    [label setNumberOfLines:0];
}

/**
 * 初始化导航条
 **/
-(void)initNavigationBar {
    navigationItemWraper = [NavigationStyleUtil m_InitNavigationItem:self.navigationItem];
    navigationItemWraper.titleLabel.text = @"瑞士语词典";
    [[MainUIStyleMng sharedInstance] setNavigationBarStyle:self.navigationController.navigationBar];
    [[MainUIStyleMng sharedInstance] setNavigationBarStyle:[UINavigationBar appearance]];
}

- (void)handleTap:(UIGestureRecognizer *)gesture
{
    [wordField resignFirstResponder];
}

- (void)textViewDidChangeSelection:(UITextView *)textView
{
    
}

// 按下确认键，键盘收起
-(BOOL)textFieldShouldReturn:(UITextField*)textField
{
    NSLog(@"语言：%@", [[self textInputMode] primaryLanguage]);
    [wordField resignFirstResponder];
    [self seachWordWithAnimation];
    return YES;
}

-(void)seachWordWithAnimation
{
    [[PopUtils sharePopUtils] addPopFadeOut:root callback:^(POPAnimation *animation, BOOL finished) {
        [self seachWord:YES];
    }];
}

-(void) seachWord:(BOOL) withAnimation
{
    NSString *seachWord = wordField.text;
    if (!seachWord || [@"" isEqualToString:seachWord]) {
        seachWord = @"göra";
    }
    
    Rsword *rw = [RsWordDao queryRswordByWord:seachWord];
    if (!rw) { // 没有此单词
        if(withAnimation){
            [root setHidden:YES];
            [noResultRoot setHidden:NO];
            [noResultLabel setText:[NSString stringWithFormat:@"抱歉！没有找到单词[%@]", seachWord]];
        }
        return;
    }else{
        [root setHidden:NO];
        [noResultRoot setHidden:YES];
    }
    
    if (lijuLabelList && [lijuLabelList count] > 0) { // 移除例句
        [lijuLabelList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            UILabel *label = obj;
            [label removeFromSuperview];
        }];
    }
    
    CGSize maxSize = CGSizeMake(SCREEN_WIDTH - 68, 100);
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    
    cixinL.text = rw.cixin; // 固定一行
    bianxinL.text = rw.bianxin;
    [self setupTextAttribute:bianxinL];
    
    CGSize bianxinSize = [StyleUtil getTextSize:rw.bianxin font:font maxSize:maxSize];
    [StyleUtil setViewHeight:bianxinL height:bianxinSize.height];
    
    shiyiL.text = rw.shiyi;
    [self setupTextAttribute:shiyiL];
    CGSize shiyiSize = [StyleUtil getTextSize:rw.shiyi font:font maxSize:maxSize];
    float shiyiTop = bxLabel.frame.origin.y + bianxinSize.height + 10;
    [StyleUtil setViewHeight:shiyiL height:shiyiSize.height];
    [StyleUtil setViewTop:syLabel top:shiyiTop];
    [StyleUtil setViewTop:shiyiL top:shiyiTop-2];
    [StyleUtil setViewHeight:wordView height:fontSize + bianxinSize.height + shiyiSize.height + 45];
    
    float wordViewH = wordView.frame.size.height;
    [StyleUtil drawLine:wordView frame:CGRectMake(10, wordViewH-0.5, SCREEN_WIDTH-10, 0.5)];
    
    // 例句
    [StyleUtil setViewTop:llLabel top: 25 + wordViewH];
    NSArray *lijuList = [RsSentenceDao querySentenceListByWord:seachWord];
    __block float lijuTop = 25 + wordViewH + fontSize + 10;
    lijuLabelList = [NSMutableArray array];
    [lijuList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        RsWordSentence *rws = obj;
        lijuTop = [self addLijulabel:lijuTop text:rws.sentence fanyi:rws.chinese index:idx];
        if (idx == [lijuList count]-1) { //  结束
            [[PopUtils sharePopUtils] addPopFadeIn:root callback:^(POPAnimation *animation, BOOL finished) {
                if (lijuTop > root.frame.size.height) {
                    [root setContentSize:CGSizeMake(SCREEN_WIDTH, lijuTop)];
                }
            }];
        }
    }];
    
    if(!lijuList || [lijuList count] == 0){
        [[PopUtils sharePopUtils] addPopFadeIn:root callback:^(POPAnimation *animation, BOOL finished) {
        }];
    }
        
}

-(float) addLijulabel:(float) top text:(NSString *)text fanyi:(NSString *)fanyi index:(NSUInteger)index
{
    CGSize maxSize = CGSizeMake(SCREEN_WIDTH - 20, 100);
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    // 例句原文. 如: 1. Hon skulle ha fest på kvällen och hade massor att göra.
    UILabel *lijuL = [[UILabel alloc] initWithFrame:CGRectMake(10, top, SCREEN_WIDTH - 20, 0)];
    [lijuL setFont:[UIFont systemFontOfSize:fontSize]];
    [lijuL setNumberOfLines:0];
    NSString *lijuLText = [NSString stringWithFormat:@"%ld. %@", index+1, text];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:lijuLText];
    [str addAttribute:NSForegroundColorAttributeName value:[appColor colorWithString:FONT3_COLOR] range:NSMakeRange(0,2)];
    [str addAttribute:NSForegroundColorAttributeName value:[appColor colorWithString:FONT2_COLOR] range:NSMakeRange(2,[text length])];
    
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:6.5];
    [str addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [lijuLText length])];
    lijuL.attributedText = str;
    
//    [self setupTextAttribute:lijuL];
    CGSize lijuSize = [StyleUtil getTextSize:text font:font maxSize:maxSize];
    [StyleUtil setViewHeight:lijuL height:lijuSize.height];
    [root addSubview:lijuL];
    
    // 例句翻译. 如: 她准备在晚上开个派对，有很多事要处理。
    UILabel *fanyiL = [[UILabel alloc] initWithFrame:CGRectMake(10, top + lijuSize.height + 10, SCREEN_WIDTH - 20, 0)];
    [fanyiL setFont:[UIFont systemFontOfSize:fontSize]];
    [fanyiL setNumberOfLines:0];
    [fanyiL setTextColor:[appColor colorWithString:FONT2_COLOR]];
    fanyiL.text = fanyi;
    [self setupTextAttribute:fanyiL];
    CGSize fanyiSize = [StyleUtil getTextSize:fanyi font:font maxSize:maxSize];
    [StyleUtil setViewHeight:fanyiL height:fanyiSize.height];
    [root addSubview:fanyiL];
    
    [lijuLabelList addObject:lijuL];
    [lijuLabelList addObject:fanyiL];
    return top + lijuSize.height + 10 + fanyiSize.height + 10;
}

-(void) setupTextAttribute:(UILabel *) label
{
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:6.5];
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:label.text];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [label.text length])];
    [label setAttributedText:attributedString1];
}

-(void) printData
{
    Rsword *rw = [RsWordDao queryRswordByWord:@"göra"];
    NSLog(@"第一条数据是：%@", rw.word);
    
    NSArray *lijuArray = [RsSentenceDao querySentenceListByWord:@"göra"];
    [lijuArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        RsWordSentence *rws = obj;
        NSLog(@"例句：%@", rws.chinese);
    }];
}

-(void) initTestData
{
    Rsword *word1 = [[Rsword alloc] init];
    word1.word = @"göra";
    word1.cixin = @"v";
    word1.bianxin = @"göra,gör,gjorde,gjort.Gör!";
    word1.shiyi = @"处理，从事; 制造，生产; 提供，影响; （代替其它动词，避免重复）";
    word1.jinyici = @"göra";
    [RsWordDao addRsword:word1];
    
    Rsword *word2 = [[Rsword alloc] init];
    word2.word = @"gå";
    word2.cixin = @"v";
    word2.bianxin = @"gå,går,gick,gått.Gå!";
    word2.shiyi = @"徒步，走; 离开; 流逝; 运作，运行; 事件触发，（交通工具）离站; 放映; 合身，合适";
    word2.jinyici = @"gå";
    [RsWordDao addRsword:word2];
    
    RsWordSentence *rws = [[RsWordSentence alloc] init];
    rws.word = @"göra";
    rws.sentence = @"Hon skulle ha fest på kvällen och hade massor att göra.";
    rws.chinese = @"她准备在晚上开个派对，有很多事要处理。";
    
    RsWordSentence *rws1 = [[RsWordSentence alloc] init];
    rws1.word = @"göra";
    rws1.sentence = @"Hon gjorde en liten pall i slöjden.";
    rws1.chinese = @"她做了一个手工小凳子。";
    
    RsWordSentence *rws2 = [[RsWordSentence alloc] init];
    rws2.word = @"göra";
    rws2.sentence = @"Nyheten gjorde henne glad.";
    rws2.chinese = @"这个消息让她很高兴。";
    
    RsWordSentence *rws3 = [[RsWordSentence alloc] init];
    rws3.word = @"gå";
    rws3.sentence = @"Han går 3 kilometer varje dag.";
    rws3.chinese = @"他每天走3公里。";
    
    RsWordSentence *rws4 = [[RsWordSentence alloc] init];
    rws4.word = @"gå";
    rws4.sentence = @"Klockan är mycket, vi måste gå!";
    rws4.chinese = @"很晚了，我们必须走了！";
    
    RsWordSentence *rws5 = [[RsWordSentence alloc] init];
    rws5.word = @"gå";
    rws5.sentence = @"Tiden går fort när man har trevligt.";
    rws5.chinese = @"愉快的时光总是过得很快。";
    
    [RsSentenceDao addRsWordSentence:rws];
    [RsSentenceDao addRsWordSentence:rws1];
    [RsSentenceDao addRsWordSentence:rws2];
    [RsSentenceDao addRsWordSentence:rws3];
    [RsSentenceDao addRsWordSentence:rws4];
    [RsSentenceDao addRsWordSentence:rws5];
}

@end
