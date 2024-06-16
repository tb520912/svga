# SVGA 简介

SVGA SVGA动画播放器 harmonyOSNext版本

# 下载安装

ohpm install @tb-open/svga

# 使用

参考web使用方式

```arkTS
import SVGA from '@tb-open/svga'

...
Canvas(this.context)
        .width(300)
        .aspectRatio(1)
        .backgroundColor('#000')
        .onReady(() => {
          const parser = new SVGA.Parser()
          this.player = new SVGA.Player(this.getUIContext() ,this.context)
          parser.load(
            '远程url路径',
            (videoItem) => {
              this.player?.setVideoItem(videoItem)
              this.player?.startAnimation(false)
            },
            (err: BusinessError) => {
              AlertDialog.show({
                message: JSON.stringify(err)
              })
            }
          )
        })
```

#### 如果动画包含音频 则需要在页面切换时调用player.release()方法 销毁播放器 释放音频播放器资源
