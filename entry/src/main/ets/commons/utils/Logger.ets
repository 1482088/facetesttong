import { hilog } from '@kit.PerformanceAnalysisKit'

class Logger{
  private  domain :number//十六进制格式的输出业务格式
  private  tag:string//制定的标识
  private format:string='%{public}s,%{pubic}s' //格式化的方式

  constructor(domain: number, tag: string) {
    this.domain = domain
    this.tag = tag
  }
  debug(...args:string[]){
    hilog.debug(this.domain,this.tag,this.format,args)
  }
  info(...args:string[]){
    hilog.info(this.domain,this.tag,this.format,args)
  }
  warn(...args:string[]){
    hilog.warn(this.domain,this.tag,this.format,args)
  }
  error(...args:string[]){
    hilog.error(this.domain,this.tag,this.format,args)
  }


}
