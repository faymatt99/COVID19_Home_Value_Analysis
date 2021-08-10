statesmenu = c()

shinyUI(
    dashboardPage(
        dashboardHeader(title = "Hello"),
        dashboardSidebar(
            sidebarMenu(
                menuItem("Introduction", tabName = "intro"),
                menuItem("County Selector", tabName = "counties"),
                menuItem("Map View", tabName = "mapview"),
                menuItem("Analysis", tabName = "analysis")
                )
            ),
        dashboardBody(tabItems(
            tabItem(tabName = 'intro',
                    
                    
            ),
            tabItem(tabName = 'counties',
                    fluidPage(
                        fluidRow(
                            box(width = 5, 
                                selectizeInput("state", "State:", choices = NULL),
                                selectizeInput("county", "County:", choices = NULL)
                                )
                        )
                    )
                        
                        
            )
        )
        )
    )
)
