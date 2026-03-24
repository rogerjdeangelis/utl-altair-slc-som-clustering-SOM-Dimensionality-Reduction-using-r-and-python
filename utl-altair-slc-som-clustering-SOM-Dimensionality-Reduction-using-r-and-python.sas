%let pgm=utl-altair-slc-som-clustering-SOM-Dimensionality-Reduction-using-r-and-python;

%stop_submission;

Way beyond my comfort zone.
Could not get R and Python to agree?

Altair slc som clustering SOM Dimensionality Reduction using r and python

Graphic output
https://github.com/rogerjdeangelis/utl-altair-slc-som-clustering-SOM-Dimensionality-Reduction-using-r-and-python/blob/main/iris_som_codes.png
https://github.com/rogerjdeangelis/utl-altair-slc-som-clustering-SOM-Dimensionality-Reduction-using-r-and-python/blob/main/iris_som_counts.png
https://github.com/rogerjdeangelis/utl-altair-slc-som-clustering-SOM-Dimensionality-Reduction-using-r-and-python/blob/main/iris_som_sepal.png
https://github.com/rogerjdeangelis/utl-altair-slc-som-clustering-SOM-Dimensionality-Reduction-using-r-and-python/blob/main/iris_som_umatrix.png

Altair community
https://community.altair.com/discussion/42426/som-clustering?tab=all

/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

libname workx "d:/wpswrkx"; /*---place in autoexec ---*/

proc datasets lib=workx kill;
run;

options validvarname=v7;
data workx.iris;
 retain Sepal_Length Sepal_Width Petal_Length Petal_Width Species ;
 informat Species $11.;
 input
 Sepal_Length Sepal_Width Petal_Length Petal_Width Species @@;
cards4;
5.1 3.5 1.4 0.2 setosa 7.0 3.2 4.7 1.4 versicolor 6.3 3.3 6.0 2.5 virginica
4.9 3.0 1.4 0.2 setosa 6.4 3.2 4.5 1.5 versicolor 5.8 2.7 5.1 1.9 virginica
4.7 3.2 1.3 0.2 setosa 6.9 3.1 4.9 1.5 versicolor 7.1 3.0 5.9 2.1 virginica
4.6 3.1 1.5 0.2 setosa 5.5 2.3 4.0 1.3 versicolor 6.3 2.9 5.6 1.8 virginica
5.0 3.6 1.4 0.2 setosa 6.5 2.8 4.6 1.5 versicolor 6.5 3.0 5.8 2.2 virginica
5.4 3.9 1.7 0.4 setosa 5.7 2.8 4.5 1.3 versicolor 7.6 3.0 6.6 2.1 virginica
4.6 3.4 1.4 0.3 setosa 6.3 3.3 4.7 1.6 versicolor 4.9 2.5 4.5 1.7 virginica
5.0 3.4 1.5 0.2 setosa 4.9 2.4 3.3 1.0 versicolor 7.3 2.9 6.3 1.8 virginica
4.4 2.9 1.4 0.2 setosa 6.6 2.9 4.6 1.3 versicolor 6.7 2.5 5.8 1.8 virginica
4.9 3.1 1.5 0.1 setosa 5.2 2.7 3.9 1.4 versicolor 7.2 3.6 6.1 2.5 virginica
5.4 3.7 1.5 0.2 setosa 5.0 2.0 3.5 1.0 versicolor 6.5 3.2 5.1 2.0 virginica
4.8 3.4 1.6 0.2 setosa 5.9 3.0 4.2 1.5 versicolor 6.4 2.7 5.3 1.9 virginica
4.8 3.0 1.4 0.1 setosa 6.0 2.2 4.0 1.0 versicolor 6.8 3.0 5.5 2.1 virginica
4.3 3.0 1.1 0.1 setosa 6.1 2.9 4.7 1.4 versicolor 5.7 2.5 5.0 2.0 virginica
5.8 4.0 1.2 0.2 setosa 5.6 2.9 3.6 1.3 versicolor 5.8 2.8 5.1 2.4 virginica
5.7 4.4 1.5 0.4 setosa 6.7 3.1 4.4 1.4 versicolor 6.4 3.2 5.3 2.3 virginica
5.4 3.9 1.3 0.4 setosa 5.6 3.0 4.5 1.5 versicolor 6.5 3.0 5.5 1.8 virginica
5.1 3.5 1.4 0.3 setosa 5.8 2.7 4.1 1.0 versicolor 7.7 3.8 6.7 2.2 virginica
5.7 3.8 1.7 0.3 setosa 6.2 2.2 4.5 1.5 versicolor 7.7 2.6 6.9 2.3 virginica
5.1 3.8 1.5 0.3 setosa 5.6 2.5 3.9 1.1 versicolor 6.0 2.2 5.0 1.5 virginica
5.4 3.4 1.7 0.2 setosa 5.9 3.2 4.8 1.8 versicolor 6.9 3.2 5.7 2.3 virginica
5.1 3.7 1.5 0.4 setosa 6.1 2.8 4.0 1.3 versicolor 5.6 2.8 4.9 2.0 virginica
4.6 3.6 1.0 0.2 setosa 6.3 2.5 4.9 1.5 versicolor 7.7 2.8 6.7 2.0 virginica
5.1 3.3 1.7 0.5 setosa 6.1 2.8 4.7 1.2 versicolor 6.3 2.7 4.9 1.8 virginica
4.8 3.4 1.9 0.2 setosa 6.4 2.9 4.3 1.3 versicolor 6.7 3.3 5.7 2.1 virginica
5.0 3.0 1.6 0.2 setosa 6.6 3.0 4.4 1.4 versicolor 7.2 3.2 6.0 1.8 virginica
5.0 3.4 1.6 0.4 setosa 6.8 2.8 4.8 1.4 versicolor 6.2 2.8 4.8 1.8 virginica
5.2 3.5 1.5 0.2 setosa 6.7 3.0 5.0 1.7 versicolor 6.1 3.0 4.9 1.8 virginica
5.2 3.4 1.4 0.2 setosa 6.0 2.9 4.5 1.5 versicolor 6.4 2.8 5.6 2.1 virginica
4.7 3.2 1.6 0.2 setosa 5.7 2.6 3.5 1.0 versicolor 7.2 3.0 5.8 1.6 virginica
4.8 3.1 1.6 0.2 setosa 5.5 2.4 3.8 1.1 versicolor 7.4 2.8 6.1 1.9 virginica
5.4 3.4 1.5 0.4 setosa 5.5 2.4 3.7 1.0 versicolor 7.9 3.8 6.4 2.0 virginica
5.2 4.1 1.5 0.1 setosa 5.8 2.7 3.9 1.2 versicolor 6.4 2.8 5.6 2.2 virginica
5.5 4.2 1.4 0.2 setosa 6.0 2.7 5.1 1.6 versicolor 6.3 2.8 5.1 1.5 virginica
4.9 3.1 1.5 0.2 setosa 5.4 3.0 4.5 1.5 versicolor 6.1 2.6 5.6 1.4 virginica
5.0 3.2 1.2 0.2 setosa 6.0 3.4 4.5 1.6 versicolor 7.7 3.0 6.1 2.3 virginica
5.5 3.5 1.3 0.2 setosa 6.7 3.1 4.7 1.5 versicolor 6.3 3.4 5.6 2.4 virginica
4.9 3.6 1.4 0.1 setosa 6.3 2.3 4.4 1.3 versicolor 6.4 3.1 5.5 1.8 virginica
4.4 3.0 1.3 0.2 setosa 5.6 3.0 4.1 1.3 versicolor 6.0 3.0 4.8 1.8 virginica
5.1 3.4 1.5 0.2 setosa 5.5 2.5 4.0 1.3 versicolor 6.9 3.1 5.4 2.1 virginica
5.0 3.5 1.3 0.3 setosa 5.5 2.6 4.4 1.2 versicolor 6.7 3.1 5.6 2.4 virginica
4.5 2.3 1.3 0.3 setosa 6.1 3.0 4.6 1.4 versicolor 6.9 3.1 5.1 2.3 virginica
4.4 3.2 1.3 0.2 setosa 5.8 2.6 4.0 1.2 versicolor 5.8 2.7 5.1 1.9 virginica
5.0 3.5 1.6 0.6 setosa 5.0 2.3 3.3 1.0 versicolor 6.8 3.2 5.9 2.3 virginica
5.1 3.8 1.9 0.4 setosa 5.6 2.7 4.2 1.3 versicolor 6.7 3.3 5.7 2.5 virginica
4.8 3.0 1.4 0.3 setosa 5.7 3.0 4.2 1.2 versicolor 6.7 3.0 5.2 2.3 virginica
5.1 3.8 1.6 0.2 setosa 5.7 2.9 4.2 1.3 versicolor 6.3 2.5 5.0 1.9 virginica
4.6 3.2 1.4 0.2 setosa 6.2 2.9 4.3 1.3 versicolor 6.5 3.0 5.2 2.0 virginica
5.3 3.7 1.5 0.2 setosa 5.1 2.5 3.0 1.1 versicolor 6.2 3.4 5.4 2.3 virginica
5.0 3.3 1.4 0.2 setosa 5.7 2.8 4.1 1.3 versicolor 5.9 3.0 5.1 1.8 virginica
;;;;
run;

proc sort data=workx.iris;
 by species;
run;

/*       _
/ |  ___| | ___   _ __  _ __ ___   ___   _ __
| | / __| |/ __| | `_ \| `__/ _ \ / __| | `__|
| | \__ \ | (__  | |_) | | | (_) | (__  | |
|_| |___/_|\___| | .__/|_|  \___/ \___| |_|
                 |_|
*/

/**************************************************************************************************************************/
/*  WORKX.IRIS total obs=150                                                                                              */
/*        species_    sepal_    sepal_    petal_    petal_                                                                */
/* Obs      name      length     width    length     width    species                                                     */
/*                                                                                                                        */
/*   1     setosa       5.1       3.5       1.4       0.2        0                                                        */
/*   2     setosa       4.9       3.0       1.4       0.2        0                                                        */
/*   3     setosa       4.7       3.2       1.3       0.2        0                                                        */
/*   4     setosa       4.6       3.1       1.5       0.2        0                                                        */
/*   5     setosa       5.0       3.6       1.4       0.2        0                                                        */
/* ...                                                                                                                    */
/* 146     virginica    6.7       3.0       5.2       2.3        2                                                        */
/* 147     virginica    6.3       2.5       5.0       1.9        2                                                        */
/* 148     virginica    6.5       3.0       5.2       2.0        2                                                        */
/* 149     virginica    6.2       3.4       5.4       2.3        2                                                        */
/* 150     virginica    5.9       3.0       5.1       1.8        2                                                        */
/**************************************************************************************************************************/

can you convert r code to python using python packages minsom. Does not have to reproduce all the outputs

%utlfkil(d:/png/iris_som_umatrix.png);
%utlfkil(d:/png/iris_som_counts.png);
%utlfkil(d:/png/iris_som_codes.png);
%utlfkil(d:/png/iris_som_sepal.png);

options set=RHOME "C:\Progra~1\R\R-4.5.2\bin\r";
proc r;
export data=workx.iris r=iris;
submit;
# Load library
library(kohonen)

# Scale iris features
data_scaled <- scale(iris[,1:4])

# 5x5 hexagonal grid
som_grid <- somgrid(xdim=5, ydim=5, topo="hexagonal")

# Use supersom directly
som_model <- supersom(
  data = list(X = data_scaled),
  grid = som_grid,
  rlen = 200,
  alpha = c(0.05, 0.01),
  keep.data = TRUE
)

# Save plots - create directory first
png("d:/png/iris_som_umatrix.png");
plot(som_model, type="dist.neighbours", main="Iris U-Matrix");
dev.off()

png("d:/png/iris_som_counts.png");
plot(som_model, type="counts", main="Iris Data Mapping");
dev.off()

png("d:/png/iris_som_codes.png");
plot(som_model, type="codes", main="SOM Codes");
dev.off()

png("d:/png/iris_som_sepal.png");
plot(som_model, type="property", property=som_model$codes$X[,1],
     main="Sepal.Length Plane");
dev.off()

# Results summary
print(table(som_model$unit.classif))
print(head(som_model$codes$X))


som_codes_df <- data.frame(
  Sepal_Length = som_model$codes$X[,1],
  Sepal_Width  = som_model$codes$X[,2],
  Petal_Length = som_model$codes$X[,3],
  Petal_Width  = som_model$codes$X[,4]
)

# optionally add row names as V1, V2, ...
rownames(som_codes_df) <- paste0("V", 1:nrow(som_codes_df))

# just to check it matches your printed output
print(som_codes_df)

codes<-data.frame(som_model$unit.classif)

endsubmit;
import r=som_codes_df data=workx.som_codes;
import r=codes data=workx.codes;
run;


/**************************************************************************************************************************/
/* Graphic output                                                                                                         */
/*                                                                                                                        */
/* d:/png/iris_som_umatrix.png                                                                                            */
/* d:/png/iris_som_counts.png                                                                                             */
/* d:/png/iris_som_codes.png                                                                                              */
/* d:/png/iris_som_sepal.png                                                                                              */
/*                                                                                                                        */
/*                                                                                                                        */
/* WORKX.SOM_CODES total obs=25                                                                                           */
/*                                                                                                                        */
/*         SEPAL_      SEPAL_      PETAL_      PETAL_                                                                     */
/* Obs     LENGTH       WIDTH      LENGTH       WIDTH                                                                     */
/*                                                                                                                        */
/*   1     0.59034    -1.21562     0.88566     0.60331                                                                    */
/*   2     0.32507    -1.91617     0.39438     0.15910                                                                    */
/*   3    -0.97384    -1.66794    -0.11140    -0.02866                                                                    */
/*   4    -1.43329    -1.44296    -1.16586    -1.02061                                                                    */
/*   5    -1.39597     0.02892    -1.31842    -1.33226                                                                    */
/*  ...                                                                                                                   */
/*  21     2.11067     1.51836     1.49629     1.34485                                                                    */
/*  22     0.89204     0.40826     1.01096     1.45779                                                                    */
/*  23     0.34544     0.50665     0.49577     0.57288                                                                    */
/*  24    -0.38200     1.36061    -0.78712    -0.72402                                                                    */
/*  25    -0.37142     2.49831    -1.32113    -1.23407                                                                    */
/*                                                                                                                        */
/* WORKX.CODES total obs=150                                                                                              */
/*                                                                                                                        */
/*         SOM_MODEL_                                                                                                     */
/* Obs    UNIT_CLASSIF                                                                                                    */
/*                                                                                                                        */
/*   1         15                                                                                                         */
/*   2          5                                                                                                         */
/*   3          5                                                                                                         */
/*   4          5                                                                                                         */
/*   5         15                                                                                                         */
/* ...                                                                                                                    */
/* 146         11                                                                                                         */
/* 147          1                                                                                                         */
/* 148         11                                                                                                         */
/* 149         22                                                                                                         */
/* 150         18                                                                                                         */
/**************************************************************************************************************************/

/*                             _
 _ __  _ __ ___   ___   _ __  | | ___   __ _
| `_ \| `__/ _ \ / __| | `__| | |/ _ \ / _` |
| |_) | | | (_) | (__  | |    | | (_) | (_| |
| .__/|_|  \___/ \___| |_|    |_|\___/ \__, |
|_|                                    |___/
*/

options set=PYTHONHOME "D:\py314";
proc python;
submit;
import pyreadstat as ps
import numpy as np
import pandas as pd
from sklearn.datasets import load_iris
from minisom import MiniSom

iris_df,meta = ps.read_sas7bdat('d:/wpswrkx/iris.sas7bdat')

# 4 numeric columns: Sepal_Length, Sepal_Width, Petal_Length, Petal_Width
features = iris_df[["Sepal_Length", "Sepal_Width", "Petal_Length", "Petal_Width"]]

# Scale (like R scale())
X_scaled = (features - features.mean()) / features.std()

# Use MiniSom on X_scaled.values (no need for iris_sk)
som = MiniSom(x=5, y=5, input_len=4, sigma=1.0, learning_rate=0.5)
som.random_weights_init(X_scaled.values)
som.train(X_scaled.values, 200, verbose=False)

# 1. Codebook units (like workx.som_codes)
# 25 rows (5×5), 4 columns (Sepal_Length, Sepal_Width, Petal_Length, Petal_Width)
codes = som.get_weights()  # shape (5, 5, 4)
codes_flat = codes.reshape(-1, 4)  # 25×4

som_codes_df = pd.DataFrame(
    codes_flat,
    columns=["Sepal_Length", "Sepal_Width", "Petal_Length", "Petal_Width"]
)
som_codes_df.index = [f"V{i+1}" for i in range(len(som_codes_df))]

print("=== SOM codebook (workx.som_codes equivalent) ===")
print(som_codes_df)

# 2. Unit classifications (winner for each observation, like workx.codes)
winner_indices = np.array([som.winner(x) for x in X_scaled.values])  # 2D indices (i, j)
# Flatten to single node index (0..24) if you want a 1D index like R's unit.classif
flat_indices = winner_indices[:, 0] * 5 + winner_indices[:, 1]   # 5×5 grid

codes_df = pd.DataFrame(
    {"SOM_MODEL_UNIT_CLASSIF": flat_indices + 1}   # 1-based like R
)

print("\n=== Unit classifications (workx.codes equivalent) ===")
print(codes_df.head())
endsubmit;
import python=som_codes_df  data=workx.som_codes;
import python=codes_df  data=workx.codes_df;
run;

/*___        _                                           _   _
|___ \   ___| | ___   _ __  _ __ ___   ___   _ __  _   _| |_| |__   ___  _ __
  __) | / __| |/ __| | `_ \| `__/ _ \ / __| | `_ \| | | | __| `_ \ / _ \| `_ \
 / __/  \__ \ | (__  | |_) | | | (_) | (__  | |_) | |_| | |_| | | | (_) | | | |
|_____| |___/_|\___| | .__/|_|  \___/ \___| | .__/ \__, |\__|_| |_|\___/|_| |_|
                     |_|                    |_|    |___/
*/

options set=PYTHONHOME "D:\py314";
proc python;
submit;
import pyreadstat as ps
import numpy as np
import pandas as pd
from sklearn.datasets import load_iris
from minisom import MiniSom

iris_df,meta = ps.read_sas7bdat('d:/wpswrkx/iris.sas7bdat')

# 4 numeric columns: Sepal_Length, Sepal_Width, Petal_Length, Petal_Width
features = iris_df[["Sepal_Length", "Sepal_Width", "Petal_Length", "Petal_Width"]]

# Scale (like R scale())
X_scaled = (features - features.mean()) / features.std()

# Use MiniSom on X_scaled.values (no need for iris_sk)
som = MiniSom(x=5, y=5, input_len=4, sigma=1.0, learning_rate=0.5)
som.random_weights_init(X_scaled.values)
som.train(X_scaled.values, 200, verbose=False)

# 1. Codebook units (like workx.som_codes)
# 25 rows (5×5), 4 columns (Sepal_Length, Sepal_Width, Petal_Length, Petal_Width)
codes = som.get_weights()  # shape (5, 5, 4)
codes_flat = codes.reshape(-1, 4)  # 25×4

som_codes_df = pd.DataFrame(
    codes_flat,
    columns=["Sepal_Length", "Sepal_Width", "Petal_Length", "Petal_Width"]
)
som_codes_df.index = [f"V{i+1}" for i in range(len(som_codes_df))]

print("=== SOM codebook (workx.som_codes equivalent) ===")
print(som_codes_df)

# 2. Unit classifications (winner for each observation, like workx.codes)
winner_indices = np.array([som.winner(x) for x in X_scaled.values])  # 2D indices (i, j)
# Flatten to single node index (0..24) if you want a 1D index like R's unit.classif
flat_indices = winner_indices[:, 0] * 5 + winner_indices[:, 1]   # 5×5 grid

codes_df = pd.DataFrame(
    {"SOM_MODEL_UNIT_CLASSIF": flat_indices + 1}   # 1-based like R
)

print("\n=== Unit classifications (workx.codes equivalent) ===")
print(codes_df.head())
endsubmit;
import python=som_codes_df  data=workx.som_codes;
import python=codes_df  data=workx.codes_df;
run;

/**************************************************************************************************************************/
/*  WORKX.SOM_CODES total obs=25                                                                                          */
/*                                                                                                                        */
/*         SEPAL_      SEPAL_      PETAL_      PETAL_                                                                     */
/* Obs     LENGTH       WIDTH      LENGTH       WIDTH                                                                     */
/*                                                                                                                        */
/*   1     0.61296    -0.53143     0.80139     0.80956                                                                    */
/*   2    -0.46717    -1.03237     0.11140     0.16261                                                                    */
/*   3    -0.13439     0.13198    -0.34156    -0.44195                                                                    */
/*   4    -0.14931    -0.33747     0.29008     0.24858                                                                    */
/*   5     0.16071    -1.05427     0.74006     0.79212                                                                    */
/*  ....                                                                                                                  */
/*  21    -0.50099     2.28826    -1.30586    -1.23893                                                                    */
/*  22    -0.78676     1.60574    -1.22687    -1.24479                                                                    */
/*  23    -1.28681     0.87497    -1.27170    -1.28398                                                                    */
/*  24    -1.60182     0.16595    -1.36588    -1.32160                                                                    */
/*  25    -1.42776    -0.32907    -1.28897    -1.22389                                                                    */
/*                                                                                                                        */
/*                                                                                                                        */
/* WORKX.CODES_DF total obs=150                                                                                           */
/*                                                                                                                        */
/*         SOM_MODEL_                                                                                                     */
/* Obs    UNIT_CLASSIF                                                                                                    */
/*                                                                                                                        */
/*   1         13                                                                                                         */
/*   2         20                                                                                                         */
/*   3         19                                                                                                         */
/*   4         24                                                                                                         */
/*   5         17                                                                                                         */
/* ...                                                                                                                    */
/* 146          6                                                                                                         */
/* 147          5                                                                                                         */
/* 148         11                                                                                                         */
/* 149         11                                                                                                         */
/* 150          7                                                                                                         */
/**************************************************************************************************************************/

/*           _   _                   _
 _ __  _   _| |_| |__   ___  _ __   | | ___   __ _
| `_ \| | | | __| `_ \ / _ \| `_ \  | |/ _ \ / _` |
| |_) | |_| | |_| | | | (_) | | | | | | (_) | (_| |
| .__/ \__, |\__|_| |_|\___/|_| |_| |_|\___/ \__, |
|_|    |___/                                 |___/
*/

1                                          Altair SLC         09:13 Tuesday, March 24, 2026

NOTE: Copyright 2002-2025 World Programming, an Altair Company
NOTE: Altair SLC 2026 (05.26.01.00.000758)
      Licensed to Roger DeAngelis
NOTE: This session is executing on the X64_WIN11PRO platform and is running in 64 bit mode

NOTE: AUTOEXEC processing beginning; file is C:\wpsoto\autoexec.sas
NOTE: AUTOEXEC source line
1       +  ï»¿ods _all_ close;
           ^
ERROR: Expected a statement keyword : found "?"
NOTE: Library workx assigned as follows:
      Engine:        SAS7BDAT
      Physical Name: d:\wpswrkx

NOTE: Library slchelp assigned as follows:
      Engine:        WPD
      Physical Name: C:\Progra~1\Altair\SLC\2026\sashelp

NOTE: Library worksas assigned as follows:
      Engine:        SAS7BDAT
      Physical Name: d:\worksas

NOTE: Library workwpd assigned as follows:
      Engine:        WPD
      Physical Name: d:\workwpd


LOG:  9:13:39
NOTE: 1 record was written to file PRINT

NOTE: The data step took :
      real time : 0.031
      cpu time  : 0.000


NOTE: AUTOEXEC processing completed

1         options set=PYTHONHOME "D:\py314";
2         proc python;
3         submit;
4         import pyreadstat as ps
5         import numpy as np
6         import pandas as pd
7         from sklearn.datasets import load_iris
8         from minisom import MiniSom
9
10        iris_df,meta = ps.read_sas7bdat('d:/wpswrkx/iris.sas7bdat')
11
12        # 4 numeric columns: Sepal_Length, Sepal_Width, Petal_Length, Petal_Width
13        features = iris_df[["Sepal_Length", "Sepal_Width", "Petal_Length", "Petal_Width"]]
14
15        # Scale (like R scale())
16        X_scaled = (features - features.mean()) / features.std()
17
18        # Use MiniSom on X_scaled.values (no need for iris_sk)
19        som = MiniSom(x=5, y=5, input_len=4, sigma=1.0, learning_rate=0.5)
20        som.random_weights_init(X_scaled.values)
21        som.train(X_scaled.values, 200, verbose=False)
22
23        # 1. Codebook units (like workx.som_codes)
24        # 25 rows (5Ã—5), 4 columns (Sepal_Length, Sepal_Width, Petal_Length, Petal_Width)
25        codes = som.get_weights()  # shape (5, 5, 4)
26        codes_flat = codes.reshape(-1, 4)  # 25Ã—4
27
28        som_codes_df = pd.DataFrame(
29            codes_flat,
30            columns=["Sepal_Length", "Sepal_Width", "Petal_Length", "Petal_Width"]
31        )
32        som_codes_df.index = [f"V{i+1}" for i in range(len(som_codes_df))]
33
34        print("=== SOM codebook (workx.som_codes equivalent) ===")
35        print(som_codes_df)
36
37        # 2. Unit classifications (winner for each observation, like workx.codes)
38        winner_indices = np.array([som.winner(x) for x in X_scaled.values])  # 2D indices (i, j)
39        # Flatten to single node index (0..24) if you want a 1D index like R's unit.classif
40        flat_indices = winner_indices[:, 0] * 5 + winner_indices[:, 1]   # 5Ã—5 grid
41
42        codes_df = pd.DataFrame(
43            {"SOM_MODEL_UNIT_CLASSIF": flat_indices + 1}   # 1-based like R
44        )
45
46        print("\n=== Unit classifications (workx.codes equivalent) ===")
47        print(codes_df.head())
48        endsubmit;

NOTE: Submitting statements to Python:


49        import python=som_codes_df  data=workx.som_codes;
NOTE: Creating data set 'WORKX.som_codes' from Python data frame 'som_codes_df'
NOTE: Data set "WORKX.som_codes" has 25 observation(s) and 4 variable(s)

50        import python=codes_df  data=workx.codes_df;
NOTE: Creating data set 'WORKX.codes_df' from Python data frame 'codes_df'
NOTE: Data set "WORKX.codes_df" has 150 observation(s) and 1 variable(s)

51        run;
NOTE: Procedure python step took :
      real time : 2.444
      cpu time  : 0.062


52
53
ERROR: Error printed on page 1

NOTE: Submitted statements took :
      real time : 2.513
      cpu time  : 0.125

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
