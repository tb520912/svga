import { FrameEntity } from './frameEntity'
import { BezierPath } from './bezierPath'
import { RectPath } from './rectPath'
import { EllipsePath } from './ellipsePath'
import SVGA from '../source/svga'

export class SpriteEntity {

  /**
   * string
   */
  matteKey: string | null

  /**
   * string
   */
  imageKey: string | null

  /**
   * FrameEntity[]
   */
  frames: SVGA.com.opensource.svga.IFrameEntity[] = []

  constructor(spec: SVGA.com.opensource.svga.ISpriteEntity) {
    this.matteKey = spec.matteKey || null;
    this.imageKey = spec.imageKey || null;
    if (spec.frames) {
      this.frames = spec.frames.map((obj) => {
        return new FrameEntity(obj)
      })
    }
  }

}