# Contriview API   

This API is inteded to support the Contriview project, which aims to visualize data to reveal the fundamental role immigrants play in our communities. 

The API returns immigrant population totals, which can be used to analyize economic contribution.

# API Endpoints

For a list of all U.S. states with total population, and total immigrant population, you can use the root: `https://ronchon-saucisson-75193.herokuapp.com/`.

To retrieve the counties in each state, use this endpoint: 
`https://ronchon-saucisson-75193.herokuapp.com/state/<state_name>`.

To retrieve data on each individual county, use this endpoint: 
`https://ronchon-saucisson-75193.herokuapp.com/county/<state_name>/<county_name>`

All data sources from [US Census](http://api.census.gov/data/2015/acs5/)
