import { VideoEntity, VideoSize } from '../parser/videoEntity'
import { Renderer } from './renderer'
import SVGA from '../source/svga'
import { TextMap, TextOffset } from '../model'
import { AnimationOptions } from '@ohos.arkui.drawableDescriptor'
import { Animator, AnimatorOptions, AnimatorResult } from '@kit.ArkUI'
import { ValueAnimator } from '../valueAnimator'

export class Player {
  loops: number = 0
  clearsAfterStop = true;
  fillMode = "Forward";
  private _videoItem: VideoEntity | null = null
  private _context: CanvasRenderingContext2D
  private _offCanvas: OffscreenCanvas | null = null
  private _offContext: OffscreenCanvasRenderingContext2D | null = null
  constructor(canvasRenderer: CanvasRenderingContext2D) {
    this._context = canvasRenderer
    this._offCanvas = new OffscreenCanvas(this._context.width, this._context.height)
    this._offContext = this._offCanvas.getContext('2d', new RenderingContextSettings(true))
    this._init()
  }
  _init () {
    this._renderer = new Renderer(this)
  }
  getContext () {
    return this._context
  }
  getVideoItem () {
    return this._videoItem
  }
  getOffContext () {
    return this._offContext
  }
  _currentFrame: number = 0
  _asChild = false;
  _container = undefined;
  _renderer: Renderer | undefined = undefined;
  _animator: ValueAnimator | null = null;
  _drawingCanvas = undefined;
  _contentMode = "AspectFit"
  _forwardAnimating = false;
  _dynamicImage: Record<string, string> = {};
  _dynamicImageTransform: Record<string, SVGA.com.opensource.svga.Transform> = {};
  _dynamicText: Record<string, TextMap> = {};
  _onFinished: () => void = () => {};
  _onFrame: (frame: number) => void = (frame) => {};
  _onPercentage: (frame: number) => void = (frame) => {};
  _globalTransform: SVGA.com.opensource.svga.ITransform | undefined = undefined

  setVideoItem (videoItem: VideoEntity) {
    this._currentFrame = 0
    this._videoItem = videoItem
    this._renderer?.prepare()
    this.clear()
    // this._update()
  }
  setContentMode(contentMode: string) {
    this._contentMode = contentMode;
    this._update();
  }
  //
  startAnimation(reverse: boolean) {
    this.stopAnimation(false);
    this._doStart(undefined, reverse, 0);
  }

  // startAnimationWithRange(range, reverse: boolean) {
  //   this.stopAnimation(false);
  //   this._doStart(range, reverse, undefined)
  // }

  // pauseAnimation() {
  //   this.stopAnimation(false);
  // }
  //
  stopAnimation(clear: boolean) {
    this._forwardAnimating = false
    if (this._animator !== undefined) {
      this._animator?.stop()
    }
    if (clear === undefined) {
      clear = this.clearsAfterStop;
    }
    if (clear) {
      this.clear();
    }
  }

  clear() {
    this._renderer?.clear()
    // this._renderer?.clearAudios();
  }

  // stepToFrame(frame: number, andPlay: boolean) {
  //   if (frame >= (this._videoItem?.frames || 0) || frame < 0) {
  //     return;
  //   }
  //   this.pauseAnimation();
  //   this._currentFrame = frame;
  //   this._update();
  //   if (andPlay) {
  //     this._doStart(undefined, false, this._currentFrame)
  //   }
  // }

  // stepToPercentage(percentage: number, andPlay: boolean) {
  //   if (!this._videoItem) return;
  //   let frame = parseInt((percentage * this._videoItem.frames).toString());
  //   if (frame >= (this._videoItem?.frames || 0) && frame > 0) {
  //     frame = this._videoItem.frames - 1;
  //   }
  //   this.stepToFrame(frame, andPlay);
  // }

  setImage(urlORbase64: string, forKey: string, transform: SVGA.com.opensource.svga.Transform) {
    this._dynamicImage[forKey] = urlORbase64;
    if (transform !== undefined && transform instanceof Array && transform.length == 6) {
      this._dynamicImageTransform[forKey] = transform;
    }
  }

  setText(textORMap: string | TextMap, forKey: string) {
    let text = typeof textORMap === "string" ? textORMap : textORMap.text;
    let size = (typeof textORMap === "object" ? textORMap.size : "14px") || "14px";
    let family = (typeof textORMap === "object" ? textORMap.family : "Arial") || "Arial";
    let color = (typeof textORMap === "object" ? textORMap.color : "#000000") || "#000000";
    let offset: TextOffset = (typeof textORMap === "object" ? textORMap.offset : { x: 0.0, y: 0.0 }) || { x: 0.0, y: 0.0 };
    this._dynamicText[forKey] = {
      text,
      style: `${size} ${family}`,
      color,
      offset,
    };
  }

  clearDynamicObjects() {
    this._dynamicImage = {};
    this._dynamicImageTransform = {};
    this._dynamicText = {};
  }

  onFinished(callback: () => void) {
    this._onFinished = callback;
  }

  onFrame(callback: () => void) {
    this._onFrame = callback;
  }

  // onPercentage(callback) {
  //   this._onPercentage = callback;
  // }

  drawOnContext(ctx: CanvasRenderingContext2D, x: number, y: number, width: number, height: number) {
    if (this._drawingCanvas && this._videoItem) {
      ctx.drawImage(this._drawingCanvas, x, y, width || this._videoItem.videoSize.width, height || this._videoItem.videoSize.height);
    }
  }

  _doStart(range: Range | undefined, reverse: boolean, fromFrame: number) {
    this._animator = new ValueAnimator()
    if (range !== undefined) {
      this._animator.startValue = Math.max(0, range.location)
      this._animator.endValue = Math.min((this._videoItem?.frames || 1) - 1, range.location + range.length)
      this._animator.duration = (this._animator.endValue - this._animator.startValue + 1) * (1.0 / (this._videoItem?.FPS || 1)) * 1000
    }
    else {
      this._animator.startValue = 0
      this._animator.endValue  = (this._videoItem?.frames || 1) - 1
      this._animator.duration = (this._videoItem?.frames || 1) * (1.0 / (this._videoItem?.FPS || 1)) * 1000
    }
    this._animator.loops = this.loops <= 0 ? Infinity : this.loops
    this._animator.fillRule = this.fillMode === "Backward" ? 1 : 0

    this._animator.onUpdate = (value) => {
      AlertDialog.show({
        message: '动画中' + value
      })
      if (this._currentFrame === Math.floor(value)) {
        return;
      }
      if (this._forwardAnimating && this._currentFrame > Math.floor(value)) {
        // this._renderer.clearAudios()
      }
      this._currentFrame = Math.floor(value)
      this._update()
      if (typeof this._onFrame === "function") {
        this._onFrame(this._currentFrame);
      }
      if (typeof this._onPercentage === "function") {
        this._onPercentage(parseFloat((this._currentFrame + 1).toString()) / parseFloat((this._videoItem?.frames || 1).toString()));
      }
    }
    this._animator.onEnd = () => {
      AlertDialog.show({
        message: '动画完成'
      })
      this._forwardAnimating = false
      if (this.clearsAfterStop === true) {
        this.clear()
      }
      if (typeof this._onFinished === "function") {
        this._onFinished();
      }
    }

    if (reverse === true) {
      this._animator.reverse(fromFrame)
      this._forwardAnimating = false
    }
    else {
      this._animator.start(fromFrame)
      this._forwardAnimating = true
    }
    this._currentFrame = this._animator.startValue
    this._update()
  }

  _update() {
    if (this._videoItem === undefined) { return; }
    this._renderer?.drawFrame(this._currentFrame);
    // this._renderer?.playAudio(this._currentFrame);
  }

}

export interface Range {
  location: number, length: number
}
