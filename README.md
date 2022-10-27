# Global sensitivity analysis for climate/land-use change co-extinctions analysis
<a href="https://doi.org/10.5281/zenodo.7255957"><img src="https://zenodo.org/badge/558146442.svg" alt="DOI"></a>
<img align="right" src="network.png" alt="network icon" width="300" style="margin-top: 20px">

Prof <a href="https://globalecologyflinders.com/people/#DIRECTOR">Corey J. A. Bradshaw</a> <br>
<a href="http://globalecologyflinders.com" target="_blank">Global Ecology</a> | <em><a href="https://globalecologyflinders.com/partuyarta-ngadluku-wardli-kuu/" target="_blank">Partuyarta Ngadluku Wardli Kuu</a></em>, <a href="http://flinders.edu.au" target="_blank">Flinders University</a>, Adelaide, Australia <br>
October 2022 <br>
<a href=mailto:corey.bradshaw@flinders.edu.au>e-mail</a> <br>
<br>

accompanies paper:

<br>

<a href="https://www.researchgate.net/profile/Giovanni-Strona">STRONA, G</a>, <a href="https://globalecologyflinders.com/people/#DIRECTOR">CJA BRADSHAW</a>. In review. Co-extinctions dominate future vertebrate losses from climate and land-use change. <em>Science Advances</em>

### Abstract
Although theory identifies co-extinctions as a main driver of biodiversity loss, their role at the planetary scale has yet to be estimated. We subjected a global model of interconnected terrestrial vertebrate food webs to future (2020–2100) climate and land-use changes. We predict a 17.6% (± 0.16% SE) average reduction of local vertebrate diversity globally by 2100, with co-extinctions increasing the effect of primary extinctions by 184.2% (± 10.9% SE) on average under an intermediate emissions scenario. Communities will lose up to a half of ecological interactions, thus reducing trophic complexity, network connectance, and community resilience. The model reveals that the extreme toll of global change for vertebrate diversity might be of secondary importance compared to the damages to ecological network structure. 

### Script

- <code>coextCCglobalSensitivityAnalysis.R</code>: a series of boosted regression tree emulators to examine the effect of variation in 6 model parameters on the total biodiversity loss predicted in simulations including both primary extinctions (from exceeding thermal tolerances) and the ensuing co-extinctions
- full Python script for main paper available <a href="https://github.com/cjabradshaw/global_coextinctions">here</a>

Variables include:

- threshold for functional compatibility (<em>c<sub>f</sub></em>)
- relationship between vertebrate body mass and vulnerability to land-use change (<em>V<sub>LUC</sub></em>)
- species adaptation factor (<em>C<sub>adp</sub></em>)
- number of steps in the burn-in phase (<em>s<sub>b-i</sub></em>)
- species adaptation probability (<em>p<sub>adp</sub></em>)
- shape of the response curves of local diversity vs. land-use change (<em>S<sub>LUC</sub></em>)

### Data

- place 'data_for_sensitivity.csv' in the same directory as the R script above
