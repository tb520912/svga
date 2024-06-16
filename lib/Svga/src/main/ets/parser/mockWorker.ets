import { FailureFn } from '.'
import { http } from '@kit.NetworkKit'
import { BusinessError } from '@kit.BasicServicesKit'

// import { ProtoMovieEntity } from './proto'
import * as InflateObj from 'pako/lib/inflate'
import SVGA from '../source/svga'
import pako from 'pako'
import { ArrayList, buffer, taskpool, util } from '@kit.ArkTS'
import { Message } from 'protobufjs'
import { IntentionCode } from '@kit.InputKit'
import { when } from '@ohos/hypium'

// import { SpriteEntity } from './spriteEntity'
// import { TransForm } from './frameEntity'

// const pako: Pako = {}
// common.assign(pako, InflateObj.inflate)

// const Uint8ToString = (u8a: Uint8Array) => {
//   const CHUNK_SZ = 0x8000
//   // let c: string[] = []
//   // for (let i = 0; i < u8a.length; i += CHUNK_SZ) {
//   //   let str: string[] = []
//   //   u8a.subarray(i, i+CHUNK_SZ).forEach(v => {
//   //     str.push(String.fromCharCode(v))
//   //   })
//   //   c.push(str.join(''))
//   //   // c.push(String.fromCharCode.apply(null, u8a.subarray(i, i + CHUNK_SZ) as Uint8Array))
//   // }
//   // return c.join('')
//   let body: number[] = []
//   for (let index = 0; index < u8a.length; index+= CHUNK_SZ) {
//     body.push()
//   }
// }

const actions: Action = {
  loadAssets: (url, cb, failure) => {
    /*if (typeof JSZipUtils === 'object' && typeof JSZip === 'function') {
      if (url.toString() == '[object File]') {
        actions._readBlobAsArrayBuffer(url, function (arrayBufferSVGA) {
          const dataHeader = new Uint8Array(arrayBufferSVGA, 0, 4)
          if (
            dataHeader[0] == 80 &&
              dataHeader[1] == 75 &&
              dataHeader[2] == 3 &&
              dataHeader[3] == 4
          ) {
            JSZip.loadAsync(arrayBufferSVGA).then(function (zip) {
              console.log('zip', zip)
              actions._decodeAssets(zip, cb)
            })
          } else {
            actions.load_viaProto(arrayBufferSVGA, cb, failure)
          }
        })
      } else if (url.indexOf('data:svga/1.0;base64,') >= 0) {
        var arrayBufferSVGA = actions._base64ToArrayBuffer(url.substring(21))
        JSZip.loadAsync(arrayBufferSVGA).then(function (zip) {
          actions._decodeAssets(zip, cb)
        })
      } else if (url.indexOf('data:svga/2.0;base64,') >= 0) {
        var arrayBufferSVGA = actions._base64ToArrayBuffer(url.substring(21))
        actions.load_viaProto(arrayBufferSVGA, cb, failure)
      } else {
        JSZipUtils.getBinaryContent(url, function (err, data) {
          if (err) {
            failure && failure(err)
            console.error(err)
            throw err
          } else {
            const dataHeader = new Uint8Array(data, 0, 4)
            if (
              dataHeader[0] == 80 &&
                dataHeader[1] == 75 &&
                dataHeader[2] == 3 &&
                dataHeader[3] == 4
            ) {
              JSZip.loadAsync(data).then(function (zip) {
                actions._decodeAssets(zip, cb)
              })
            } else {
              actions.load_viaProto(data, cb, failure)
            }
          }
        })
      }
    } else {*/
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
      // const inflatedData = pako.inflate(arraybuffer) as Uint8Array

    } catch (err) {
      AlertDialog.show({
        message: '解析错误' + JSON.stringify(err)
      })
      // Do not log to console or throw, if failure() exists
      if (failure) {
        failure(err)
        return
      }
      console.error(err)
    }
  },

 /* _decodeAssets: (zip, cb) => {
    var version = '1.0'
    if (zip.file('movie.binary')) {
      version = '1.5'
    }

    zip
      .file('movie.spec')
      .async('string')
      .then(function (spec) {
        let movieData = JSON.parse(spec)
        let images = {}

        movieData.ver = version
        console.log('movieData222', movieData)
        actions._loadImages(images, zip, movieData, function () {
          cb({
            movie: movieData,
            images,
          })
        })
      })
  },*/

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

 /* _base64ToArrayBuffer: (base64) => {
    var binary_string = window.atob(base64)
    var len = binary_string.length
    var bytes = new Uint8Array(len)
    for (var i = 0; i < len; i++) {
      bytes[i] = binary_string.charCodeAt(i)
    }
    return bytes.buffer
  },

  _readBlobAsArrayBuffer: (blob, callback) => {
    var reader = new FileReader()
    reader.onload = function (e) {
      callback(e.target.result)
    }
    reader.readAsArrayBuffer(blob)
  },*/
}

@Concurrent
function inflate (buf: ArrayBuffer): Uint8Array {
  const options: pako.InflateOptions = {
    chunkSize: 1024 * 512
  }
  return pako.inflate(buf, options)
}

export default  (data: string, cb: CbFn, failure: FailureFn) => {
  actions.loadAssets(data, cb, failure)
}
export type CbFn = (data: ESObject) => void
export type ActionLoadAssets = (url: string, cb: CbFn, failure: FailureFn) => void
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
