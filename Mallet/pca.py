import pandas as pd
from sklearn.decomposition import PCA
from sklearn.feature_selection import VarianceThreshold
import matplotlib.pyplot as plt
# read tsv into dataframe, includes header row by default
df = pd.read_csv('debate_composition.tsv', sep='\t')
# print(df['speaker'])
# make a copy
df_vectors = df.copy()
# remove the non-data columns
for i in ['id','filename','speaker']:
    del df_vectors[i]
# print(df_vectors['0'])
# total variance of a column ~~ how from the mean is each value, squared, summed, divided by number of terms
# see sklearn documentation
# pretty hit or miss with these data!
sel = VarianceThreshold(threshold=.0004974)
new_features = sel.fit_transform(df_vectors)
# this does it all!
pca = PCA(n_components=2)
# the preceding just creates the frame; now do the math
pca.fit(new_features)
# amount of variation captured
# print(pca.explained_variance_ratio_)
# transform the data according to the fit
# output x/y pairs, one for each row
results = pca.transform(new_features)
# print(results)
# capture the 0 and 1 columns to plot all x's and y's at once
x_values = [i[0] for i in results]
y_values = [i[1] for i in results]
plt.scatter(x_values, y_values)
plt.show()