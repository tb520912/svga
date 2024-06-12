import media from '@ohos.multimedia.media'
// 播放器静态类
export default class AVPlayerClass {
  player: media.AVPlayer | null = null
  endFrame: number = 0

  constructor() {

  }
  async init(url: string, frame: number): Promise<boolean> {
    this.endFrame = frame
    this.player = await media.createAVPlayer()
    // 缓存后 播放状态不对
    return this.setUrl(url)
  }

  // 设置文件源
  setUrl (url: string)  {
    return new Promise<boolean>((resolve, reject) => {
      if (!this.player) {
        reject(false)
      }
      this.player!.on('stateChange', (state) => {
        if (state === 'prepared') {
          resolve(true)
        }
      })
      this.player!.url = url
    })
  }
  // 单曲播放
  play() {
    const states: media.AVPlayerState[] = ['prepared', 'paused', 'completed']
    if (this.player?.state && states.includes(this.player?.state)) {
      this.player.play()
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