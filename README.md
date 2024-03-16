Download of R package：
library(devtools)
install_github("https://github.com/songyang0106/UAMOCS")

Import of R package：
library(UAMOCS)

The parameters of the function predUAMOCS(data,if_scale):
(1) "data" is a dataframe that rownames corresponding to gene symbol and colnames corresponding to sample id.
(2) "if_scale" is a logical value with a default value of TRUE. If if_scale is true, then standardize data using z-score normalization.


