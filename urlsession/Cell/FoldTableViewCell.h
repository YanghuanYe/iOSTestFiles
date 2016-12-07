//
//  FoldTableViewCell.h
//  urlsession
//
//  Created by apple on 2016/12/1.
//  Copyright © 2016年 YYH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FoldTableViewCell;
@protocol FoldTableViewCellFoldProtocol <NSObject>

- (void)foldCellWillBeUnfolded:(NSIndexPath *)indexPath;

@end

typedef NS_ENUM(NSUInteger, FoldTableViewCellType) {
    FoldTableViewCellTypeFold,
    FoldTableViewCellTypeUnfold
};

@interface FoldTableViewCell : UITableViewCell

@property (nonatomic, strong)id<FoldTableViewCellFoldProtocol> delegate;
@property (nonatomic, strong)NSIndexPath *indexPath;
@property (nonatomic, assign)FoldTableViewCellType type;
@property (nonatomic, strong)NSString *buttonName;
@property (nonatomic, strong)NSString *labelName;

@end
