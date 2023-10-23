import { MainTabData } from '../../../common/model/MainTabData'
import Home from './Home'
import MainVM from './MainVM'
import { Mine } from './Mine'

@Entry
@Component
export struct MainPage {
  @State currentIndex: number = 0
  private tabController = new TabsController()
  private tabs = MainVM.getTabs()

  @Builder TabBuilder(index: number, tab: MainTabData) {
    Column() {
      Image(this.currentIndex == index ? tab.selectedIcon : tab.icon)
        .width(24)
        .height(24)
      Text(tab.title)
        .margin({ top: 4 })
        .fontSize(10)
        .fontColor(this.currentIndex === index ? $r('app.color.mainPage_selected') : $r('app.color.mainPage_normal'))
    }.onClick(() => {
      this.tabController.changeIndex(index)
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabController }) {
      TabContent() {
        Home()
      }
      .tabBar(this.TabBuilder(0, this.tabs[0]))

      TabContent() {
        Mine()
      }
      .tabBar(this.TabBuilder(1, this.tabs[1]))
    }.onChange((index) => {
      this.currentIndex = index
    })
  }
}