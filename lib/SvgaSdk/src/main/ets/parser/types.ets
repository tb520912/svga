import { MovieParams } from './mockWorker'

export interface ParserPostMessageArgs {
  url: string
  options: ParserPostMessageArgsoptions
}
export interface ParserPostMessageArgsoptions {
  isDisableImageBitmapShim: boolean
}

export interface ParserConfigOptions {
  /**
   * 是否取消使用 WebWorker，默认值 false
   */
  isDisableWebWorker?: boolean
  /**
   * 是否取消使用 ImageBitmap 垫片，默认值 false
   */
  isDisableImageBitmapShim?: boolean
}

export interface Rect {
  x: number
  y: number
  width: number
  height: number
}

export interface Transform {
  a: number
  b: number
  c: number
  d: number
  tx: number
  ty: number
}

export const enum LINE_CAP_CODE {
  BUTT = 0,
  ROUND = 1,
  SQUARE = 2
}

export const enum LINE_JOIN_CODE {
  MITER = 0,
  ROUND = 1,
  BEVEL = 2
}

export interface RGBA_CODE {
  r: number
  g: number
  b: number
  a: number
}

export type RGBA<R extends number, G extends number, B extends number, A extends number> = `rgba(${R}, ${G}, ${B}, ${A})`

export const enum SHAPE_TYPE_CODE {
  SHAPE = 0,
  RECT = 1,
  ELLIPSE = 2,
  KEEP = 3
}

export const enum SHAPE_TYPE {
  SHAPE = 'shape',
  RECT = 'rect',
  ELLIPSE = 'ellipse'
}

export interface MovieStyles {
  fill: RGBA_CODE | null
  stroke: RGBA_CODE | null
  strokeWidth: number | null
  lineCap: LINE_CAP_CODE | null
  lineJoin: LINE_JOIN_CODE | null
  miterLimit: number | null
  lineDashI: number | null
  lineDashII: number | null
  lineDashIII: number | null
}

export interface VideoStyles {
  fill: RGBA<number, number, number, number> | null
  stroke: RGBA<number, number, number, number> | null
  strokeWidth: number | null
  lineCap: CanvasLineCap | null
  lineJoin: CanvasLineJoin | null
  miterLimit: number | null
  lineDash: number[] | null
}

export interface ShapePath {
  d: string
}

export interface RectPath {
  x: number
  y: number
  width: number
  height: number
  cornerRadius: number
}

export interface EllipsePath {
  x: number
  y: number
  radiusX: number
  radiusY: number
}

export interface MovieShape {
  type: SHAPE_TYPE_CODE | null
  shape: ShapePath | null
  rect: RectPath | null
  ellipse: EllipsePath | null
  styles: MovieStyles | null
  transform: Transform | null
}

export interface VideoShapeShape {
  type: SHAPE_TYPE.SHAPE
  path: ShapePath
  styles: VideoStyles
  transform: Transform
}

export interface VideoShapeRect {
  type: SHAPE_TYPE.RECT
  path: RectPath
  styles: VideoStyles
  transform: Transform
}

export interface VideoShapeEllipse {
  type: SHAPE_TYPE.ELLIPSE
  path: EllipsePath
  styles: VideoStyles
  transform: Transform
}

export interface MaskPath {
  d: string
  transform: Transform | undefined
  styles: VideoStyles
}

export interface MovieFrame {
  alpha: number
  transform: Transform | null
  nx: number
  ny: number
  layout: Rect
  clipPath: string
  maskPath: MaskPath | null
  shapes: MovieShape[]
}

export type VideoFrameShape = VideoShapeShape|VideoShapeRect|VideoShapeEllipse

export type VideoFrameShapes = VideoFrameShape[]

export interface VideoFrame {
  alpha: number
  transform: Transform | null
  nx: number
  ny: number
  layout: Rect
  clipPath: string
  maskPath: MaskPath | null
  shapes: VideoFrameShapes
}

export interface MovieSprite {
  imageKey: string
  frames: MovieFrame[]
}

export interface VideoSprite {
  imageKey: string
  frames: VideoFrame[]
}


export interface Movie {
  version: string
  images: Record<string, Uint8Array>
  params: MovieParams
  sprites: MovieSprite[]
}

export interface Video {
  version: string
  size: VideoSize
  fps: number
  frames: number
  images: Record<string,string>
  sprites: VideoSprite[]
}
export interface VideoSize {
  width: number
  height: number
}

export const enum PLAYER_FILL_MODE {
  /**
   * 播放完成后停在首帧
   */
  FORWARDS = 'forwards',
  /**
   * 播放完成后停在尾帧
   */
  BACKWARDS = 'backwards'
}

export const enum PLAYER_PLAY_MODE {
  /**
   * 顺序播放
   */
  FORWARDS = 'forwards',
  /**
   * 倒序播放
   */
  FALLBACKS = 'fallbacks'
}

