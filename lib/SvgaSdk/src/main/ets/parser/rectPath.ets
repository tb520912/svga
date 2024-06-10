import { BezierPath } from './bezierPath'
import SVGA from '../source/svga'
export class RectPath extends BezierPath {

  _x: number;
  _y: number;
  _width: number;
  _height: number;
  _cornerRadius: number;
  _transform: SVGA.com.opensource.svga.ITransform | undefined;
  _styles: SVGA.com.opensource.svga.ShapeEntity.IShapeStyle | undefined;

  constructor(
    x: number,
    y: number,
    width: number,
    height: number,
    cornerRadius: number,
    transform: SVGA.com.opensource.svga.ITransform | undefined,
    styles: SVGA.com.opensource.svga.ShapeEntity.IShapeStyle | undefined) {
    super('', transform, styles);
    this._x = x
    this._y = y
    this._width = width
    this._height = height
    this._cornerRadius = cornerRadius
    this._transform = transform
    this._styles = styles
  }

}