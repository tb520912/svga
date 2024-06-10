
import { BezierPath } from './bezierPath'
import SVGA from '../source/svga'
export class EllipsePath extends BezierPath {

  _x: number;
  _y: number;
  _radiusX: number;
  _radiusY: number;
  _transform: SVGA.com.opensource.svga.ITransform | undefined;
  _styles: SVGA.com.opensource.svga.ShapeEntity.IShapeStyle | undefined;

  constructor(
    x: number,
    y: number,
    radiusX: number,
    radiusY: number,
    transform: SVGA.com.opensource.svga.ITransform | undefined,
    styles: SVGA.com.opensource.svga.ShapeEntity.IShapeStyle | undefined) {
    super('', transform, styles);
    this._x = x;
    this._y = y;
    this._radiusX = radiusX;
    this._radiusY = radiusY;
    this._transform = transform;
    this._styles = styles;
  }

}