# Data Collector: CSV Summarizer

`datacollector.sh` is a Bash script for automatically downloading, extracting, and summarizing tabular datasets from the [UCI Machine Learning Respository](https://archive.ics.uci.edu/). It generates a clean `summary.md` report that includes feature listings and basic statistics (min, max, mean, standard deviation) for numerical columns.




## Requirements

    1. Bash shell (Linux/macOS or WSL on Windows)

    2. 'wget', 'awk', 'sed', and 'unzip' installed




## Installation

Clone the assignment repository and navigate into the `cs131/a2/` directory:

```bash
git clone https://github.com/rdawg101/cs131.git
cd cs131/a2

Make sure the script is executable by running the command:
chmod +x datacollector.sh




## Usage

Run the script with:

./datacollector.sh


You will be prompted to:

    1. Enter a URL pointing to a tabular dataset hosted on the UCI Machine Learning Respository
    
    2. Enter the column index numbers for numerical feautures within each .csv file to be shown in the summary table
    (A list of headers with their associated indices will be displayed to the user)

After processing, a summary.md file will be generated in the same directory. You can see the summary file
by running:

cat summary.md




## Example Output

# Feature Summary for winequality-red.csv

## Feature Index and Names
1. fixed acidity
2. volatile acidity
3. citric acid
4. residual sugar
5. chlorides
6. free sulfur dioxide
7. total sulfur dioxide
8. density
9. pH
10. sulphates
11. alcohol
12. quality

## Statistics (Numerical Features)
| Index | Feature           | Min   | Max   | Mean   | StdDev |
|-------|-------------------|-------|-------|--------|--------|
| 1     | fixed acidity      | 4.60 | 15.90 | 8.320 | 1.741 |
| 2     | volatile acidity   | 0.12 | 1.58 | 0.528 | 0.179 |
| 3     | citric acid        | 0.00 | 1.00 | 0.271 | 0.195 |
| 4     | residual sugar     | 0.90 | 15.50 | 2.539 | 1.409 |
| 5     | chlorides          | 0.01 | 0.61 | 0.087 | 0.047 |
| 6     | free sulfur dioxide | 1.00 | 72.00 | 15.875 | 10.457 |
| 7     | total sulfur dioxide | 6.00 | 289.00 | 46.468 | 32.885 |
| 8     | density            | 0.99 | 1.00 | 0.997 | 0.002 |
| 9     | pH                 | 2.74 | 4.01 | 3.311 | 0.154 |
| 10    | sulphates          | 0.33 | 2.00 | 0.658 | 0.169 |
| 11    | alcohol            | 8.40 | 14.90 | 10.423 | 1.065 |
| 12    | quality            | 3.00 | 8.00 | 5.636 | 0.807 |

# Feature Summary for winequality-white.csv

## Feature Index and Names
1. fixed acidity
2. volatile acidity
3. citric acid
4. residual sugar
5. chlorides
6. free sulfur dioxide
7. total sulfur dioxide
8. density
9. pH
10. sulphates
11. alcohol
12. quality

## Statistics (Numerical Features)
| Index | Feature           | Min   | Max   | Mean   | StdDev |
|-------|-------------------|-------|-------|--------|--------|
| 1     | fixed acidity      | 3.80 | 14.20 | 6.855 | 0.844 |
| 2     | volatile acidity   | 0.08 | 1.10 | 0.278 | 0.101 |
| 3     | citric acid        | 0.00 | 1.66 | 0.334 | 0.121 |
| 4     | residual sugar     | 0.60 | 65.80 | 6.391 | 5.072 |
| 5     | chlorides          | 0.01 | 0.35 | 0.046 | 0.022 |
| 6     | free sulfur dioxide | 2.00 | 289.00 | 35.308 | 17.005 |
| 7     | total sulfur dioxide | 9.00 | 440.00 | 138.361 | 42.494 |
| 8     | density            | 0.99 | 1.04 | 0.994 | 0.003 |
| 9     | pH                 | 2.72 | 3.82 | 3.188 | 0.151 |
| 10    | sulphates          | 0.22 | 1.08 | 0.490 | 0.114 |
| 11    | alcohol            | 8.00 | 14.20 | 10.514 | 1.230 |
| 12    | quality            | 3.00 | 9.00 | 5.878 | 0.886 |
