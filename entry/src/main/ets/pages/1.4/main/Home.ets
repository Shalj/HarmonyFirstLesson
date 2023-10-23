import promptAction from '@ohos.promptAction'
import { MenuData } from '../../../common/model/MenuData'
import MainVM from './MainVM'

@Component
export default struct Home {
  private scroller = new Scroller()

  @Builder menuBuilder(item: MenuData) {
    Column() {
      Image(item.icon)
        .width(24)
        .height(24)
      Text(item.title)
        .margin({ top: 4 })
        .fontSize(12)
        .fontColor(Color.Black)
    }
    .layoutWeight(1)
    .padding({ top: 8, bottom: 8 })
  }

  build() {
    Scroll(this.scroller) {
      Column() {
        //轮播图
        Swiper() {
          ForEach(MainVM.getSwiperImages(),
            (item: Resource) => {
              Image(item).borderRadius(20).margin({ left: 16, right: 16 })
            },
            (item) => JSON.stringify(item)
          )
        }
        .indicator(true)
        .width("100%")
        .loop(true)
        .autoPlay(true)
        .interval(3000)

        //菜单
        Grid() {
          ForEach(
            MainVM.getFirstGridData(),
            (item: MenuData) => {
              GridItem() {
                this.menuBuilder(item)
              }
              .stateStyles({
                pressed: {
                  .backgroundColor("#f5f5f5")
                  .borderRadius(10)
                },
                normal: {
                  .backgroundColor(Color.Transparent)
                }
              })
              .onClick(() => {
                promptAction.showToast({ message: item.title })
              })
            },
            (item: MenuData) => JSON.stringify(item))
        }
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .rowsTemplate('1fr 1fr')
        .borderRadius(20)
        .backgroundColor(Color.White)
        .padding({ left: 8, right: 8, top: 12, bottom: 12 })
        .margin({ top: 12, bottom: 12, left:16, right:16})
        .height(150)

        //排行棒
        Text("列表")
          .margin({ left: 20, top: 12 })
          .fontSize(16)
          .alignSelf(ItemAlign.Start)
        Grid() {
          ForEach(MainVM.getSecondGridData(), (item: MenuData) => {
            GridItem() {
              Column() {
                Text(item.title)
                  .fontSize(16)
                  .fontWeight(FontWeight.Medium)
                Text(item.desc)
                  .margin({ top: 4 })
                  .fontSize(12)
                  .fontColor($r('app.color.home_grid_fontColor'))
              }
              .width("47%")
              .alignItems(HorizontalAlign.Start)
            }
            .padding({ top: 10, left: 10 })
            .borderRadius(12)
            .align(Alignment.TopStart)
            .backgroundImage(item.icon)
            .backgroundImageSize(ImageSize.Cover)
            .height(120)
          }, (item) => JSON.stringify(item))
        }
        .layoutDirection(GridDirection.Row)
        .maxCount(2)
        .rowsGap(8)
        .columnsGap(8)
        .margin({ top: 8 , left:16, right:16})

        Text("hhhh").fontSize(100)
        Text("hhhh").fontSize(100)
        Text("hhhh").fontSize(100)
        Text("hhhh").fontSize(100)

      }
      .padding({ top: 20 })
    }
    .backgroundColor($r('app.color.background'))
    .scrollable(ScrollDirection.Vertical)
    .scrollBar(BarState.Off)
  }
}