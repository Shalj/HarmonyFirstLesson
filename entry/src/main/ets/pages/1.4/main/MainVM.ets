import { MenuData } from '../../../common/model/MenuData';
import { MainTabData } from '../../../common/model/MainTabData';

class MainVM {
  getTabs(): Array<MainTabData> {
    return [
      {
        title: "首页",
        icon: $r('app.media.home_normal'),
        selectedIcon: $r('app.media.home_selected')
      },
      {
        title: "我的",
        icon: $r('app.media.mine_normal'),
        selectedIcon: $r('app.media.mine_selected')
      }
    ]
  }

  getSwiperImages(): Array<Resource> {
    let swiperImages: Resource[] = [
    $r('app.media.fig1'),
    $r('app.media.fig2'),
    $r('app.media.fig3'),
    $r('app.media.fig4')
    ];
    return swiperImages;
  }

  getFirstGridData(): Array<MenuData> {
    let firstGridData: MenuData[] = [
      new MenuData($r('app.string.my_love'), $r('app.media.love')),
      new MenuData($r('app.string.history_record'), $r('app.media.record')),
      new MenuData($r('app.string.message'), $r('app.media.message')),
      new MenuData($r('app.string.shopping_cart'), $r('app.media.shopping')),
      new MenuData($r('app.string.my_goal'), $r('app.media.target')),
      new MenuData($r('app.string.group'), $r('app.media.circle')),
      new MenuData($r('app.string.favorites'), $r('app.media.favorite')),
      new MenuData($r('app.string.recycle_bin'), $r('app.media.recycle')),
      new MenuData($r('app.string.my_goal'), $r('app.media.target')),
      new MenuData($r('app.string.group'), $r('app.media.circle')),
      new MenuData($r('app.string.favorites'), $r('app.media.favorite')),
      new MenuData($r('app.string.recycle_bin'), $r('app.media.recycle'))
    ];
    return firstGridData;
  }

  getSecondGridData(): Array<MenuData> {
    let secondGridData: MenuData[] = [
      new MenuData($r('app.string.mainPage_top'), $r('app.media.top'), $r('app.string.mainPage_text_top')),
      new MenuData($r('app.string.mainPage_new'), $r('app.media.new'), $r('app.string.mainPage_text_new')),
      new MenuData($r('app.string.mainPage_brand'), $r('app.media.brand'), $r('app.string.mainPage_text_brand')),
      new MenuData($r('app.string.mainPage_found'), $r('app.media.found'), $r('app.string.mainPage_text_found'))
    ];
    return secondGridData;
  }

  getSettingListData(): Array<MenuData> {
    let settingListData: MenuData[] = [
      new MenuData($r('app.string.setting_list_news'), $r('app.media.news'), null, 0),
      new MenuData($r('app.string.setting_list_data'), $r('app.media.data'), null, 1),
      new MenuData($r('app.string.setting_list_menu'), $r('app.media.menu'), null, 2),
      new MenuData($r('app.string.setting_list_about'), $r('app.media.about'), null, 3),
      new MenuData($r('app.string.setting_list_storage'), $r('app.media.storage'), null, 4),
      new MenuData($r('app.string.setting_list_privacy'), $r('app.media.privacy'), null, 5)
    ];
    return settingListData;
  }
}

export default new MainVM()