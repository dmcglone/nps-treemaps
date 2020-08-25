library(tidyverse)
library(highcharter)
library(RColorBrewer)
library(viridisLite)


options(highcharter.theme = hc_theme_smpl(tooltip = list(valueDecimals = 2)))

# Treemap for national park area
hc_area <- cd_parks_total_area_for_dw %>%
  hchart(
    "treemap", 
    hcaes(x = label, value = Value, color = Value)
  ) %>%
  hc_colorAxis(minColor = "#fefaca",
               maxColor = "#008b15") %>%
  hc_title(text = "National Park Land by Congressional District") %>% 
  hc_tooltip(pointFormat = "<b>{point.name}</b><br>
                             Square Miles: {point.value:,.0f}") %>%
  hc_add_theme(hc_theme_538())
hc_area

# Treemap for national park sites
hc_sites <- cd_parks_total_sites_for_dw %>%
  hchart(
    "treemap", 
    hcaes(x = label, value = count, color = count)
  ) %>%
  #hc_colors(cols) %>%
  hc_colorAxis(minColor = "#fefaca",
               maxColor = "#008b15") %>%
  hc_title(text = "National Park Sites by Congressional District") %>% 
  hc_tooltip(pointFormat = "<b>{point.name}</b><br>
                             Number of Sites: {point.value:,.0f}") %>%
  hc_add_theme(hc_theme_538())
hc_sites


