slide <- dashboardSidebar(
  uiOutput("a"),
  sidebarMenu(
    id = "sbId",
    menuItem(text = "Dashboard", tabName = "one", icon = icon("dashboard")),
    menuItem("Data",tabName = "two", icon = icon("th")),
    menuItem("Audit Report",tabName = "thr", icon = icon("th")),
    menuItem("EDA",tabName = "four", icon = icon("th")),
    menuItem("Forecasting Model",tabName = "five", icon = icon("th"))
  ))