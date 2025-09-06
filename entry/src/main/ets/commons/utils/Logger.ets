import {hilog} from '@kit.PerformanceAnalysisKit'

class Logger{
  private  domain :number//十六进制格式的输出业务格式
  private  tag:string//制定的标识
  private format:string='%%{public}s,%{pubic}s'//格式化的方式

  constructor(domain: number, tag: string, format: string) {
    this.domain = domain
    this.tag = tag
    this.format = format
  }
  debug():void{

  }
}