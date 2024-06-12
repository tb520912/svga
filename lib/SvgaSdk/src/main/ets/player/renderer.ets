import { Player } from '.'
import SVGA from '../source/svga'
import { FrameEntity } from '../parser/frameEntity'
import { BezierPath } from '../parser/bezierPath'
import { EllipsePath } from '../parser/ellipsePath'
import { RectPath } from '../parser/rectPath'
import fs from '@ohos.file.fs'
import { buffer, util } from '@kit.ArkTS'
import { image } from '@kit.ImageKit'
import AVPlayerClass from '../audio'

const validMethods = 'MLHVCSQAZmlhvcsqaz'
const base = "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFYAAABKCAMAAAAWnFMlAAAABGdBTUEAALGPC/xhBQAAAAFzUkdCAK7OHOkAAAMAUExURUdwTPCHM/evfZ8/K++CLfGLOL1sVumBVe6BLfSQPPKOOvCFMu+EMPGRPP/ElP+ZOaA+K//Ek//Fk/CDLqA/K/GINfKLNvCFL/qUOP/Ek6A+K//FlPONOf/GkaA/K7pTL//FlP/ElP/Gk7NQLbJPLb9cLu2FM/KPOf+XNvGOO/+XNu+EMP/ElPCJN/+YNv+4ev/Ek//Bkv+YNv+XN7FPLv/ElNhzMv+bN/GMOaA+KsFfMKA+K69NLaE+K/a3iv+YN/GIM/+YN89rMP+YNtCDYeGddK1MKdhyMu+CLcFfMKA+K588K6A/LKA+LM5rMcpmMLhVLqtILP+YN9BrMv/Ek7dTL//Fk//ElPKOPJ8+K/KSPKE/Let+LN+id/CFMeV9NKdEJ++BLf+YN14WDqA/LP/FlP/EKJY1JPWJMeN9NP6XN/mSNv+ZOP/EkvyUNaxLLadFLNVxMt55M9p1M9hzMqlILOF8M/+xa/uTNe+INeeCNKNCLfiRNtx2M/7AKP+nVctnMf6WNvOMNvyVN/CKNe2HNc9rMeV/NP/BjP+fRL1bLrlWLvaRNfKLNbtZLmAXDu2rKLxjK/+qXf/Aif+vZf+4ecFeMKRBJopFFeeBNOuFNcyNH3ErEf7DKNFsMfGDLf+kUbJPLpo5JeqDNP+iTLVTLtNuMul8LP+9hLhULMNgL/+cPv+aPPi7J+ObKueqJMptLqdJNPK1J5xFJKtpGrBRLPa2KNaKZ34wGfiOMqJALMVkL81qMOF3Lv+dNf+wL/+6feGYbv+gSP+tYqA+JWghD8NbKfW3if+1cfm+J9WIKu+zJc+BKvi6jMBgLtmPKtyeIrJXK8x6K/CvKbt5HYUxHfGGL/WPNv6lMuydLeOTLcByJv+zbqNhGf+kM8BZKOaLMPCYMLhhR9pvKvy8Ka1KJqlnGsx+XdV9LsBsT6NMJZZTF24gFdGSId6WKbFMJvCxhL18HemlKemmfPzBkcSEHr9qK3QkGL1oTJdBI8d1K4I9FKtQKZM9It1yK8FkLtRl8mYAAACYdFJOUwDCCnXzhAcC/ShazdwgqWXoecjtOa+T4Uc21WNlJuoXSlpw7/TWuFirX6PnkZ3pUNshlYDwhjUufWafy7ZjwHO8tFHupPzurfervDqy+ORr4PqLk2vn6uo7mDuY/Q3Vpff////////////////////////////////////////////////////////////////////////+ksoSTwAACIxJREFUWMOtmXdUG8cWhxcDNuAWx3GJ49hx3BKn9957nF5e/UsraYmEsLSSUAEVQAhhQEICQgdjirsNptkPeInj3ntMeu+997zzpq12drVgcLjHh53Z+d1vZ+/M3BmtGQbZ3PiH52g0j856JH7pOGbENm5p/COzHtVo5jwcP5e+fe993+z5fssvWRpgc/65dGTQpf+eA/2yftny/Z5v7rs32q2xt2uxHdqyGQo0s24aO1zm2JtmIZfNWw4RyO2C76XaqP1AwGfFDws8Nv4sAv1BZFyK265K11J26FMNBt922iCPuw1DNZ8eognaq1DrFK3UXsId1txyDvK9fubka65esvDa+QuunT//2UVXXzN55vXoiefcgnWbX5IBpiDs2bK72j3vYb3m1psXLsgystCKyC0drBizFiy8+VZy5709cv+zUXdADNLXSO6nfwzkrSEj9nNB0koCcYOyCxeNoVbw92NJCLVrYBW+zPngamdLZYHID7JmuoMClgdlHSmb2WC+LAClrB38PR9gL0BYtpxqLCs1UC/eQGPzQbkBF4vgfUNpGeVYziLsBQA7D1yfB4JtQlsBhrJssBe5V6BwEmw2KFegUm8QqwylBYLnNlB9HlznAewzMJgAtDxda28B5Tc2sIJlI/9WGtsHyq3RB2Db8AZwa7Fr05eDh8DYPgOwF8LneEHrjjIDW1DQyIqWZoL+GTR2HShnwIIpjRI2FhSwhrIdoOSFtAsFLIyCARDt61naePS2NBZGpFcYO9HWg9HxGkgMEPY8FJbtJFASMetDHXNQQ1bIsg70Cj6pkjhuR7DzyJBptXtZRVsFEWlSbBq8rlLW70WweWSCaVG4FcwBo+uTYn0wsg5F+XK8NuAEOxdCvdvXD9pdE714AZY1DdrZ9du9EHwuWWVlBnYQcxgRiS2ksIUao2MwvaGMrLIxaCmXezco6/IqnPCyjppgzoo8Ze0GbzlKLmNgrvmbsO6GsmwKO7jhDPB3MTGuMQyN5anFO7gZ1kQTIzMJFhuHprI2gl01tKwRsiYh7HVklcknSyM95/xUvlUUEIOr7DqEhcusRVFQZo86phFsQGDayxQ700IWGZq425SGdS/cNkqFKkkKJBuWwra9SpNnG562aIZ5lSe3t9y+Q6jgJJtFajvs5V7lBeQl84thriw4zTSAhreg0Gl1hoIryX4/yS5t8fN9haHD/QF9THbQWKg7+kD/4VBhH++XetsnEewUesDy2iPHN53o6QkfiRitNDgfpkNx0eqtxsiRcE/PiU3HI+30qmuZQrBXUB1t39/DCXYiEnJRuTekyQpEa65Q5ERU2LO/neryFQQ7WbhR/MkmJGv7savr5NF6rv54N8Vlg2JfXd3HQfPRk11dP7Yhl02fFAttkwl2Cam/g6G1W9XI6k7Wc78V6ZXGRV/0G1d/sg7rttZi8DukcQnBXo5f8lUPbN33uTpqvx/wHOMVM8Qxz4HfRd3n+6Cn51W8EV2Oz4Q3YOkr6JmeKjVldR1hkyuW6jKFO+poXRXqEfcKbr4BYe/AlRdQy0e0Wl1Sxf3UEItt+ImTPF2t/gg5v4Cb70DYu4gYPrGtRCpX134n32PhfvxdrUxWAgfOQ9rvQifGe0jtRdDypkyuruK6bTFJslveWbX6TeD8Imm/Bwb37mpSewu01MnlJfsOxmwI6w7uk7+Uug44v0Xaq+8G2Ic0/XgSGTzcRnWMHQ2b5FhT+GisbiPnwZlF3695CGCfAEdKF4lCOFZeW2+SbYh5pvraWF2YxMAFtv4nAPZJeLBGadTwwYFY+ZdcxC3FuiPcl7G6Ax+gzgZhXn4S/H5ECS8jF95717MrRt7GHZRti9kHubYY2S7Pu7AtFx3aNHOZxzXiIZZ9rUphKL6SJdnQVwpDW/UaasNHX83jzNMre6OHWDbtdbm8i+PCRinWGOa4LrnudXzcRZ3tXfk08xSrH6jJrCFzvrhTOnV2dXDcxiwpNmsjx3VIo1XSSfKXD6AG9OxTzEWy5f7ZF5J5AKj74UmUz843N68qysgGe/B+wJXMhS8+kyWOi5jH5KmkvfNnoccl33YciZgOV4uHJeMAmO2HTZEjHd9GRT93tstT0WOMycTLUmoO/0fnny9v3fryr8cyuvtsJHfzcAhacR8ctr7ujGO/Qs2fnX/wObJkzJsymKbUptbimDSdF3C73To/fd50FgnLEaP9OiAJ5MWk+eK1TU1NTCqwSic5ujgzgdlsZrfF2pDfYDVXD9AO/eB5Qnmg2owkFrfZZoNeTvLLJ68SEhE2dWdSjsKJOdiss1h1pAbWSz76B01nteiag0pn51M7U0Vs6ocrYjS+3BqdzW3OJL1o1gOmvgK/VabZbdPV5MZk4pxTH2IeiC2y91X/iTbm6sxmi9Uc8A9QP+nSdCzPmsXjR9qAP2C2WsxmXW703jLV+5jWxFTiwtsqzHXkOpupYfDV2HSEbQ24nRU5+Am2Gh81vM3OXPSuDpXqbUyrZO7Hhd0qFdVfPPQW3moOinVdNh+FBc1W3uKU6pcBxG5Mu595YPfXlTsr164G91RifJ1Wng84hj7EOQI8bxXR+hWAsHotgH29+wFmsUq0FejtfWD8q33ssMxXDeYE1j5HgRYzYx6kqs+xLp1N52JHZNhlGYV5EJxwp4nV1f/L9LNnZP7m/64WOdPApvMPCgu6e4a2TEVh/wUPCotUdBjO0E5RjEXoVDMxQTWqljARnxgvThpNatLFwsfCxNHEJoofIRNHrb9JifTHzZRRim9CivSj6cS40aDGTYz5Grt4wl+FTkhR/MqbMv6vQMenDPodOXn6jDNjzpiePPSX6eQb75w6MuTUO29MHtbn+eTZ0+NmDGPOJc2Imz47eYT/R5E8c3biZdPixk+4ZGpC9BlJCVMvmTA+btplibNnJg/+Uf7/2a0skLRPHeYAAAAASUVORK5CYII="

export class Renderer {
  private _owner: Player
  private _prepared: boolean = false
  private _undrawFrame: number | undefined = undefined;
  private _bitmapCache: Record<string, image.PixelMap | AVPlayerClass> | undefined = undefined;
  private _soundsQueue: AVPlayerClass[] = [];
  constructor(owner: Player) {
    this._owner = owner
  }
  /**
   * 渲染
   */
  prepare () {
    this._prepared = false
    this._bitmapCache = undefined
    const videoItem = this._owner.getVideoItem()
    if (videoItem === null || Object.keys(videoItem.images).length === 0) {
      this._bitmapCache = {}
      this._prepared = true
      return;
    }
    if (this._bitmapCache === undefined) {
      this._bitmapCache = {}
      let totalCount = 0
      let loadedCount = 0
      const keys = Object.keys(videoItem.images)
      keys.forEach(key => {
        let src = videoItem.images[key]
        if (src.indexOf("iVBO") === 0 || src.indexOf("/9j/2w") === 0) {
          totalCount++
          this.base64ToPixelMap(src).then(res => {
            if (res) {
              let bitmapKey = key.replace('.matte', '')
              this._bitmapCache![bitmapKey] = res
              loadedCount++
              if (loadedCount === totalCount) {
                this._prepared = true
                if (typeof this._undrawFrame === "number") {
                  this.drawFrame(this._undrawFrame);
                  this._undrawFrame = undefined;
                }
              }

            }
          })
          // 将base64的图片转成ImageBitMap 渲染到离屏canvas上
          // const imageBitMap = new ImageBitmap('data:image/png;base64,' + src)
          // let bitmapKey = key.replace('.matte', '');
          // this._bitmapCache![bitmapKey] = imageBitMap;
        }
        else if (src.indexOf('SUQZ') === 0) {
          // 音频
          totalCount++

        }
      })
      // this._prepared = true

      // setTimeout(() => {
      //   if (typeof this._undrawFrame === 'number') {
      //     this._owner._animator?.start()
      //     this.drawFrame(this._undrawFrame)
      //     this._undrawFrame = 0
      //   }
      // }, 2000)
    }
  }
  /**
   * 清空画布
   */
  clear () {
    this._owner.getContext().clearRect(0,0,this._owner.getContext().width, this._owner.getContext().height)
  }
  clearAudios() {
    this._soundsQueue.forEach(it => {
      it.stop()
    })
    this._soundsQueue = []
  }
  drawFrame (frame: number) {
  if (this._prepared) {
    this.clear()
    const ctx = this._owner.getContext()
    let matteSprites = new Map<string, SVGA.com.opensource.svga.ISpriteEntity>();
    let isMatteing = false
    let sprites = this._owner.getVideoItem()?.sprites
    if (sprites && sprites.length > 0) {
      sprites.forEach((sprite, index) => {
        if (sprites![0].imageKey?.indexOf('.matte') == -1) {
          this.drawSprite(sprite, ctx, frame)
          return;
        }
        if (sprite.imageKey?.indexOf('.matte') != -1) {
          matteSprites.set(sprite.imageKey || '', sprite)
          return;
        }
        let lastSprite = sprites![index - 1];
        if (isMatteing && ((sprite.matteKey == null || sprite.matteKey?.length == 0) || sprite.matteKey != lastSprite.matteKey)) {
          isMatteing = false
          let matteSprite = matteSprites.get(sprite.matteKey || '')
          ctx.globalCompositeOperation = "destination-in"
          this.drawSprite(matteSprite!, ctx, frame)
          ctx.globalCompositeOperation = "source-over";
          ctx.restore()
        }
        if (sprite.matteKey != null && ((lastSprite.matteKey == null || lastSprite.matteKey.length == 0) || lastSprite.matteKey != sprite.matteKey)) {
          isMatteing = true
          ctx.save()
        }
        this.drawSprite(sprite, ctx, frame)
        if (isMatteing && index == sprites!.length - 1) {
          let matteSprite = matteSprites.get(sprite.matteKey || '');
          ctx.globalCompositeOperation = "destination-in";
          this.drawSprite(matteSprite!, ctx, frame);
          ctx.globalCompositeOperation = "source-over";
          ctx.restore();
        }
      })
    }
  } else {
    this._undrawFrame = frame
  }
  }
  drawSprite (sprite: SVGA.com.opensource.svga.ISpriteEntity, ctx: CanvasRenderingContext2D, frameIndex: number) {
  if (!sprite.frames || sprite.frames.length === 0) return;
    let frameItem = sprite.frames[this._owner._currentFrame]
    if (!frameItem.alpha || frameItem.alpha < 0.05) {
      return;
    }
    ctx.save()
    if (this._owner._globalTransform) {
      ctx.transform(
        this._owner._globalTransform.a,
        this._owner._globalTransform.b,
        this._owner._globalTransform.c,
        this._owner._globalTransform.d,
        this._owner._globalTransform.tx,
        this._owner._globalTransform.ty,
      )
    }
    ctx.globalAlpha = frameItem.alpha
    ctx.transform(
      frameItem.transform?.a,
      frameItem.transform?.b,
      frameItem.transform?.c,
      frameItem.transform?.d,
      frameItem.transform?.tx,
      frameItem.transform?.ty,
    )
    let bitMapKey = sprite.imageKey?.replace('.matte', '');
    if (!bitMapKey) return;
    let src: string | image.PixelMap = (this._owner._dynamicImage[bitMapKey]) || (this._bitmapCache ? this._bitmapCache[bitMapKey] : '' ) || (this._owner.getVideoItem()!.images![bitMapKey])
    if (typeof src === 'object') {
      if ((frameItem as FrameEntity).maskPath !== undefined && (frameItem as FrameEntity).maskPath !== null) {
        (frameItem as FrameEntity).maskPath!._styles = {}
        this.drawBezier(ctx, (frameItem as FrameEntity).maskPath!)
        ctx.clip()
      }
      if (this._owner._dynamicImageTransform[sprite.imageKey!] !== undefined) {
        ctx.save()
        const concatTransform = this._owner._dynamicImageTransform[sprite.imageKey!]
        ctx.transform(concatTransform.a, concatTransform.b, concatTransform.c, concatTransform.d, concatTransform.tx, concatTransform.ty)
      }
      ctx.drawImage(src, 0, 0)
      if (this._owner._dynamicImageTransform[sprite.imageKey!] !== undefined) {
        ctx.restore()
      }
    }
    frameItem.shapes && frameItem.shapes.forEach(shape => {
      if (shape.type === SVGA.com.opensource.svga.ShapeEntity.ShapeType.SHAPE && shape.shape && shape.shape.d) {
        this.drawBezier(ctx, new BezierPath(shape.shape.d, shape.transform || undefined, shape.styles || undefined))
      }
      if (shape.type === SVGA.com.opensource.svga.ShapeEntity.ShapeType.ELLIPSE && shape.ellipse) {
          this.drawEllipse(ctx, new EllipsePath(parseFloat((shape.ellipse.x || 0).toString()), parseFloat((shape.ellipse.y || 0).toString()), parseFloat((shape.ellipse.radiusX || 0).toString()), parseFloat((shape.ellipse.radiusY || 0).toString()), shape.transform || undefined, shape.styles || undefined))
      }
      if (shape.type === SVGA.com.opensource.svga.ShapeEntity.ShapeType.RECT && shape.rect) {
          this.drawRect(ctx, new RectPath(parseFloat((shape.rect.x || 0).toString()), parseFloat((shape.rect.y || 0).toString()), parseFloat((shape.rect.width || 0).toString()), parseFloat((shape.rect.height || 0).toString()), parseFloat((shape.rect.cornerRadius || 0).toString()), shape.transform || undefined, shape.styles || undefined))
      }
    })
    let dynamicText = this._owner._dynamicText[sprite.imageKey!]
    if (dynamicText !== undefined) {
      ctx.textBaseline = 'middle'
      ctx.font = dynamicText.style || '16px'
      let textWidth = ctx.measureText(dynamicText.text).width
      ctx.fillStyle = dynamicText.color || '#000'
      let offsetX = (dynamicText.offset !== undefined && dynamicText.offset.x !== undefined) ? isNaN(parseFloat(dynamicText.offset.x.toString())) ? 0 : parseFloat(dynamicText.offset.x.toString()) : 0;
      let offsetY = (dynamicText.offset !== undefined && dynamicText.offset.y !== undefined) ? isNaN(parseFloat(dynamicText.offset.y.toString())) ? 0 : parseFloat(dynamicText.offset.y.toString()) : 0;
      ctx.fillText(dynamicText.text, ((frameItem.layout?.width || 0) - textWidth) / 2 + offsetX, (frameItem.layout?.height || 0) / 2 + offsetY);
    }
    ctx.restore()
  }
  playAudio(frame: number) {
    if (this._owner._forwardAnimating && this._owner.getVideoItem()?.audios instanceof Array) {
      this._owner.getVideoItem()?.audios.forEach(audio => {
        if (!this._bitmapCache || Object.keys(this._bitmapCache).length === 0) return;
        if (audio.startFrame === frame && this._bitmapCache[audio.audioKey || ''] !== undefined && this._bitmapCache[audio.audioKey || ''] instanceof AVPlayerClass) {
          const item = {
            playID: this._bitmapCache[audio.audioKey].play(),
            player: this._bitmapCache[audio.audioKey],
            endFrame: audio.endFrame,
          }
          item.player.seek(audio.startTime / 1000, item.playID)
          this._soundsQueue.push(item)
        }
      })
      let deleted = false
      this._soundsQueue.forEach(it => {
        if (frame >= it.endFrame) {
          deleted = true
          it.player.stop(it.playID)
        }
      })
      if (deleted) {
        this._soundsQueue = this._soundsQueue.filter(it => frame < it.endFrame)
      }
    }
  }
  resetShapeStyles(ctx: CanvasRenderingContext2D, obj: BezierPath | EllipsePath | RectPath) {
    const styles = obj._styles;
    if (styles === undefined) { return; }
    if (styles && styles.stroke) {
      ctx.strokeStyle = `rgba(${parseInt((styles.stroke[0] * 255).toString())}, ${parseInt((styles.stroke[1] * 255).toString())}, ${parseInt((styles.stroke[2] * 255).toString())}, ${styles.stroke[3]})`;
    }
    else {
      ctx.strokeStyle = "transparent"
    }
    if (styles) {
      ctx.lineWidth = styles.strokeWidth ? styles.strokeWidth : 0

      switch (styles.lineCap) {
        case SVGA.com.opensource.svga.ShapeEntity.ShapeStyle.LineCap.LineCap_BUTT:
          ctx.lineCap = 'butt'
        break;
        case SVGA.com.opensource.svga.ShapeEntity.ShapeStyle.LineCap.LineCap_ROUND:
          ctx.lineCap = 'round'
        break;
        case SVGA.com.opensource.svga.ShapeEntity.ShapeStyle.LineCap.LineCap_SQUARE:
          ctx.lineCap = 'square'
        break;
          default :
            break;
      }
      switch (styles.lineJoin) {
        case SVGA.com.opensource.svga.ShapeEntity.ShapeStyle.LineJoin.LineJoin_MITER:
          ctx.lineJoin = 'miter'
        break;
        case SVGA.com.opensource.svga.ShapeEntity.ShapeStyle.LineJoin.LineJoin_ROUND:
          ctx.lineJoin = 'round'
        break;
        case SVGA.com.opensource.svga.ShapeEntity.ShapeStyle.LineJoin.LineJoin_BEVEL:
          ctx.lineJoin = 'bevel'
        break;
        default:
        break;
      }
      ctx.miterLimit = styles.miterLimit || 0;
    }
    if (styles && styles.fill) {
      ctx.fillStyle = `rgba(${parseInt((styles.fill[0] * 255).toString())}, ${parseInt((styles.fill[1] * 255).toString())}, ${parseInt((styles.fill[2] * 255).toString())}, ${styles.fill[3]})`
    }
    else {
      ctx.fillStyle = "transparent"
    }
    let lineDash: number[] = []
    if (styles.lineDashI) {
      lineDash.push(styles.lineDashI)
    }
    if (styles.lineDashII) {
      lineDash.push(styles.lineDashII)
    }
    if (styles.lineDashIII) {
      lineDash.push(styles.lineDashIII)
    }
    if (lineDash) {
      ctx.setLineDash(lineDash);
    }
  }

  drawBezier(ctx: CanvasRenderingContext2D, obj: BezierPath) {
    ctx.save();
    this.resetShapeStyles(ctx, obj);
    if (obj._transform !== undefined && obj._transform !== null) {
      ctx.transform(obj._transform.a, obj._transform.b, obj._transform.c, obj._transform.d, obj._transform.tx, obj._transform.ty);
    }
    let currentPoint: CurrentPoint = { x: 0, y: 0, x1: 0, y1: 0, x2: 0, y2: 0 }
    ctx.beginPath();
    const d = obj._d.replace(/([a-zA-Z])/g, '|||$1 ').replace(/,/g, ' ');
    d.split('|||').forEach(segment => {
      if (segment.length == 0) { return; }
      const firstLetter = segment.substring(0, 1);
      if (validMethods.indexOf(firstLetter) >= 0) {
        const args = segment.substring(1).trim().split(" ");
        this.drawBezierElement(ctx, currentPoint, firstLetter, args);
      }
    })
    if (obj._styles && obj._styles.fill) {
      ctx.fill();
    }
    if (obj._styles && obj._styles.stroke) {
      ctx.stroke();
    }
    ctx.restore();
  }

  drawBezierElement(ctx: CanvasRenderingContext2D, currentPoint: CurrentPoint, method: string, args: string[]) {
    switch (method) {
      case 'M':
        currentPoint.x = Number(args[0]);
        currentPoint.y = Number(args[1]);
        ctx.moveTo(currentPoint.x, currentPoint.y);
        break;
      case 'm':
        currentPoint.x += Number(args[0]);
        currentPoint.y += Number(args[1]);
        ctx.moveTo(currentPoint.x, currentPoint.y);
        break;
      case 'L':
        currentPoint.x = Number(args[0]);
        currentPoint.y = Number(args[1]);
        ctx.lineTo(currentPoint.x, currentPoint.y);
        break;
      case 'l':
        currentPoint.x += Number(args[0]);
        currentPoint.y += Number(args[1]);
        ctx.lineTo(currentPoint.x, currentPoint.y);
        break;
      case 'H':
        currentPoint.x = Number(args[0]);
        ctx.lineTo(currentPoint.x, currentPoint.y);
        break;
      case 'h':
        currentPoint.x += Number(args[0]);
        ctx.lineTo(currentPoint.x, currentPoint.y);
        break;
      case 'V':
        currentPoint.y = Number(args[0]);
        ctx.lineTo(currentPoint.x, currentPoint.y);
        break;
      case 'v':
        currentPoint.y += Number(args[0]);
        ctx.lineTo(currentPoint.x, currentPoint.y);
        break;
      case 'C':
        currentPoint.x1 = Number(args[0]);
        currentPoint.y1 = Number(args[1]);
        currentPoint.x2 = Number(args[2]);
        currentPoint.y2 = Number(args[3]);
        currentPoint.x = Number(args[4]);
        currentPoint.y = Number(args[5]);
        ctx.bezierCurveTo(currentPoint.x1, currentPoint.y1, currentPoint.x2, currentPoint.y2, currentPoint.x, currentPoint.y);
        break;
      case 'c':
        currentPoint.x1 = currentPoint.x + Number(args[0]);
        currentPoint.y1 = currentPoint.y + Number(args[1]);
        currentPoint.x2 = currentPoint.x + Number(args[2]);
        currentPoint.y2 = currentPoint.y + Number(args[3]);
        currentPoint.x += Number(args[4]);
        currentPoint.y += Number(args[5]);
        ctx.bezierCurveTo(currentPoint.x1, currentPoint.y1, currentPoint.x2, currentPoint.y2, currentPoint.x, currentPoint.y);
        break;
      case 'S':
        if (currentPoint.x1 && currentPoint.y1 && currentPoint.x2 && currentPoint.y2) {
          currentPoint.x1 = currentPoint.x - currentPoint.x2 + currentPoint.x;
          currentPoint.y1 = currentPoint.y - currentPoint.y2 + currentPoint.y;
          currentPoint.x2 = Number(args[0]);
          currentPoint.y2 = Number(args[1]);
          currentPoint.x = Number(args[2]);
          currentPoint.y = Number(args[3]);
          ctx.bezierCurveTo(currentPoint.x1, currentPoint.y1, currentPoint.x2, currentPoint.y2, currentPoint.x, currentPoint.y);
        } else {
          currentPoint.x1 = Number(args[0]);
          currentPoint.y1 = Number(args[1]);
          currentPoint.x = Number(args[2]);
          currentPoint.y = Number(args[3]);
          ctx.quadraticCurveTo(currentPoint.x1, currentPoint.y1, currentPoint.x, currentPoint.y);
        }
        break;
      case 's':
        if (currentPoint.x1 && currentPoint.y1 && currentPoint.x2 && currentPoint.y2) {
          currentPoint.x1 = currentPoint.x - currentPoint.x2 + currentPoint.x;
          currentPoint.y1 = currentPoint.y - currentPoint.y2 + currentPoint.y;
          currentPoint.x2 = currentPoint.x + Number(args[0]);
          currentPoint.y2 = currentPoint.y + Number(args[1]);
          currentPoint.x += Number(args[2]);
          currentPoint.y += Number(args[3]);
          ctx.bezierCurveTo(currentPoint.x1, currentPoint.y1, currentPoint.x2, currentPoint.y2, currentPoint.x, currentPoint.y);
        } else {
          currentPoint.x1 = currentPoint.x + Number(args[0]);
          currentPoint.y1 = currentPoint.y + Number(args[1]);
          currentPoint.x += Number(args[2]);
          currentPoint.y += Number(args[3]);
          ctx.quadraticCurveTo(currentPoint.x1, currentPoint.y1, currentPoint.x, currentPoint.y);
        }
        break;
      case 'Q':
        currentPoint.x1 = Number(args[0]);
        currentPoint.y1 = Number(args[1]);
        currentPoint.x = Number(args[2]);
        currentPoint.y = Number(args[3]);
        ctx.quadraticCurveTo(currentPoint.x1, currentPoint.y1, currentPoint.x, currentPoint.y);
        break;
      case 'q':
        currentPoint.x1 = currentPoint.x + Number(args[0]);
        currentPoint.y1 = currentPoint.y + Number(args[1]);
        currentPoint.x += Number(args[2]);
        currentPoint.y += Number(args[3]);
        ctx.quadraticCurveTo(currentPoint.x1, currentPoint.y1, currentPoint.x, currentPoint.y);
        break;
      case 'A':
        break;
      case 'a':
        break;
      case 'Z':
      case 'z':
        ctx.closePath();
        break;
      default:
        break;
    }
  }

  drawEllipse(ctx: CanvasRenderingContext2D, obj: EllipsePath) {
    ctx.save();
    this.resetShapeStyles(ctx, obj);
    if (obj._transform !== undefined && obj._transform !== null) {
      ctx.transform(obj._transform.a, obj._transform.b, obj._transform.c, obj._transform.d, obj._transform.tx, obj._transform.ty);
    }
    let x = obj._x - obj._radiusX;
    let y = obj._y - obj._radiusY;
    let w = obj._radiusX * 2;
    let h = obj._radiusY * 2;
    let kappa = .5522848,
      ox = (w / 2) * kappa,
      oy = (h / 2) * kappa,
      xe = x + w,
      ye = y + h,
      xm = x + w / 2,
      ym = y + h / 2;

    ctx.beginPath();
    ctx.moveTo(x, ym);
    ctx.bezierCurveTo(x, ym - oy, xm - ox, y, xm, y);
    ctx.bezierCurveTo(xm + ox, y, xe, ym - oy, xe, ym);
    ctx.bezierCurveTo(xe, ym + oy, xm + ox, ye, xm, ye);
    ctx.bezierCurveTo(xm - ox, ye, x, ym + oy, x, ym);
    if (obj._styles && obj._styles.fill) {
      ctx.fill();
    }
    if (obj._styles && obj._styles.stroke) {
      ctx.stroke();
    }
    ctx.restore();
  }

  drawRect(ctx: CanvasRenderingContext2D, obj: RectPath) {
    ctx.save();
    this.resetShapeStyles(ctx, obj);
    if (obj._transform !== undefined && obj._transform !== null) {
      ctx.transform(obj._transform.a, obj._transform.b, obj._transform.c, obj._transform.d, obj._transform.tx, obj._transform.ty);
    }

    let x = obj._x;
    let y = obj._y;
    let width = obj._width;
    let height = obj._height;
    let radius = obj._cornerRadius;

    if (width < 2 * radius) { radius = width / 2; }
    if (height < 2 * radius) { radius = height / 2; }

    ctx.beginPath();
    ctx.moveTo(x + radius, y);
    ctx.arcTo(x + width, y, x + width, y + height, radius);
    ctx.arcTo(x + width, y + height, x, y + height, radius);
    ctx.arcTo(x, y + height, x, y, radius);
    ctx.arcTo(x, y, x + width, y, radius);
    ctx.closePath();

    if (obj._styles && obj._styles.fill) {
      ctx.fill();
    }
    if (obj._styles && obj._styles.stroke) {
      ctx.stroke();
    }
    ctx.restore();
  }
  async base64ToPixelMap (src: string) {
    try {

      const base = new util.Base64Helper()
      let buf = base.decodeSync(src)
      buffer.transcode(buf.buffer, Uint8Array, 'base64url')
      // 将沙箱图片转成pixelMap
      // 1, 创建imagesource
      const img = image.createImageSource(buf.buffer)
      const info = await img.getImageInfo()
      // let opt : image.ImagePropertyOptions = { index: 0, defaultValue: '9999'}
      // const imgInfoH = await img.getImageProperty(image.PropertyKey.IMAGE_LENGTH, opt)
      // const imgInfoW = await img.getImageProperty(image.PropertyKey.IMAGE_WIDTH, opt)
      let pixel: image.PixelMap | null = null
      if (img) {
        pixel = await img.createPixelMap({ editable: false, desiredSize: {
          width: vp2px(info.size.width),
          height: vp2px(info.size.height)
        } })
      }
      return pixel

    } catch (e) {
      AlertDialog.show({
        message: '错误' + JSON.stringify(e)
      })
      return null
    }

  }

}
export interface CurrentPoint {
  x: number
  y: number,
  x1: number,
  y1: number
  x2: number
  y2: number
}