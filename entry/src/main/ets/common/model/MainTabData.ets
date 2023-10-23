export class MainTabData {
  title: string
  icon: Resource
  selectedIcon: Resource

  constructor(title: string, icon: Resource, selectedIcon: Resource) {
    this.title = title
    this.icon = icon
    this.selectedIcon = selectedIcon
  }
}