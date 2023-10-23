import { MenuData } from '../../../common/model/MenuData'
import MainVM from './MainVM'

@Component
export struct Mine {
  private settingListData: Array<MenuData> = MainVM.getSettingListData()

  settingItemBorderRadius(index: number): BorderRadiuses {
    switch (index) {
      case 0:
        return { topLeft: 20, topRight: 20 }
      case this.settingListData.length - 1:
        return { bottomLeft: 20, bottomRight: 20 }
      default:
        return {topLeft: 100, bottomLeft:0}
    }
  }

  @Builder userInfo() {
    Row() {
      Button() {
        Image($r('app.media.account'))
          .width(50)
          .height(50)
      }
      .type(ButtonType.Circle)
      .margin({ right: 20 })

      Column() {
        Text('沙先生').fontSize(16)
        Text('sha.lj@neusoft.com').fontSize(12).margin({ top: 5 })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)
    }
    .borderRadius(20)
    .backgroundColor(Color.White)
    .height(80)
    .margin({ left: 20, right: 20 })
    .padding({ left: 30, right: 30 })
  }

  @Builder settingItem(index: number, item: MenuData) {
    Row() {
      Image(item.icon)
        .width(24)
        .height(24)

      Text(item.title)
        .fontSize(14)
        .margin({ left: 8 })
        .layoutWeight(1)

      Image($r('app.media.ic_public_arrow_right'))
        .fillColor(Color.Gray)
        .width(24)
        .height(24)
    }
    .height(40)
    .padding({ left: 12, right: 12 })
  }

  @Builder settingList() {
    List() {
      ForEach(this.settingListData, (item, index) => {
        ListItem() {
          this.settingItem(index, item)
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
        .borderRadius(this.settingItemBorderRadius.bind(this, index))
      }, (item) => JSON.stringify(item))
    }
    .divider({ strokeWidth: 1, startMargin: 12 })
    .backgroundColor(Color.White)
    .borderRadius(20)
    .margin({ left: 16, right: 16, top: 20 })
  }

  @Builder logout() {
    Button() {
      Text('退出登录').fontSize(14).fontColor(Color.Red)
    }
    .width("80%")
    .height(40)
    .margin({ bottom: 30 })
    .backgroundColor(0xffffffff)
    .type(ButtonType.Capsule)
  }

  build() {
    Navigation() {
      Column() {
        this.userInfo()
        this.settingList()
        Blank().layoutWeight(1)
        this.logout()
      }
    }
    .title('我的')
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(true)
    .backgroundColor($r('app.color.background'))
  }
}