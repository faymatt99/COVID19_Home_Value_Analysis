function(input, output, session){
    
    # County Visualizations
    
    output$local_apple = renderPlot(
        df %>% plot_ly(x = ~date, y = ~monthly_driving, type = 'scatter', mode = 'lines', name = 'driving') %>%
            add_trace(y = ~monthly_public, mode = 'lines', name = 'public transit') %>% 
            add_trace(y = ~monthly_walking, mode = 'lines', name = 'walking') %>%
            layout(title = 'Apple Maps Activity',
                   xaxis = list(title = 'Date',
                                zeroline = TRUE),
                   yaxis = list(title = '% change, normalized to Jan 2020'))
    )
    
    output$local_google = renderPlot(
        df %>% plot_ly(x = ~date, y = ~monthly_work, type = 'scatter', mode = 'lines', name = 'workspaces') %>%
            add_trace(y = ~monthly_ret_rec, mode = 'lines', name = 'retail + recreation') %>%
            add_trace(y = ~monthly_parks, mode = 'lines', name = 'parks') %>% 
            add_trace(y = ~monthly_res, mode = 'lines', name = 'residential') %>% 
            add_trace(y = ~monthly_transit, mode = 'lines', name = 'transit stations') %>% 
            add_trace(y = ~monthly_gro_pharm, mode = 'lines', name = 'grocery + pharmacy') %>%
            layout(title = 'Google Maps Activity, Selected Community Sectors',
                   xaxis = list(title = 'Date',
                                zeroline = TRUE),
                   yaxis = list(title = '% change, normalized to Jan 2020'))
    )

    output$local_zhvi = renderPlot(
    df %>% plot_ly(x = ~date, y = ~mid_norm, type = 'scatter',  mode = 'lines', name = 'Top third') %>%
        add_trace(y = ~high_norm, mode = 'lines', name = 'Middle third') %>% 
        add_trace(y = ~low_norm, mode = 'lines', name = 'Bottom third') %>%
        layout(title = 'Zillow Home Value Index, Bronx County, NY',
               xaxis = list(title = 'Date',
                            zeroline = TRUE),
               yaxis = list(title = '% change, normalized to Jan 2020'))
    )
    
    updateSelectizeInput(session, 'state', choices = df2$state)
    updateSelectizeInput(session, 'county', choices = (df2 %>% filter(state == input$state))$county)
    

}
    