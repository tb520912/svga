import SVGA from '../source/svga'
export class BezierPath {

  _d: string;
  _transform: SVGA.com.opensource.svga.ITransform | undefined;
  _styles: SVGA.com.opensource.svga.ShapeEntity.IShapeStyle | undefined;
  _shape: string | null = null;

  constructor(d: string, transform: SVGA.com.opensource.svga.ITransform | undefined, styles: SVGA.com.opensource.svga.ShapeEntity.IShapeStyle | undefined) {
    this._d = d;
    this._transform = transform;
    this._styles = styles;
  }

}