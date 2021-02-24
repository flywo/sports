class CenterListModel {
  /// 当前第几轮 - 热门 足球
  final current;
  /// 比赛时间 - 热门 足球 篮球
  final time;
  /// 比赛名称 - 热门 足球 篮球
  final name;
  /// 比分 - 热门
  final score;
  /// 左边队伍名称 - 热门 足球 篮球
  final leftName;
  /// 右边队伍名称 - 热门 足球 篮球
  final rightName;
  /// 左边队伍ICON - 热门 足球 篮球
  final leftIcon;
  /// 右边队伍ICON - 热门 足球 篮球
  final rightIcon;
  /// 左边X分 - 热门 足球 篮球
  final leftPoint;
  /// 右边X分 - 热门 足球 篮球
  final rightPoint;
  /// 左边VS - 热门
  final leftVS;
  /// 右边VS - 热门
  final rightVS;
  /// 视频列表 - 热门 足球 篮球
  final List<Video> videos;
  /// 半 - 足球
  final half;
  /// 角 - 足球
  final corner;
  /// 左边队伍分1 - 足球 篮球
  final leftP1;
  /// 左边队伍分2 - 足球 篮球
  final leftP2;
  /// 左边队伍分3 - 足球 篮球
  final leftP3;
  /// 右边队伍分1 - 足球 篮球
  final rightP1;
  /// 右边队伍分2 - 足球 篮球
  final rightP2;
  /// 右边队伍分3 - 足球 篮球
  final rightP3;
  /// 中间分1 - 足球
  final midP1;
  /// 中间分2 - 足球
  final midP2;
  /// 中间分3 - 足球
  final midP3;
  /// 当前节数 - 篮球
  final currentStep;
  /// 左边当前状态 - 篮球
  final leftPTitle;
  /// 左边队伍分4 - 篮球
  final leftP4;
  /// 右边当前状态 - 篮球
  final rightPTitle;
  /// 右边队伍分4 - 篮球
  final rightP4;
  CenterListModel({
    this.current = "",
    this.time = "",
    this.name = "",
    this.score = "",
    this.leftName = "",
    this.rightName = "",
    this.leftIcon = "",
    this.rightIcon = "",
    this.leftPoint = "",
    this.rightPoint = "",
    this.leftVS = "",
    this.rightVS = "",
    this.videos = const [],
    this.half,
    this.corner,
    this.leftP1,
    this.leftP2,
    this.leftP3,
    this.rightP1,
    this.rightP2,
    this.rightP3,
    this.currentStep,
    this.leftPTitle,
    this.rightPTitle,
    this.leftP4,
    this.rightP4,
    this.midP1,
    this.midP2,
    this.midP3
  });
}

class Video {
  /// 视频名称
  final name;
  /// 视频图片
  final image;
  /// 视频是否可看
  final show;
  Video(this.name, this.image, this.show);
}