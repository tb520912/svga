import media from '@ohos.multimedia.media'
import { util } from '@kit.ArkTS'

// 播放器静态类
export default class AVPlayerClass {
  player: media.AVPlayer | null = null
  id: string = ''
  constructor() {
    this.id = util.generateRandomUUID()
  }
  async init(url: string): Promise<boolean> {
    try {
      this.player = await media.createAVPlayer()
      // 缓存后 播放状态不对
      this.player.on('seekDone', () => {
        this.player?.play()
      })
      this.player!.on('stateChange', (state) => {
        switch (state) {
          case 'initialized':
            this.player?.prepare()
            break;
            case 'prepared':
              this.player?.play()
          break;
              case 'stopped':
                this.player?.prepare()
        }
      })
      this.player.url = url
      return true
      // return await this.setUrl(url)
    } catch (e) {
      return false
    }
  }

  // 设置文件源
  // setUrl (url: string)  {
  //   return new Promise<boolean>((resolve, reject) => {
  //     if (!this.player) {
  //       reject(false)
  //     }
  //     this.player!.on('stateChange', (state) => {
  //       switch (state) {
  //         case 'initialized':
  //           this.player?.prepare()
  //         break;
  //         case 'prepared':
  //           resolve(true)
  //       }
  //     })
  //     this.player!.url = url
  //   })
  // }
  // 单曲播放
  play() {
    const states: media.AVPlayerState[] = ['prepared', 'paused', 'completed']
    if (this.player?.state && states.includes(this.player?.state)) {
      this.player.play()
    }
  }
  // 设置进度
  seek (seek: number) {
    const states: media.AVPlayerState[] = ['prepared', 'paused', 'completed', 'playing']
    if (this.player && states.includes(this.player.state)) {
      this.player.seek(seek)
    }
  }
  // 播放 暂停
  async pause() {
    if (this.player && this.player.state === 'playing') {
      this.player?.pause()
    }
  }
  // 停止
  async stop () {
    const states: media.AVPlayerState[] = ['completed', 'playing', 'prepared', 'paused']
    if (this.player && states.includes(this.player.state)) {
      this.player.stop()
    }
  }

  // 删除
  async release() {
    this.player && this.player.release()
  }
}