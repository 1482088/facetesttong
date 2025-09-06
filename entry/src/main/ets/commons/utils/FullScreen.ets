import { window } from '@kit.ArkUI'
import { Context } from '@ohos.abilityAccessCtrl'

 class FullScreen{
  async enable(){
    const context=AppStorage.get<Context>('context')
    if(context){
      const win = await window.getLastWindow(context)
      win.setWindowLayoutFullScreen(true)
      const windowtopheight=await win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
      const windowbottomheight=await win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR)
      AppStorage.setOrCreate('topheight',windowtopheight.topRect.height) //px2vp被废弃需要在组件内用getuicontext
      AppStorage.setOrCreate('bottomheight',windowbottomheight.bottomRect.height) //px2vp被废弃需要在组件内用getuicontext

    }
  }
  async disable(){
    const context=AppStorage.get<Context>('context')
    if(context){
      const win = await window.getLastWindow(context)
      win.setWindowLayoutFullScreen(false)
      const windowtopheight=await win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
      const windowbottomheight=await win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR)
      AppStorage.setOrCreate('topheight',0)
      AppStorage.setOrCreate('bottomheight',0)

    }

  }
}
export const fullscreen=new FullScreen()