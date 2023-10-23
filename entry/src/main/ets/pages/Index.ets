import { turn } from '../common/internal/InternalMethods'
import { CourseData } from '../common/model/CourseData'
import { Toolbar } from '@ohos/components'
import MainVM from './MainVM'
import Constants from '@ohos/components/src/main/ets/common/Constants'

@Preview
@Entry
@Component
export default struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Toolbar({
          title: 'HarmonyOS第一课',
        })
        List() {
          ForEach(MainVM.getCourseList(), (item: CourseData, index) => {
            ListItem() {
              Button() {
                Text(`${item.no} ${item.title}`)
                  .fontSize(14)
                  .fontColor(Color.Black)
                  .width(Constants.MATCH_PARENT)
                  .textAlign(TextAlign.Start)
              }
              .padding({ left: 16, right: 16 })
              .width(Constants.MATCH_PARENT)
              .height(40)
              .backgroundColor(Color.Transparent)
              .type(ButtonType.Normal)
              .stateEffect(true)
              .borderRadius(0)
              .onClick(() => {
                turn("pages/CourseIndex", item)
              })
            }
          })
        }
        .layoutWeight(1)
        .width("100%")
        .height(0)
      }
      .width('100%')
    }
    .height('100%')
  }
}