import { buffer, util } from '@kit.ArkTS'
import fs from "@ohos.file.fs"
import { Parser, Player } from 'svgasdk'
import { BusinessError } from '@kit.BasicServicesKit'

@Entry
@Component
struct TestPage {
  // 图 https://medtion-image.medtion.com/uploads/1/image/public/202305/20230518171412_mvio1mbygg.svga
  // MP3 https://medtion-image.medtion.com/uploads/1/image/public/202406/20240613103836_6whqfw7d4l.svga
  context: CanvasRenderingContext2D = new CanvasRenderingContext2D()
  base = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFYAAABKCAMAAAAWnFMlAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAMAUExURUdwTPCHM/evfZ8/K++CLfGLOL1sVumBVe6BLfSQPPKOOvCFMu+EMPGRPP/ElP+ZOaA+K//Ek//Fk/CDLqA/K/GINfKLNvCFL/qUOP/Ek6A+K//FlPONOf/GkaA/K7pTL//FlP/ElP/Gk7NQLbJPLb9cLu2FM/KPOf+XNvGOO/+XNu+EMP/ElPCJN/+YNv+4ev/Ek//Bkv+YNv+XN7FPLv/ElNhzMv+bN/GMOaA+KsFfMKA+K69NLaE+K/a3iv+YN/GIM/+YN89rMP+YNtCDYeGddK1MKdhyMu+CLcFfMKA+K588K6A/LKA+LM5rMcpmMLhVLqtILP+YN9BrMv/Ek7dTL//Fk//ElPKOPJ8+K/KSPKE/Let+LN+id/CFMeV9NKdEJ++BLf+YN14WDqA/LP/FlP/EKJY1JPWJMeN9NP6XN/mSNv+ZOP/EkvyUNaxLLadFLNVxMt55M9p1M9hzMqlILOF8M/+xa/uTNe+INeeCNKNCLfiRNtx2M/7AKP+nVctnMf6WNvOMNvyVN/CKNe2HNc9rMeV/NP/BjP+fRL1bLrlWLvaRNfKLNbtZLmAXDu2rKLxjK/+qXf/Aif+vZf+4ecFeMKRBJopFFeeBNOuFNcyNH3ErEf7DKNFsMfGDLf+kUbJPLpo5JeqDNP+iTLVTLtNuMul8LP+9hLhULMNgL/+cPv+aPPi7J+ObKueqJMptLqdJNPK1J5xFJKtpGrBRLPa2KNaKZ34wGfiOMqJALMVkL81qMOF3Lv+dNf+wL/+6feGYbv+gSP+tYqA+JWghD8NbKfW3if+1cfm+J9WIKu+zJc+BKvi6jMBgLtmPKtyeIrJXK8x6K/CvKbt5HYUxHfGGL/WPNv6lMuydLeOTLcByJv+zbqNhGf+kM8BZKOaLMPCYMLhhR9pvKvy8Ka1KJqlnGsx+XdV9LsBsT6NMJZZTF24gFdGSId6WKbFMJvCxhL18HemlKemmfPzBkcSEHr9qK3QkGL1oTJdBI8d1K4I9FKtQKZM9It1yK8FkLtRl8mYAAACYdFJOUwDCCnXzhAcC/ShazdwgqWXoecjtOa+T4Uc21WNlJuoXSlpw7/TWuFirX6PnkZ3pUNshlYDwhjUufWafy7ZjwHO8tFHupPzurfervDqy+ORr4PqLk2vn6uo7mDuY/Q3Vpff////////////////////////////////////////////////////////////////////////+ksoSTwAACIxJREFUWMOtmXdUG8cWhxcDNuAWx3GJ49hx3BKn9957nF5e/UsraYmEsLSSUAEVQAhhQEICQgdjirsNptkPeInj3ntMeu+997zzpq12drVgcLjHh53Z+d1vZ+/M3BmtGQbZ3PiH52g0j856JH7pOGbENm5p/COzHtVo5jwcP5e+fe993+z5fssvWRpgc/65dGTQpf+eA/2yftny/Z5v7rs32q2xt2uxHdqyGQo0s24aO1zm2JtmIZfNWw4RyO2C76XaqP1AwGfFDws8Nv4sAv1BZFyK265K11J26FMNBt922iCPuw1DNZ8eognaq1DrFK3UXsId1txyDvK9fubka65esvDa+QuunT//2UVXXzN55vXoiefcgnWbX5IBpiDs2bK72j3vYb3m1psXLsgystCKyC0drBizFiy8+VZy5709cv+zUXdADNLXSO6nfwzkrSEj9nNB0koCcYOyCxeNoVbw92NJCLVrYBW+zPngamdLZYHID7JmuoMClgdlHSmb2WC+LAClrB38PR9gL0BYtpxqLCs1UC/eQGPzQbkBF4vgfUNpGeVYziLsBQA7D1yfB4JtQlsBhrJssBe5V6BwEmw2KFegUm8QqwylBYLnNlB9HlznAewzMJgAtDxda28B5Tc2sIJlI/9WGtsHyq3RB2Db8AZwa7Fr05eDh8DYPgOwF8LneEHrjjIDW1DQyIqWZoL+GTR2HShnwIIpjRI2FhSwhrIdoOSFtAsFLIyCARDt61naePS2NBZGpFcYO9HWg9HxGkgMEPY8FJbtJFASMetDHXNQQ1bIsg70Cj6pkjhuR7DzyJBptXtZRVsFEWlSbBq8rlLW70WweWSCaVG4FcwBo+uTYn0wsg5F+XK8NuAEOxdCvdvXD9pdE714AZY1DdrZ9du9EHwuWWVlBnYQcxgRiS2ksIUao2MwvaGMrLIxaCmXezco6/IqnPCyjppgzoo8Ze0GbzlKLmNgrvmbsO6GsmwKO7jhDPB3MTGuMQyN5anFO7gZ1kQTIzMJFhuHprI2gl01tKwRsiYh7HVklcknSyM95/xUvlUUEIOr7DqEhcusRVFQZo86phFsQGDayxQ700IWGZq425SGdS/cNkqFKkkKJBuWwra9SpNnG562aIZ5lSe3t9y+Q6jgJJtFajvs5V7lBeQl84thriw4zTSAhreg0Gl1hoIryX4/yS5t8fN9haHD/QF9THbQWKg7+kD/4VBhH++XetsnEewUesDy2iPHN53o6QkfiRitNDgfpkNx0eqtxsiRcE/PiU3HI+30qmuZQrBXUB1t39/DCXYiEnJRuTekyQpEa65Q5ERU2LO/neryFQQ7WbhR/MkmJGv7savr5NF6rv54N8Vlg2JfXd3HQfPRk11dP7Yhl02fFAttkwl2Cam/g6G1W9XI6k7Wc78V6ZXGRV/0G1d/sg7rttZi8DukcQnBXo5f8lUPbN33uTpqvx/wHOMVM8Qxz4HfRd3n+6Cn51W8EV2Oz4Q3YOkr6JmeKjVldR1hkyuW6jKFO+poXRXqEfcKbr4BYe/AlRdQy0e0Wl1Sxf3UEItt+ImTPF2t/gg5v4Cb70DYu4gYPrGtRCpX134n32PhfvxdrUxWAgfOQ9rvQifGe0jtRdDypkyuruK6bTFJslveWbX6TeD8Imm/Bwb37mpSewu01MnlJfsOxmwI6w7uk7+Uug44v0Xaq+8G2Ic0/XgSGTzcRnWMHQ2b5FhT+GisbiPnwZlF3695CGCfAEdKF4lCOFZeW2+SbYh5pvraWF2YxMAFtv4nAPZJeLBGadTwwYFY+ZdcxC3FuiPcl7G6Ax+gzgZhXn4S/H5ECS8jF95717MrRt7GHZRti9kHubYY2S7Pu7AtFx3aNHOZxzXiIZZ9rUphKL6SJdnQVwpDW/UaasNHX83jzNMre6OHWDbtdbm8i+PCRinWGOa4LrnudXzcRZ3tXfk08xSrH6jJrCFzvrhTOnV2dXDcxiwpNmsjx3VIo1XSSfKXD6AG9OxTzEWy5f7ZF5J5AKj74UmUz843N68qysgGe/B+wJXMhS8+kyWOi5jH5KmkvfNnoccl33YciZgOV4uHJeMAmO2HTZEjHd9GRT93tstT0WOMycTLUmoO/0fnny9v3fryr8cyuvtsJHfzcAhacR8ctr7ujGO/Qs2fnX/wObJkzJsymKbUptbimDSdF3C73To/fd50FgnLEaP9OiAJ5MWk+eK1TU1NTCqwSic5ujgzgdlsZrfF2pDfYDVXD9AO/eB5Qnmg2owkFrfZZoNeTvLLJ68SEhE2dWdSjsKJOdiss1h1pAbWSz76B01nteiag0pn51M7U0Vs6ocrYjS+3BqdzW3OJL1o1gOmvgK/VabZbdPV5MZk4pxTH2IeiC2y91X/iTbm6sxmi9Uc8A9QP+nSdCzPmsXjR9qAP2C2WsxmXW703jLV+5jWxFTiwtsqzHXkOpupYfDV2HSEbQ24nRU5+Am2Gh81vM3OXPSuDpXqbUyrZO7Hhd0qFdVfPPQW3moOinVdNh+FBc1W3uKU6pcBxG5Mu595YPfXlTsr164G91RifJ1Wng84hj7EOQI8bxXR+hWAsHotgH29+wFmsUq0FejtfWD8q33ssMxXDeYE1j5HgRYzYx6kqs+xLp1N52JHZNhlGYV5EJxwp4nV1f/L9LNnZP7m/64WOdPApvMPCgu6e4a2TEVh/wUPCotUdBjO0E5RjEXoVDMxQTWqljARnxgvThpNatLFwsfCxNHEJoofIRNHrb9JifTHzZRRim9CivSj6cS40aDGTYz5Grt4wl+FTkhR/MqbMv6vQMenDPodOXn6jDNjzpiePPSX6eQb75w6MuTUO29MHtbn+eTZ0+NmDGPOJc2Imz47eYT/R5E8c3biZdPixk+4ZGpC9BlJCVMvmTA+btplibNnJg/+Uf7/2a0skLRPHeYAAAAASUVORK5CYII="
  src = "                       iVBORw0KGgoAAAANSUhEUgAAAFYAAABKCAMAAAAWnFMlAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAMAUExURUdwTPCHM/evfZ8/K++CLfGLOL1sVumBVe6BLfSQPPKOOvCFMu+EMPGRPP/ElP+ZOaA+K//Ek//Fk/CDLqA/K/GINfKLNvCFL/qUOP/Ek6A+K//FlPONOf/GkaA/K7pTL//FlP/ElP/Gk7NQLbJPLb9cLu2FM/KPOf+XNvGOO/+XNu+EMP/ElPCJN/+YNv+4ev/Ek//Bkv+YNv+XN7FPLv/ElNhzMv+bN/GMOaA+KsFfMKA+K69NLaE+K/a3iv+YN/GIM/+YN89rMP+YNtCDYeGddK1MKdhyMu+CLcFfMKA+K588K6A/LKA+LM5rMcpmMLhVLqtILP+YN9BrMv/Ek7dTL//Fk//ElPKOPJ8+K/KSPKE/Let+LN+id/CFMeV9NKdEJ++BLf+YN14WDqA/LP/FlP/EKJY1JPWJMeN9NP6XN/mSNv+ZOP/EkvyUNaxLLadFLNVxMt55M9p1M9hzMqlILOF8M/+xa/uTNe+INeeCNKNCLfiRNtx2M/7AKP+nVctnMf6WNvOMNvyVN/CKNe2HNc9rMeV/NP/BjP+fRL1bLrlWLvaRNfKLNbtZLmAXDu2rKLxjK/+qXf/Aif+vZf+4ecFeMKRBJopFFeeBNOuFNcyNH3ErEf7DKNFsMfGDLf+kUbJPLpo5JeqDNP+iTLVTLtNuMul8LP+9hLhULMNgL/+cPv+aPPi7J+ObKueqJMptLqdJNPK1J5xFJKtpGrBRLPa2KNaKZ34wGfiOMqJALMVkL81qMOF3Lv+dNf+wL/+6feGYbv+gSP+tYqA+JWghD8NbKfW3if+1cfm+J9WIKu+zJc+BKvi6jMBgLtmPKtyeIrJXK8x6K/CvKbt5HYUxHfGGL/WPNv6lMuydLeOTLcByJv+zbqNhGf+kM8BZKOaLMPCYMLhhR9pvKvy8Ka1KJqlnGsx+XdV9LsBsT6NMJZZTF24gFdGSId6WKbFMJvCxhL18HemlKemmfPzBkcSEHr9qK3QkGL1oTJdBI8d1K4I9FKtQKZM9It1yK8FkLtRl8mYAAACYdFJOUwDCCnXzhAcC/ShazdwgqWXoecjtOa+T4Uc21WNlJuoXSlpw7/TWuFirX6PnkZ3pUNshlYDwhjUufWafy7ZjwHO8tFHupPzurfervDqy+ORr4PqLk2vn6uo7mDuY/Q3Vpff////////////////////////////////////////////////////////////////////////+ksoSTwAACIxJREFUWMOtmXdUG8cWhxcDNuAWx3GJ49hx3BKn9957nF5e/UsraYmEsLSSUAEVQAhhQEICQgdjirsNptkPeInj3ntMeu+997zzpq12drVgcLjHh53Z+d1vZ+/M3BmtGQbZ3PiH52g0j856JH7pOGbENm5p/COzHtVo5jwcP5e+fe993+z5fssvWRpgc/65dGTQpf+eA/2yftny/Z5v7rs32q2xt2uxHdqyGQo0s24aO1zm2JtmIZfNWw4RyO2C76XaqP1AwGfFDws8Nv4sAv1BZFyK265K11J26FMNBt922iCPuw1DNZ8eognaq1DrFK3UXsId1txyDvK9fubka65esvDa+QuunT//2UVXXzN55vXoiefcgnWbX5IBpiDs2bK72j3vYb3m1psXLsgystCKyC0drBizFiy8+VZy5709cv+zUXdADNLXSO6nfwzkrSEj9nNB0koCcYOyCxeNoVbw92NJCLVrYBW+zPngamdLZYHID7JmuoMClgdlHSmb2WC+LAClrB38PR9gL0BYtpxqLCs1UC/eQGPzQbkBF4vgfUNpGeVYziLsBQA7D1yfB4JtQlsBhrJssBe5V6BwEmw2KFegUm8QqwylBYLnNlB9HlznAewzMJgAtDxda28B5Tc2sIJlI/9WGtsHyq3RB2Db8AZwa7Fr05eDh8DYPgOwF8LneEHrjjIDW1DQyIqWZoL+GTR2HShnwIIpjRI2FhSwhrIdoOSFtAsFLIyCARDt61naePS2NBZGpFcYO9HWg9HxGkgMEPY8FJbtJFASMetDHXNQQ1bIsg70Cj6pkjhuR7DzyJBptXtZRVsFEWlSbBq8rlLW70WweWSCaVG4FcwBo+uTYn0wsg5F+XK8NuAEOxdCvdvXD9pdE714AZY1DdrZ9du9EHwuWWVlBnYQcxgRiS2ksIUao2MwvaGMrLIxaCmXezco6/IqnPCyjppgzoo8Ze0GbzlKLmNgrvmbsO6GsmwKO7jhDPB3MTGuMQyN5anFO7gZ1kQTIzMJFhuHprI2gl01tKwRsiYh7HVklcknSyM95/xUvlUUEIOr7DqEhcusRVFQZo86phFsQGDayxQ700IWGZq425SGdS/cNkqFKkkKJBuWwra9SpNnG562aIZ5lSe3t9y+Q6jgJJtFajvs5V7lBeQl84thriw4zTSAhreg0Gl1hoIryX4/yS5t8fN9haHD/QF9THbQWKg7+kD/4VBhH++XetsnEewUesDy2iPHN53o6QkfiRitNDgfpkNx0eqtxsiRcE/PiU3HI+30qmuZQrBXUB1t39/DCXYiEnJRuTekyQpEa65Q5ERU2LO/neryFQQ7WbhR/MkmJGv7savr5NF6rv54N8Vlg2JfXd3HQfPRk11dP7Yhl02fFAttkwl2Cam/g6G1W9XI6k7Wc78V6ZXGRV/0G1d/sg7rttZi8DukcQnBXo5f8lUPbN33uTpqvx/wHOMVM8Qxz4HfRd3n+6Cn51W8EV2Oz4Q3YOkr6JmeKjVldR1hkyuW6jKFO+poXRXqEfcKbr4BYe/AlRdQy0e0Wl1Sxf3UEItt+ImTPF2t/gg5v4Cb70DYu4gYPrGtRCpX134n32PhfvxdrUxWAgfOQ9rvQifGe0jtRdDypkyuruK6bTFJslveWbX6TeD8Imm/Bwb37mpSewu01MnlJfsOxmwI6w7uk7+Uug44v0Xaq+8G2Ic0/XgSGTzcRnWMHQ2b5FhT+GisbiPnwZlF3695CGCfAEdKF4lCOFZeW2+SbYh5pvraWF2YxMAFtv4nAPZJeLBGadTwwYFY+ZdcxC3FuiPcl7G6Ax+gzgZhXn4S/H5ECS8jF95717MrRt7GHZRti9kHubYY2S7Pu7AtFx3aNHOZxzXiIZZ9rUphKL6SJdnQVwpDW/UaasNHX83jzNMre6OHWDbtdbm8i+PCRinWGOa4LrnudXzcRZ3tXfk08xSrH6jJrCFzvrhTOnV2dXDcxiwpNmsjx3VIo1XSSfKXD6AG9OxTzEWy5f7ZF5J5AKj74UmUz843N68qysgGe/B+wJXMhS8+kyWOi5jH5KmkvfNnoccl33YciZgOV4uHJeMAmO2HTZEjHd9GRT93tstT0WOMycTLUmoO/0fnny9v3fryr8cyuvtsJHfzcAhacR8ctr7ujGO/Qs2fnX/wObJkzJsymKbUptbimDSdF3C73To/fd50FgnLEaP9OiAJ5MWk+eK1TU1NTCqwSic5ujgzgdlsZrfF2pDfYDVXD9AO/eB5Qnmg2owkFrfZZoNeTvLLJ68SEhE2dWdSjsKJOdiss1h1pAbWSz76B01nteiag0pn51M7U0Vs6ocrYjS+3BqdzW3OJL1o1gOmvgK/VabZbdPV5MZk4pxTH2IeiC2y91X/iTbm6sxmi9Uc8A9QP+nSdCzPmsXjR9qAP2C2WsxmXW703jLV+5jWxFTiwtsqzHXkOpupYfDV2HSEbQ24nRU5+Am2Gh81vM3OXPSuDpXqbUyrZO7Hhd0qFdVfPPQW3moOinVdNh+FBc1W3uKU6pcBxG5Mu595YPfXlTsr164G91RifJ1Wng84hj7EOQI8bxXR+hWAsHotgH29+wFmsUq0FejtfWD8q33ssMxXDeYE1j5HgRYzYx6kqs+xLp1N52JHZNhlGYV5EJxwp4nV1f/L9LNnZP7m/64WOdPApvMPCgu6e4a2TEVh/wUPCotUdBjO0E5RjEXoVDMxQTWqljARnxgvThpNatLFwsfCxNHEJoofIRNHrb9JifTHzZRRim9CivSj6cS40aDGTYz5Grt4wl+FTkhR/MqbMv6vQMenDPodOXn6jDNjzpiePPSX6eQb75w6MuTUO29MHtbn+eTZ0+NmDGPOJc2Imz47eYT/R5E8c3biZdPixk+4ZGpC9BlJCVMvmTA+btplibNnJg/+Uf7/2a0skLRPHeYAAAAASUVORK5CYII="
  build() {
    Column() {
      Canvas(this.context)
        .width(100)
        .aspectRatio(1)
        .backgroundColor('#000')
        .onReady(() => {
          const parser = new Parser()
          const player = new Player(this.context)
          parser.load(
            'https://medtion-image.medtion.com/uploads/1/image/public/202406/20240613103836_6whqfw7d4l.svga',
            (videoItem) => {
              player.setVideoItem(videoItem)
              player.startAnimation(false)
            },
            (err: BusinessError) => {
              AlertDialog.show({
                message: JSON.stringify(err)
              })
            }
          )
        })
      Stack(){
        Text('hello world')
          .fontColor('#000')
        // Canvas(this.context)
        //   .width(300)
        //   .height(300)
        //   .backgroundColor('#000')

      }
      Image(this.base)
        .width('100%')
      Button('渲染图片')
        .onClick(() => {
          AlertDialog.show({
            message: '触发了'
          })
          // let buf = buffer.from(this.base, 'base64')
          // const filePath = getContext(this).cacheDir + '/' + util.generateRandomUUID() + '.png'
          // const file = fs.openSync(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE)
          // fs.writeSync(file.fd, buf.buffer)
          // fs.closeSync(file.fd)
          // AlertDialog.show({
          //   message: filePath
          // })
          let imgbit = new ImageBitmap(this.base)
          this.context.drawImage(imgbit, 0, 0)
        })
    }
    .height('100%')
    .width('100%')
  }
}