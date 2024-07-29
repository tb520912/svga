import { FailureFn } from '.'
import { http } from '@kit.NetworkKit'
import { BusinessError } from '@kit.BasicServicesKit'
import fs from '@ohos.file.fs'
import SVGA from '../source/svga'
import pako from 'pako'
import { taskpool, util } from '@kit.ArkTS'


const actions: Action = {
  loadAssets: (url, cb, failure) => {
    if (typeof url === 'string' && url.startsWith('http')) {
      const req = http.createHttp()
      req.request(url, {
        expectDataType: http.HttpDataType.ARRAY_BUFFER
      }).then(res => {
        if (res) {
          actions.load_viaProto(res.result as ArrayBuffer, cb, failure)
        }
      }).catch((err: BusinessError) => {
        if (failure) {
          failure(err)
          return
        }
      })
    } else if (typeof url === 'string') {
      if (fs.accessSync(url)) {
        try {
          const file = fs.openSync(url, fs.OpenMode.READ_ONLY)
          let buf: ArrayBuffer = new ArrayBuffer(fs.statSync(file.fd).size);
          fs.readSync(file.fd, buf)
          actions.load_viaProto(buf, cb, failure)
        } catch (e) {
          console.error("read file error " + e);
        }
      } else {
        AlertDialog.show({
          message: '地址错误 请输入完整沙箱路径'
        })
      }
    } else {
      try {
        const buffer = getContext().resourceManager.getMediaContentSync(url.id)
        actions.load_viaProto(buffer.buffer as ArrayBuffer, cb, failure)
      } catch (e) {

      }
    }

    // }
  },

  load_viaProto: (arraybuffer, cb, failure) => {
    try {
      taskpool.execute(inflate, arraybuffer).then(inflatedData => {
        const movieData: MovieData = SVGA.com.opensource.svga.MovieEntity.decode(inflatedData as Uint8Array) as MovieData
        let images: Record<string, string> = {}
        actions._loadImages(images, movieData, () => {
          movieData.ver = '2.0'
          cb({
            movie: movieData,
            images,
          })
        })
      }).catch((err: BusinessError) => {
        AlertDialog.show({
          message: '解压错误' + JSON.stringify(err)
        })
      })

    } catch (err) {
      AlertDialog.show({
        message: '解析错误' + JSON.stringify(err)
      })
      if (failure) {
        failure(err)
        return
      }
      console.error(err)
    }
  },

  _loadImages: (images: Record<string, string>, movieData: MovieData, imagesLoadedBlock: () => void) => {
    if (typeof movieData === 'object') {
      let finished = true
      // if (!zip) {
      const keys = Object.keys(movieData.images)
      if (keys.length) {
        keys.forEach(key => {
          const element = movieData.images[key]
          let value = ''
          try {
            let base64 = new util.Base64Helper()
            value = base64.encodeToStringSync(element, util.Type.BASIC)
          } catch (e) {
            let base64 = new util.Base64Helper()
            value = base64.encodeToStringSync(element, util.Type.BASIC)
          }
          images[key] = value
        })
      }
       /* for (const key in movieData.images) {
          if (movieData.images.hasOwnProperty(key)) {
            const element = movieData.images[key]
            let value
            try {
              value = Uint8ToString(element)
              console.log(key, value)
            } catch (e) {
              // fix windows xp chrome 下首次执行 String.fromCharCode.apply报错问题
              value = Uint8ToString(element)
            }
            images[key] = btoa(value)
            console.log(`new${key}`, btoa(value))
          }
        }*/
      // }
      /*else {
          for (const key in movieData.images) {
            if (movieData.images.hasOwnProperty(key)) {
              const element = movieData.images[key]
              const value = Uint8ToString(element)
              if (images.hasOwnProperty(key)) {
                continue
              }
              finished = false
              zip
                .file(value + '.png')
                .async('base64')
                .then(
                  function (data) {
                    images[key] = data
                    actions._loadImages(images, zip, movieData, imagesLoadedBlock)
                  }.bind(this)
                )
              break
            }
          }
        }*/
      finished && imagesLoadedBlock()
    }
    /*else {
      let finished = true
      for (var key in movieData.images) {
        if (movieData.images.hasOwnProperty(key)) {
          var element = movieData.images[key]
          if (images.hasOwnProperty(key)) {
            continue
          }
          finished = false
          zip
            .file(element + '.png')
            .async('base64')
            .then(
              function (data) {
                images[key] = data
                actions._loadImages(images, zip, movieData, imagesLoadedBlock)
              }.bind(this)
            )
          break
        }
      }
      finished && imagesLoadedBlock.call(this)
    }*/
  },

}

@Concurrent
function inflate (buf: ArrayBuffer): Uint8Array {
  return pako.inflate(buf)
}

export default  (data: ResourceStr, cb: CbFn, failure: FailureFn) => {
  actions.loadAssets(data, cb, failure)
}
export type CbFn = (data: ESObject) => void
export type ActionLoadAssets = (url: ResourceStr, cb: CbFn, failure: FailureFn) => void
export type ActionLoadViaProto = (arrayBuffer: ArrayBuffer, cb: CbFn, failure: FailureFn) => void
export interface Action {
  loadAssets: ActionLoadAssets,
  load_viaProto: ActionLoadViaProto,
  _loadImages: ESObject
}

export type inflateFn = (input: ESObject, options?: ESObject) => string | Uint8Array
export interface Pako {
  inflate?: inflateFn
}

export class MovieData extends  SVGA.com.opensource.svga.MovieEntity {
  ver?: string

  constructor() {
    super()

  }
}
export interface MovieParams {
  fps: number
  frames: number
  viewBoxWidth: number
  viewBoxHeight: number
}
