import { window } from '@kit.ArkUI';

class StatusBar{
  setDarkbar(){
    this.setbar({
      statusBarContentColor:"#000000",

    })
  }
  setLightbar(){
    this.setbar({

      statusBarContentColor:"#ffffff",


    })
  }
  async setbar(config:window.SystemBarProperties){
    const context= AppStorage.get<Context>('context')
    if (context) {
      const win =await window.getLastWindow(context)
      win.setWindowSystemBarProperties(config)

    }

  }
}
export const statusbar=new StatusBar()