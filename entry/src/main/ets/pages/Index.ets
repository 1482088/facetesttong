import { fullscreen } from '../commons/utils/FullScreen';
import { statusbar } from '../commons/utils/StatusBar';
import { HomePage } from './HomePage';
import { InterviewPage } from './InterviewPage';
import { ProjectPage } from './ProjectPage';

interface TabItem {
  icon: Resource;
  activeIcon: Resource;
  name: string;
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @StorageProp('topheight')
  topheight:number=0
  @StorageProp('bottomheight')
  bottomheight:number=0
@State activeselect:number=0
  // struct Index 数据
  tabList: TabItem[] = [
    {
      icon: $r('app.media.tabbar_home'),
      activeIcon: $r('app.media.tabbar_home_fill'),
      name: '首页'
    },
    {
      icon: $r('app.media.tabbar_project'),
      activeIcon: $r('app.media.tabbar_project_fill'),
      name: '项目'
    },
    {
      icon: $r('app.media.tabbar_interview'),
      activeIcon: $r('app.media.tabbar_interview_fill'),
      name: '面经'
    },
    {
      icon: $r('app.media.tabbar_mine'),
      activeIcon: $r('app.media.tabbar_mine_fill'),
      name: '我的'
    }
  ]
@Builder
TabbarBuilder(item:TabItem,index:number){
    Column({space:5}){
      Image(this.activeselect==index?item.activeIcon:item.icon)
        .width(24)
        .aspectRatio(1)
      Text(item.name)
        .fontSize(12)
        .fontColor(this.activeselect==index?$r('app.color.black'):$r('app.color.common_gray_01'))
    }
}
  build(){
Column(){
Tabs(){
  ForEach(this.tabList,(item:TabItem,index:number)=>{
    TabContent(){
      if (index==0) {
        HomePage()
      }else if (index==1){
        ProjectPage()
      }else if (index==2) {
        InterviewPage()
      }else {
        ProjectPage()
      }
    }
      .tabBar(this.TabbarBuilder(item,index))
  })

}.barPosition(BarPosition.End).onTabBarClick((index)=>{this.activeselect=index})
}.width('100%').height('100%').backgroundColor($r('app.color.white')).padding({top:this.getUIContext().px2vp(this.topheight),bottom:this.getUIContext().px2vp(this.bottomheight)})
  }
}