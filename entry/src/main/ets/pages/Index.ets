import SVGA from 'svga';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('HelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          // const parser = new SVGA.Parser()
          // parser.load(
          //   'https://medtion-image.medtion.com/uploads/1/image/public/202305/20230518171412_mvio1mbygg.svga',
          //   (videoItem) => {
          //     const a = videoItem
          //     AlertDialog.show({
          //       message: JSON.stringify(videoItem)
          //     })
          //   }, (err: ESObject) => {
          //     AlertDialog.show({
          //       message: JSON.stringify(err)
          //     })
          // }
          // )
          router.pushUrl({
            url: 'pages/TestPage'
          })
        })
    }
    .height('100%')
    .width('100%')
  }
}