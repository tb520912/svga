import { MovieData } from './mockWorker';
import SVGA from '../source/svga'
import { SpriteEntity } from './spriteEntity';

export class VideoEntity {

  /**
   * SVGA 文件版本
   */
  version = "";

  /**
   * 影片尺寸
   */
  videoSize: VideoSize = {
    width: 0.0,
    height: 0.0,
  };

  /**
   * 帧率
   */
  FPS = 20;

  /**
   * 帧数
   */
  frames = 0;

  /**
   * Bitmaps
   */
  images: Record<string, string> = {};

  /**
   * SpriteEntity[]
   */
  sprites: SVGA.com.opensource.svga.ISpriteEntity[] = []

  /**
   * AudioEntity[]
   */
  audios: SVGA.com.opensource.svga.IAudioEntity[] = []

  constructor(spec: MovieData, images: Record<string, string>) {

    if (typeof spec === "object") {
      if (spec.params ) {
        this.version = spec.ver!;
        this.videoSize.width = spec.params.viewBoxWidth || 0.0;
        this.videoSize.height = spec.params?.viewBoxHeight || 0.0;
        this.FPS = spec.params?.fps || 20;
        this.frames = spec.params?.frames || 0;
      }
      this.resetSprites(spec)
      this.audios = spec.audios
    }
    if (images) {
      this.images = images
    }
  }

  resetSprites(spec: MovieData) {
    if (spec.sprites instanceof Array) {
      this.sprites = spec.sprites.map((obj) => {
        return new SpriteEntity(obj)
      })
    }
  }

}
export interface VideoSize {
  width: number
  height: number
}