## Ridge Keel Porosity – Historical Dataset & Seasonal Analysis

This MATLAB script compiles published observations of **first-year sea-ice ridge keel macroporosity (pₖ)** and analyses their seasonal evolution across the Arctic.

### Methodology

- Literature data are harmonized into a unified table structure (`time`, `p_k`, metadata)
- Where not directly reported, keel porosity is computed as:
  
  p_k = p_r · (h_k − h_c) / h_k  

  where:
  - `h_k` — keel depth  
  - `h_c` — consolidated layer thickness  
  - `p_r` — rubble porosity  

- Observation dates are transformed into a **normalized seasonal coordinate** (“seasonal day”), referenced to a fixed ice-season start (default: 15 August)

- Data are grouped into predefined seasonal bins, and for each bin:
  - Median pₖ  
  - Interquartile range (IQR)

- Results are visualized as:
  - Scatter points grouped by source  
  - Horizontal median lines  
  - Shaded IQR envelopes  
  - Embedded table of seasonal statistics  

### Output

- Publication-ready figure showing:
  - Multi-source observations of keel porosity  
  - Seasonal median trend with variability (IQR)  
  - In-figure summary table  

### Data sources

- Guzenko et al. (2025), IJOPE — https://doi.org/10.17736/ijope.2025.jc943  
- Guzenko et al. (2026), JOES — https://doi.org/10.1016/j.joes.2026.03.004  
- Bonath (2018), Cold Regions Sci. Technol. — https://doi.org/10.1016/j.coldregions.2018.08.011  
- Ervik et al. (2018), Cold Regions Sci. Technol. — https://doi.org/10.1016/j.coldregions.2018.03.024  
- Høyland (2002), Cold Regions Sci. Technol. — https://doi.org/10.1016/S0165-232X(02)00002-2  
- Salganik et al. (2023), Elementa — https://doi.org/10.1525/elementa.2023.00008  
- Kharitonov (2012), Cold Regions Sci. Technol. — https://doi.org/10.1016/j.coldregions.2012.05.018  
- Kharitonov (2005), POAC — https://poac.com/PapersOnline.html  
- Bonnemaire et al. (2003), POAC — https://poac.com/PapersOnline.html  
- Strub-Klein et al. (2009), POAC — https://poac.com/PapersOnline.html  
- Kharitonov & Morev (2005), POAC — https://poac.com/PapersOnline.html  
- Sand et al. (2015), POAC / ColdTech — https://poac.com/PapersOnline.html  

### Notes

- Some parameters (e.g., `h_i`, `p_r`) are **derived or approximated** when not explicitly reported; assumptions are documented in the script.
- POAC datasets are referenced via the conference archive where individual DOIs are unavailable.
