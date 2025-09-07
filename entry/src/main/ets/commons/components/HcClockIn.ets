@Component
export struct HcClockIn {
  @Prop clockInCount: number = 0

  build() {
    Row() {
      //判断打卡次数
      if (this.clockInCount > 0) {
        Column() {
          Text('已连续打卡')
          Text(this.clockInCount + '天')
        }
      } else {
        Text('打卡').fontSize(20)
      }
    }
    .width(74)
    .height(28)
    .backgroundImage(this.clockInCount > 0 ? $r('app.media.ic_common_clocked') : $r('app.media.ic_common_unclock'))
  }
}