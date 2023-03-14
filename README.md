# CS306Project_Group10

CS306 Project: Energy Production and Emissions
Our CS306 project will be focusing on analyzing energy production by
countries, seperated by sources, while also taking a look at carbon emissions,
pollution and ozone layer health.
We will have 3 entity types:
- Energy, which includes:
Year, Clean Energy, Dirty Energy, CO2 Emissions
- Countries, which includes:
Name, ISO Code
- Population, which includes:
Year, Amount
Our relationships will be:
Energy → consumes --- Countries
Population → has --- Countries
Using these we can have a useful table to analyze the emissions by country
and even compare them per capita.
We have erased duplicate data and also deleted data that does not fit the
other tables during our data clean-up.
