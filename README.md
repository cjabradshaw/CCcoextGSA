# Global sensitivity analysis for climate/land-use change co-extinctions analysis

accompanies paper:

<br>

STRONA, G, CJA BRADSHAW. In review. Co-extinctions dominate future vertebrate losses from climate and land-use change. <em>Science Advances</em>

### Script
- <code>coextCCglobalSensitivityAnalysis.R</code>: a series of boosted regression tree emulators to examine the effect of variation in 6 model parameters on the total biodiversity loss predicted in simulations including both primary extinctions (from exceeding thermal tolerances) and the ensuing co-extinctions

Variables include:

- threshold for functional compatibility (<em>c<sub>f</sub></em>)
- relationship between vertebrate body mass and vulnerability to land-use change (<em>V<sub>LUC</sub></em>)
- species adaptation factor (<em>C<sub>adp</sub></em>)
- number of steps in the burn-in phase (<em>s<sub>b-i</sub></em>)
- species adaptation probability (<em>p<sub>adp</sub></em>)
- shape of the response curves of local diversity vs. land-use change (<em>S<sub>LUC</sub></em>)

### Data
- place 'data_for_sensitivty.csv' in the same directory as the R script above
