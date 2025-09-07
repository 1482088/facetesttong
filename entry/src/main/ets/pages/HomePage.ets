import { HcSearchBox } from "../commons/components"
import { HcClockIn } from '../commons/components'

@Component
export struct HomePage {
  @StorageProp('topheight')
  topheight: number = 0

  build() {
    Column() {
      Row({ space: 16 }) {
        Image($r('app.media.ic_home_scan'))
          .width(24)
          .aspectRatio(1)
        //搜索-TODO
        HcSearchBox({
          layoutWeightValue: 1
        })
        //打卡-TODO
        HcClockIn()
      }.padding({ left: 16, right: 16 })
      .height(64)
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .padding({ top: this.getUIContext().px2vp(this.topheight) })
    .backgroundColor($r('app.color.common_gray_bg'))
  }
}